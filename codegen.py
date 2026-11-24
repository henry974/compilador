"""
Gerador de código COOL -> Jasmin (bytecode JVM s).

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

Estado do desenvolvimento: Fase 2 (esqueleto). Já geram código: literais, `self`,
bloco e despacho dinâmico. O resto levanta NotImplementedError com a linha do fonte.
"""
import os

from ast_nodes import Attribute
from semantic import SELF_TYPE

LIMITE_PILHA = 64          # profundidade de pilha "generosa" (Fase 9: calcular o valor exato)
OBJ = "LCoolObject;"       # descritor do tipo apagado

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
        """<init>()V : chama o construtor do pai. (Fase 4: valores padrão + inicializadores.)"""
        self.iniciar_metodo([])
        self.emit("aload_0")
        self.emit(f"invokespecial {classe_jvm(info.pai)}/<init>()V")
        # TODO Fase 4: atribuir valores padrão e inicializadores dos atributos
        self.emit("return")
        self.escrever_metodo("public <init>()V", LIMITE_PILHA, self.max_locais)

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

    # ---- self (variáveis comuns: Fase 4) ----
    def expr_Id(self, no):
        if no.nome == "self":
            self.emit("aload_0")
            return
        raise NotImplementedError(
            f"uso da variável '{no.nome}' ainda não implementado (Fase 4) (linha {getattr(no, 'linha', '?')})")

    # ---- bloco ----
    def expr_Block(self, no):
        for i, e in enumerate(no.exprs):
            self.expr(e)
            if i < len(no.exprs) - 1:
                self.emit("pop")           # só o valor da última expressão interessa

    # ---- despacho dinâmico (Fase 5 completa: estático, void, etc.) ----
    def expr_Dispatch(self, no):
        if no.tipo_estatico is not None:
            raise NotImplementedError(
                f"despacho estático (@) ainda não implementado (Fase 5) (linha {getattr(no, 'linha', '?')})")

        tipo_receptor = no.receptor.tipo_expr
        classe = self.classe_atual.nome if tipo_receptor == SELF_TYPE else tipo_receptor

        self.expr(no.receptor)
        # o valor na pilha é CoolObject; o verificador exige o tipo da classe para invokevirtual
        if not (type(no.receptor).__name__ == "Id" and no.receptor.nome == "self"):
            self.emit(f"checkcast {classe_jvm(classe)}")
        for argumento in no.argumentos:
            self.expr(argumento)
        descritor = f"({OBJ * len(no.argumentos)}){OBJ}"
        self.emit(f"invokevirtual {classe_jvm(classe)}/{no.metodo}{descritor}")