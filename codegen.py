"""
Gerador de código COOL -> Jasmin (bytecode JVM; sem .bytecode, o Jasmin usa a versão 45.3, sem StackMapTable).

Entrada : a AST (ast_nodes.py) e o AnalisadorSemantico já executado
          (usamos `analisador.classes` e o atributo `tipo_expr` anotado em cada nó).
Saída   : um arquivo <Classe>.j para cada classe do usuário.

Convenções (ver plano, Fase 0):
  * todo valor COOL é um objeto Java; void = null
  * Object/IO/Int/Bool/String vivem no runtime (CoolObject, CoolIO, CoolInt, CoolBool, CoolString)
  * assinaturas "apagadas": todo parâmetro e retorno de método é LCoolObject;
  * cada método f da classe C vira DOIS métodos JVM:
        public f(LCoolObject;...)LCoolObject;            -> só delega
        public static _s_f(LC;LCoolObject;...)LCoolObject; -> corpo real (self é o slot 0)
    O estático permite o despacho estático (e@T.f()) com invokestatic (Fase 5).
  * classes, construtores e métodos são sempre PUBLIC (CoolRuntime usa reflexão)

Estado do desenvolvimento: Fase 6. Já geram código: literais, `self`, bloco, aritmética,
~, not, comparações, `if`, `while`, variáveis (formais e atributos), atribuição, atributos
com valor padrão/inicializador e despacho completo (dinâmico e estático, com checagem de void).
Faltam: let, case, new, isvoid (Fase 7). Esses levantam NotImplementedError com a linha do fonte.
"""
import os

from ast_nodes import Attribute
from semantic import SELF_TYPE

LIMITE_PILHA = 64          # profundidade de pilha "generosa" (Fase 9: calcular o valor exato)
OBJ = "LCoolObject;"       # descritor do tipo apagado

# operador COOL -> instrução JVM
OPS_ARITMETICOS = {"+": "iadd", "-": "isub", "*": "imul", "/": "idiv"}
OPS_RELACIONAIS = {"<": "if_icmplt", "<=": "if_icmple"}

# classes básicas do COOL -> classes do runtime em Java
CLASSES_RUNTIME = {
    "Object": "CoolObject",
    "IO": "CoolIO",
    "Int": "CoolInt",
    "Bool": "CoolBool",
    "String": "CoolString",
}


def classe_jvm(nome):
    """Nome da classe COOL -> nome da classe JVM."""
    return CLASSES_RUNTIME.get(nome, nome)


def escapar_jasmin(texto):
    """Escapa um texto para ficar entre aspas num `ldc "..."` do Jasmin."""
    saida = []
    for ch in texto:
        o = ord(ch)
        if ch == '"':
            saida.append('\\"')
        elif ch == "\\":
            saida.append("\\\\")
        elif ch == "\n":
            saida.append("\\n")
        elif ch == "\t":
            saida.append("\\t")
        elif ch == "\r":
            saida.append("\\r")
        elif 32 <= o < 127:
            saida.append(ch)
        else:
            saida.append("\\u%04x" % o)
    return "".join(saida)


class GeradorJasmin:
    def __init__(self, programa, analisador):
        self.programa = programa
        self.sem = analisador          # AnalisadorSemantico (já rodou .analisar())
        self.classe_atual = None       # InfoClasse da classe em geração
        self.linhas = []               # texto do arquivo .j em construção
        # estado do método em geração
        self.corpo = []                # instruções do método corrente
        self.escopos = []              # pilha de dicts nome -> slot (Fase 4)
        self.proximo_slot = 0
        self.max_locais = 0
        self.contador_rotulos = 0

    # ------------------------------------------------------------------
    # saída de texto
    # ------------------------------------------------------------------
    def linha(self, texto=""):
        self.linhas.append(texto)

    def emit(self, instrucao):
        """Adiciona uma instrução ao método corrente."""
        self.corpo.append("  " + instrucao)

    def rotulo(self, nome):
        self.corpo.append(nome + ":")

    def novo_rotulo(self, prefixo="L"):
        self.contador_rotulos += 1
        return f"{prefixo}{self.contador_rotulos}"

    def escrever_metodo(self, cabecalho, pilha, locais):
        """Copia self.corpo para o arquivo, com o cabeçalho e os limites do método."""
        self.linha(f".method {cabecalho}")
        self.linha(f"  .limit stack {pilha}")
        self.linha(f"  .limit locals {locais}")
        self.linhas.extend(self.corpo)
        self.linha(".end method")
        self.linha()
        self.corpo = []

    # slots de variáveis locais (usado a partir da Fase 4)
    def iniciar_metodo(self, formais):
        """slot 0 = self; formais nos slots 1..n."""
        self.corpo = []
        escopo = {}
        for i, formal in enumerate(formais, start=1):
            escopo[formal.nome] = i
        self.escopos = [escopo]
        self.proximo_slot = len(formais) + 1
        self.max_locais = self.proximo_slot

    def alocar_slot(self):
        """Reserva um slot de variável local. Para liberar, restaure self.proximo_slot
        ao valor que ele tinha antes das reservas (uso em pilha)."""
        slot = self.proximo_slot
        self.proximo_slot += 1
        self.max_locais = max(self.max_locais, self.proximo_slot)
        return slot

    # ------------------------------------------------------------------
    # ponto de entrada
    # ------------------------------------------------------------------
    def gerar_programa(self, pasta):
        """Gera um .j por classe do usuário em `pasta`; devolve a lista de caminhos."""
        os.makedirs(pasta, exist_ok=True)
        arquivos = []
        for no in self.programa.classes:
            info = self.sem.classes.get(no.nome)
            if info is None or info.no is not no:      # classe rejeitada pelo semântico
                continue
            texto = self.gerar_classe(info)
            caminho = os.path.join(pasta, f"{info.nome}.j")
            with open(caminho, "w", encoding="utf-8") as f:
                f.write(texto)
            arquivos.append(caminho)
        return arquivos

    # ------------------------------------------------------------------
    # classe
    # ------------------------------------------------------------------
    def gerar_classe(self, info):
        self.classe_atual = info
        self.linhas = []
        self.contador_rotulos = 0
        no = info.no

        self.linha(f".class public {info.nome}")
        self.linha(f".super {classe_jvm(info.pai)}")
        self.linha()

        # um campo por atributo, tipo apagado (valor inicial: Fase 4)
        for feature in no.features:
            if isinstance(feature, Attribute):
                self.linha(f".field public {feature.nome} {OBJ}")
        self.linha()

        self.gerar_construtor(info)
        self.gerar_novo(info)
        for feature in no.features:
            if not isinstance(feature, Attribute):
                self.gerar_metodo(feature)
        return "\n".join(self.linhas) + "\n"

    def gerar_construtor(self, info):
        """<init>()V :
             1) chama o construtor do pai (que inicializa os atributos herdados);
             2) dá o valor padrão a TODOS os atributos desta classe;
             3) executa os inicializadores, na ordem de declaração.
        Os passos 2 e 3 são separados porque, no COOL, um inicializador que lê um atributo
        declarado depois dele enxerga o valor padrão."""
        self.iniciar_metodo([])
        self.emit("aload_0")
        self.emit(f"invokespecial {classe_jvm(info.pai)}/<init>()V")

        atributos = [f for f in info.no.features if isinstance(f, Attribute)]
        for attr in atributos:
            self.emitir_valor_padrao(info, attr)
        for attr in atributos:
            if attr.inicializador is not None:
                self.emit("aload_0")
                self.expr(attr.inicializador)
                self.emit(f"putfield {info.nome}/{attr.nome} {OBJ}")

        self.emit("return")
        self.escrever_metodo("public <init>()V", LIMITE_PILHA, self.max_locais)

    def emitir_valor_padrao(self, info, attr):
        """Int -> 0, Bool -> false, String -> "", qualquer outro tipo -> void (null)."""
        self.emit("aload_0")
        if attr.tipo in ("Int", "Bool", "String"):
            classe = classe_jvm(attr.tipo)
            self.emit(f"new {classe}")
            self.emit("dup")
            self.emit(f"invokespecial {classe}/<init>()V")
        else:
            self.emit("aconst_null")
        self.emit(f"putfield {info.nome}/{attr.nome} {OBJ}")

    def gerar_novo(self, info):
        """_novo() : devolve uma instância nova desta classe (usado por `new SELF_TYPE`)."""
        self.iniciar_metodo([])
        self.emit(f"new {info.nome}")
        self.emit("dup")
        self.emit(f"invokespecial {info.nome}/<init>()V")
        self.emit("areturn")
        self.escrever_metodo(f"public _novo()LCoolObject;", 4, self.max_locais)

    # ------------------------------------------------------------------
    # método = método virtual (delega) + método estático (corpo)
    # ------------------------------------------------------------------
    def gerar_metodo(self, metodo):
        info = self.classe_atual
        n = len(metodo.formais)
        desc_virtual = f"({OBJ * n}){OBJ}"
        nome_estatico = f"_s_{metodo.nome}"
        desc_estatico = f"(L{info.nome};{OBJ * n}){OBJ}"

        # 1) método virtual: só repassa self e os argumentos para o estático
        self.iniciar_metodo(metodo.formais)
        for slot in range(n + 1):
            self.emit(f"aload {slot}")
        self.emit(f"invokestatic {info.nome}/{nome_estatico}{desc_estatico}")
        self.emit("areturn")
        self.escrever_metodo(f"public {metodo.nome}{desc_virtual}", n + 1, n + 1)

        # 2) método estático: o corpo de verdade (slot 0 = self, formais em 1..n)
        self.iniciar_metodo(metodo.formais)
        self.expr(metodo.corpo)
        self.emit("areturn")
        self.escrever_metodo(f"public static {nome_estatico}{desc_estatico}",
                             LIMITE_PILHA, self.max_locais)

    # ------------------------------------------------------------------
    # expressões: cada visitante deixa UM valor (CoolObject) no topo da pilha
    # ------------------------------------------------------------------
    def expr(self, no):
        visitante = getattr(self, "expr_" + type(no).__name__, None)
        if visitante is None:
            linha = getattr(no, "linha", "?")
            raise NotImplementedError(
                f"geração de código para '{type(no).__name__}' ainda não implementada (linha {linha})")
        visitante(no)

    # ---- literais ----
    def expr_IntLit(self, no):
        v = no.valor & 0xFFFFFFFF          # literais maiores que 32 bits dão a volta
        if v >= 0x80000000:
            v -= 0x100000000
        self.emit("new CoolInt")
        self.emit("dup")
        self.emit(f"ldc {v}")
        self.emit("invokespecial CoolInt/<init>(I)V")

    def expr_BoolLit(self, no):
        self.emit("new CoolBool")
        self.emit("dup")
        self.emit("iconst_1" if no.valor else "iconst_0")
        self.emit("invokespecial CoolBool/<init>(Z)V")

    def expr_StringLit(self, no):
        # no.valor já vem decodificado (sem aspas, com os escapes processados) do parser
        self.emit("new CoolString")
        self.emit("dup")
        self.emit(f'ldc "{escapar_jasmin(no.valor)}"')
        self.emit("invokespecial CoolString/<init>(Ljava/lang/String;)V")

    # ---- variáveis e atribuição (Fase 4) ----
    def resolver_variavel(self, nome):
        """Onde mora a variável `nome` no ponto atual do código?
        Devolve ("local", slot) para formais/let/case (escopo mais interno primeiro),
        ("atributo", classe_dona) para atributos (da classe atual ou herdados),
        ou None se não existir. A classe dona é onde o atributo foi DECLARADO,
        que é o que getfield/putfield precisam."""
        for escopo in reversed(self.escopos):
            if nome in escopo:
                return ("local", escopo[nome])
        for classe in self.sem.ancestrais(self.classe_atual.nome):
            if nome in self.sem.classes[classe].atributos:
                return ("atributo", classe)
        return None

    def expr_Id(self, no):
        if no.nome == "self":
            self.emit("aload_0")
            return
        var = self.resolver_variavel(no.nome)
        if var is None:   # o semântico já deveria ter rejeitado
            raise RuntimeError(f"identificador '{no.nome}' não resolvido na geração de código")
        tipo, info = var
        if tipo == "local":
            self.emit(f"aload {info}")
        else:
            self.emit("aload_0")
            self.emit(f"getfield {info}/{no.nome} {OBJ}")

    def expr_Assign(self, no):
        """A atribuição também é uma expressão: o valor atribuído fica na pilha."""
        var = self.resolver_variavel(no.nome)
        if var is None:
            raise RuntimeError(f"identificador '{no.nome}' não resolvido na geração de código")
        tipo, info = var
        if tipo == "local":
            self.expr(no.valor)
            self.emit("dup")
            self.emit(f"astore {info}")
        else:
            self.emit("aload_0")                 # pilha: obj
            self.expr(no.valor)                  # pilha: obj, valor
            self.emit("dup_x1")                  # pilha: valor, obj, valor
            self.emit(f"putfield {info}/{no.nome} {OBJ}")   # pilha: valor

    # ---- bloco ----
    def expr_Block(self, no):
        for i, e in enumerate(no.exprs):
            self.expr(e)
            if i < len(no.exprs) - 1:
                self.emit("pop")           # só o valor da última expressão interessa

    # ---- despacho (Fase 5) ----
    def classe_declarante(self, classe, metodo):
        """Primeira classe, subindo a partir de `classe`, que DECLARA o método `metodo`."""
        for c in self.sem.ancestrais(classe):
            if metodo in self.sem.classes[c].metodos:
                return c
        raise RuntimeError(f"método '{metodo}' não encontrado a partir de '{classe}'")

    def verificar_nao_void(self, metodo):
        """Com o receptor no topo da pilha: se for void (null), lança o erro de execução."""
        l_ok = self.novo_rotulo("Lnaovoid")
        self.emit("dup")
        self.emit(f"ifnonnull {l_ok}")
        self.emit(f'ldc "{metodo}"')
        self.emit("invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;")
        self.emit("athrow")
        self.rotulo(l_ok)

    def expr_Dispatch(self, no):
        """e0.f(e1..en) e e0@T.f(e1..en).
        Ordem de avaliação do manual do COOL: primeiro os argumentos (da esquerda para a
        direita), depois o receptor e0. Na JVM o receptor precisa ficar embaixo dos
        argumentos na pilha, então, quando o receptor não é `self`, os argumentos são
        calculados primeiro e guardados em variáveis locais temporárias."""
        n = len(no.argumentos)
        receptor_e_self = type(no.receptor).__name__ == "Id" and no.receptor.nome == "self"
        metodo = no.metodo

        # classe usada no checkcast / na instrução de chamada
        if no.tipo_estatico is not None:
            classe = self.classe_declarante(no.tipo_estatico, metodo)
        else:
            tipo_receptor = no.receptor.tipo_expr
            classe = self.classe_atual.nome if tipo_receptor == SELF_TYPE else tipo_receptor

        marca_slots = self.proximo_slot
        temporarios = []
        if not receptor_e_self and n > 0:
            temporarios = [self.alocar_slot() for _ in no.argumentos]
            for argumento, slot in zip(no.argumentos, temporarios):
                self.expr(argumento)
                self.emit(f"astore {slot}")

        self.expr(no.receptor)
        if not receptor_e_self:
            self.verificar_nao_void(metodo)
            # o valor na pilha é CoolObject; o verificador exige o tipo da classe
            self.emit(f"checkcast {classe_jvm(classe)}")

        if temporarios:
            for slot in temporarios:
                self.emit(f"aload {slot}")
        else:
            for argumento in no.argumentos:
                self.expr(argumento)

        jvm = classe_jvm(classe)
        if no.tipo_estatico is not None:
            # despacho estático: chama direto o corpo (_s_f) da classe que declara o método
            self.emit(f"invokestatic {jvm}/_s_{metodo}(L{jvm};{OBJ * n}){OBJ}")
        else:
            self.emit(f"invokevirtual {jvm}/{metodo}({OBJ * n}){OBJ}")

        self.proximo_slot = marca_slots     # libera os temporários

    # ------------------------------------------------------------------
    # Fase 3: conversões entre objetos COOL e valores primitivos da JVM
    # ------------------------------------------------------------------
    def expr_como_int(self, no):
        """Gera `no` (um Int) e deixa o int primitivo no topo da pilha."""
        self.expr(no)
        self.emit("checkcast CoolInt")
        self.emit("getfield CoolInt/value I")

    def expr_como_bool(self, no):
        """Gera `no` (um Bool) e deixa o boolean primitivo (0/1) no topo da pilha."""
        self.expr(no)
        self.emit("checkcast CoolBool")
        self.emit("getfield CoolBool/value Z")

    def empacotar_int(self):
        """int primitivo no topo -> objeto CoolInt."""
        self.emit("invokestatic CoolInt/of(I)LCoolInt;")

    def empacotar_bool(self):
        """boolean primitivo no topo -> objeto CoolBool."""
        self.emit("invokestatic CoolBool/of(Z)LCoolBool;")

    # ---- operadores binários ----
    def expr_BinaryOp(self, no):
        if no.op in OPS_ARITMETICOS:
            self.expr_como_int(no.esq)
            self.expr_como_int(no.dir)
            self.emit(OPS_ARITMETICOS[no.op])      # idiv por zero lança ArithmeticException
            self.empacotar_int()

        elif no.op in OPS_RELACIONAIS:
            self.expr_como_int(no.esq)
            self.expr_como_int(no.dir)
            l_verdade = self.novo_rotulo("Lverdade")
            l_fim = self.novo_rotulo("Lfim")
            self.emit(f"{OPS_RELACIONAIS[no.op]} {l_verdade}")
            self.emit("iconst_0")
            self.emit(f"goto {l_fim}")
            self.rotulo(l_verdade)
            self.emit("iconst_1")
            self.rotulo(l_fim)
            self.empacotar_bool()

        elif no.op == "=":
            # Int/Bool/String comparam por valor, o resto por referência: o runtime decide
            self.expr(no.esq)
            self.expr(no.dir)
            self.emit("invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z")
            self.empacotar_bool()

        else:
            raise NotImplementedError(f"operador binário '{no.op}' desconhecido")

    # ---- operadores unários ----
    def expr_UnaryOp(self, no):
        if no.op == "~":
            self.expr_como_int(no.expr)
            self.emit("ineg")
            self.empacotar_int()
        elif no.op == "not":
            self.expr_como_bool(no.expr)
            self.emit("iconst_1")
            self.emit("ixor")                      # 0 <-> 1
            self.empacotar_bool()
        else:
            raise NotImplementedError(f"operador unário '{no.op}' desconhecido")

    # ---- if ----
    def expr_If(self, no):
        l_senao = self.novo_rotulo("Lsenao")
        l_fim = self.novo_rotulo("Lfim")
        self.expr_como_bool(no.cond)
        self.emit(f"ifeq {l_senao}")
        self.expr(no.entao)
        self.emit(f"goto {l_fim}")
        self.rotulo(l_senao)
        self.expr(no.senao)
        self.rotulo(l_fim)

    # ---- while (Fase 6) ----
    def expr_While(self, no):
        """while c loop corpo pool : o valor do corpo é descartado e o while vale void (null).
        A altura da pilha é a mesma no início do laço, no `goto` de volta e no rótulo de saída,
        como o verificador de bytecode exige."""
        l_inicio = self.novo_rotulo("Linicio")
        l_fim = self.novo_rotulo("Lfimwhile")
        self.rotulo(l_inicio)
        self.expr_como_bool(no.cond)
        self.emit(f"ifeq {l_fim}")
        self.expr(no.corpo)
        self.emit("pop")
        self.emit(f"goto {l_inicio}")
        self.rotulo(l_fim)
        self.emit("aconst_null")