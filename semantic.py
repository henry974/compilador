"""
Entrada : a AST produzida pelo parser (ast_nodes.py).
Saída   : lista de SemanticError (vazia = programa semanticamente correto).
          Além disso, cada nó de expressão da AST ganha o atributo `tipo_expr`
          com o tipo estático inferido (útil para a geração de código).

Fases (na ordem em que são executadas):
  1. registrar_classes   -> tabela de classes (básicas + do usuário)
  2. verificar_heranca   -> pai existe? herda de Int/String/Bool? há ciclo?
  3. coletar_features    -> atributos e métodos de cada classe (+ regras de redefinição)
  4. verificar_main      -> existe Main com método main()?
  5. checar_tipos        -> regras de tipo do manual (seção 12) em todas as expressões
"""
from ast_nodes import *
from errors import SemanticError

OBJECT = "Object"
IO = "IO"
INT = "Int"
STRING = "String"
BOOL = "Bool"
SELF_TYPE = "SELF_TYPE"

# Tipo "bottom": conforma com qualquer tipo. Atribuído a expressões que já deram
# erro, para não gerar uma cascata de erros repetidos.
NO_TYPE = "_no_type"

BASICAS_NAO_HERDAVEIS = (INT, STRING, BOOL, SELF_TYPE)


class InfoMetodo:
    def __init__(self, formais, retorno):
        self.formais = formais    # lista de (nome, tipo)
        self.retorno = retorno    # str


class InfoClasse:
    def __init__(self, nome, pai, linha=None, no=None):
        self.nome = nome
        self.pai = pai            # str, ou None (só para Object)
        self.linha = linha
        self.no = no              # ClassNode (None nas classes básicas)
        self.atributos = {}       # nome -> tipo   (somente os declarados nesta classe)
        self.metodos = {}         # nome -> InfoMetodo (somente os declarados nesta classe)


class AnalisadorSemantico:
    def __init__(self, programa):
        self.programa = programa
        self.classes = {}         # nome -> InfoClasse
        self.erros = []
        self.escopos = []         # pilha de dicts nome -> tipo (formais, let, case)
        self.classe_atual = None  # InfoClasse da classe sendo verificada
        self.linha_atual = None   # última linha conhecida (fallback para mensagens)

    # utilitários
    
    def erro(self, mensagem, linha=None):
        self.erros.append(SemanticError(mensagem, linha))

    def tipo_existe(self, nome, permite_self_type=True):
        return nome in self.classes or (permite_self_type and nome == SELF_TYPE)

    def ancestrais(self, nome):
        """Cadeia de herança de `nome` até Object, incluindo a própria classe."""
        cadeia = []
        while nome is not None:
            cadeia.append(nome)
            nome = self.classes[nome].pai
        return cadeia

    def buscar_atributo(self, classe, nome):
        """Tipo do atributo `nome` na classe ou em algum ancestral (None se não existe)."""
        for c in self.ancestrais(classe):
            if nome in self.classes[c].atributos:
                return self.classes[c].atributos[nome]
        return None

    def buscar_metodo(self, classe, nome):
        """InfoMetodo de `nome` na classe ou em algum ancestral (None se não existe)."""
        for c in self.ancestrais(classe):
            if nome in self.classes[c].metodos:
                return self.classes[c].metodos[nome]
        return None

    def buscar_variavel(self, nome):
        """Procura primeiro nos escopos locais (do mais interno ao mais externo)
        e depois nos atributos da classe atual."""
        for escopo in reversed(self.escopos):
            if nome in escopo:
                return escopo[nome]
        return self.buscar_atributo(self.classe_atual.nome, nome)

    # relação de conformidade (T1 <= T2) e menor ancestral comum (lub)
    def conforma(self, t1, t2):
        if t1 == NO_TYPE or t2 == NO_TYPE:
            return True
        if t2 == SELF_TYPE:
            return t1 == SELF_TYPE          # só SELF_TYPE conforma com SELF_TYPE
        if t1 == SELF_TYPE:
            t1 = self.classe_atual.nome     # SELF_TYPE_C <= T  se  C <= T
        return t2 in self.ancestrais(t1)

    def lub(self, t1, t2):
        if t1 == NO_TYPE:
            return t2
        if t2 == NO_TYPE:
            return t1
        if t1 == SELF_TYPE and t2 == SELF_TYPE:
            return SELF_TYPE
        a = self.classe_atual.nome if t1 == SELF_TYPE else t1
        b = self.classe_atual.nome if t2 == SELF_TYPE else t2
        ancestrais_b = self.ancestrais(b)
        for c in self.ancestrais(a):
            if c in ancestrais_b:
                return c
        return OBJECT

    # ------------------------------------------------------------------
    # ponto de entrada
    # ------------------------------------------------------------------
    def analisar(self):
        self.registrar_classes()
        self.verificar_heranca()
        self.coletar_features()
        self.verificar_main()
        self.checar_tipos()
        # mensagens em ordem de linha (as sem linha ficam por último)
        self.erros.sort(key=lambda e: (e.linha is None, e.linha or 0))
        return self.erros

    # ------------------------------------------------------------------
    # 1) classes
    # ------------------------------------------------------------------
    def criar_classes_basicas(self):
        basicas = {
            OBJECT: (None, {
                "abort": ([], OBJECT),
                "type_name": ([], STRING),
                "copy": ([], SELF_TYPE),
            }),
            IO: (OBJECT, {
                "out_string": ([("x", STRING)], SELF_TYPE),
                "out_int": ([("x", INT)], SELF_TYPE),
                "in_string": ([], STRING),
                "in_int": ([], INT),
            }),
            INT: (OBJECT, {}),
            BOOL: (OBJECT, {}),
            STRING: (OBJECT, {
                "length": ([], INT),
                "concat": ([("s", STRING)], STRING),
                "substr": ([("i", INT), ("l", INT)], STRING),
            }),
        }
        for nome, (pai, metodos) in basicas.items():
            info = InfoClasse(nome, pai)
            for m, (formais, retorno) in metodos.items():
                info.metodos[m] = InfoMetodo(formais, retorno)
            self.classes[nome] = info

    def registrar_classes(self):
        self.criar_classes_basicas()
        for no in self.programa.classes:
            linha = getattr(no, "linha", None)
            if no.nome == SELF_TYPE:
                self.erro("uma classe não pode se chamar SELF_TYPE", linha)
            elif no.nome in self.classes:
                if self.classes[no.nome].no is None:
                    self.erro(f"não é permitido redefinir a classe básica '{no.nome}'", linha)
                else:
                    self.erro(f"classe '{no.nome}' definida mais de uma vez", linha)
            else:
                self.classes[no.nome] = InfoClasse(no.nome, no.pai or OBJECT, linha, no)

    # ------------------------------------------------------------------
    # 2) herança
    # ------------------------------------------------------------------
    def verificar_heranca(self):
        for info in self.classes.values():
            if info.no is None:
                continue
            if info.pai in BASICAS_NAO_HERDAVEIS:
                self.erro(f"classe '{info.nome}' não pode herdar de '{info.pai}'", info.linha)
                info.pai = OBJECT
            elif info.pai not in self.classes:
                self.erro(f"classe '{info.nome}' herda de uma classe não definida '{info.pai}'", info.linha)
                info.pai = OBJECT

        # ciclos: sobe pela cadeia de pais; se voltar a uma classe já vista, é ciclo
        for inicio in list(self.classes.values()):
            caminho = []
            atual = inicio.nome
            while atual is not None and atual not in caminho:
                caminho.append(atual)
                atual = self.classes[atual].pai
            if atual is not None:
                ciclo = caminho[caminho.index(atual):]
                self.erro("herança cíclica: " + " -> ".join(ciclo + [atual]),
                          self.classes[atual].linha)
                for nome in ciclo:          # quebra o ciclo para as próximas fases não travarem
                    self.classes[nome].pai = OBJECT

    # ------------------------------------------------------------------
    # 3) atributos e métodos
    # ------------------------------------------------------------------
    def profundidade(self, nome):
        return len(self.ancestrais(nome)) - 1

    def coletar_features(self):
        usuarias = [i for i in self.classes.values() if i.no is not None]
        # pais antes dos filhos: assim os métodos herdados já estão registrados
        usuarias.sort(key=lambda i: self.profundidade(i.nome))
        for info in usuarias:
            for feature in info.no.features:
                if isinstance(feature, Attribute):
                    self.registrar_atributo(info, feature)
                else:
                    self.registrar_metodo(info, feature)

    def registrar_atributo(self, info, attr):
        linha = getattr(attr, "linha", None)
        if attr.nome == "self":
            self.erro("um atributo não pode se chamar 'self'", linha)
            return
        if attr.nome in info.atributos:
            self.erro(f"atributo '{attr.nome}' já definido na classe '{info.nome}'", linha)
            return
        if self.buscar_atributo(info.pai, attr.nome) is not None:
            self.erro(f"atributo '{attr.nome}' já definido em uma classe ancestral de '{info.nome}'", linha)
            return
        tipo = attr.tipo
        if not self.tipo_existe(tipo):
            self.erro(f"atributo '{attr.nome}' tem tipo não definido '{tipo}'", linha)
            tipo = NO_TYPE
        info.atributos[attr.nome] = tipo

    def registrar_metodo(self, info, metodo):
        linha = getattr(metodo, "linha", None)
        if metodo.nome in info.metodos:
            self.erro(f"método '{metodo.nome}' já definido na classe '{info.nome}'", linha)
            return

        formais = []
        vistos = set()
        for formal in metodo.formais:
            if formal.nome == "self":
                self.erro(f"parâmetro de '{metodo.nome}' não pode se chamar 'self'", linha)
            if formal.nome in vistos:
                self.erro(f"parâmetro '{formal.nome}' repetido no método '{metodo.nome}'", linha)
            vistos.add(formal.nome)
            tipo = formal.tipo
            if tipo == SELF_TYPE:
                self.erro(f"parâmetro '{formal.nome}' não pode ter tipo SELF_TYPE", linha)
                tipo = NO_TYPE
            elif not self.tipo_existe(tipo):
                self.erro(f"parâmetro '{formal.nome}' tem tipo não definido '{tipo}'", linha)
                tipo = NO_TYPE
            formais.append((formal.nome, tipo))

        retorno = metodo.tipo_retorno
        if not self.tipo_existe(retorno):
            self.erro(f"método '{metodo.nome}' tem tipo de retorno não definido '{retorno}'", linha)
            retorno = NO_TYPE

        # redefinição (override): assinatura idêntica à do método herdado
        herdado = self.buscar_metodo(info.pai, metodo.nome)
        if herdado is not None:
            if len(herdado.formais) != len(formais):
                self.erro(f"método '{metodo.nome}' redefinido com número de parâmetros "
                          f"diferente do herdado ({len(formais)} em vez de {len(herdado.formais)})", linha)
            else:
                for (nome, tipo), (_, tipo_herdado) in zip(formais, herdado.formais):
                    if NO_TYPE not in (tipo, tipo_herdado) and tipo != tipo_herdado:
                        self.erro(f"método '{metodo.nome}' redefinido com tipo diferente para o parâmetro "
                                  f"'{nome}' ('{tipo}' em vez de '{tipo_herdado}')", linha)
            if NO_TYPE not in (retorno, herdado.retorno) and retorno != herdado.retorno:
                self.erro(f"método '{metodo.nome}' redefinido com tipo de retorno diferente "
                          f"('{retorno}' em vez de '{herdado.retorno}')", linha)

        info.metodos[metodo.nome] = InfoMetodo(formais, retorno)

    # ------------------------------------------------------------------
    # 4) Main.main()
    # ------------------------------------------------------------------
    def verificar_main(self):
        if "Main" not in self.classes:
            self.erro("o programa não define a classe Main")
            return
        linha = self.classes["Main"].linha
        main = self.buscar_metodo("Main", "main")
        if main is None:
            self.erro("a classe Main não define o método 'main'", linha)
        elif main.formais:
            self.erro("o método 'main' da classe Main não pode ter parâmetros", linha)

    # ------------------------------------------------------------------
    # 5) checagem de tipos
    # ------------------------------------------------------------------
    def checar_tipos(self):
        for no in self.programa.classes:
            info = self.classes.get(no.nome)
            if info is None or info.no is not no:   # classe rejeitada (duplicada etc.)
                continue
            self.classe_atual = info
            for feature in no.features:
                if isinstance(feature, Attribute):
                    self.checar_atributo(feature)
                else:
                    self.checar_metodo(feature)

    def checar_atributo(self, attr):
        if attr.inicializador is None:
            return
        self.linha_atual = getattr(attr, "linha", self.linha_atual)
        linha = self.linha_atual
        self.escopos = []
        tipo_init = self.checar(attr.inicializador)
        declarado = attr.tipo if self.tipo_existe(attr.tipo) else NO_TYPE
        if not self.conforma(tipo_init, declarado):
            self.erro(f"inicializador do atributo '{attr.nome}' tem tipo '{tipo_init}', "
                      f"que não conforma com '{attr.tipo}'", linha)

    def checar_metodo(self, metodo):
        self.linha_atual = getattr(metodo, "linha", self.linha_atual)
        linha = self.linha_atual
        escopo = {}
        for formal in metodo.formais:
            if formal.nome == "self":
                continue
            if formal.tipo != SELF_TYPE and self.tipo_existe(formal.tipo):
                escopo[formal.nome] = formal.tipo
            else:
                escopo[formal.nome] = NO_TYPE
        self.escopos = [escopo]
        tipo_corpo = self.checar(metodo.corpo)
        retorno = metodo.tipo_retorno if self.tipo_existe(metodo.tipo_retorno) else NO_TYPE
        if not self.conforma(tipo_corpo, retorno):
            self.erro(f"o corpo do método '{metodo.nome}' tem tipo '{tipo_corpo}', "
                      f"que não conforma com o tipo de retorno '{metodo.tipo_retorno}'", linha)

    def checar(self, no):
        """Visitor: despacha para visitar_<NomeDoNo>, anota o tipo no nó e o devolve."""
        if hasattr(no, "linha"):
            self.linha_atual = no.linha
        tipo = getattr(self, "visitar_" + type(no).__name__)(no)
        no.tipo_expr = tipo
        return tipo

    # ---- literais e identificadores ----
    def visitar_IntLit(self, no):
        return INT

    def visitar_StringLit(self, no):
        return STRING

    def visitar_BoolLit(self, no):
        return BOOL

    def visitar_Id(self, no):
        linha = self.linha_atual
        if no.nome == "self":
            return SELF_TYPE
        tipo = self.buscar_variavel(no.nome)
        if tipo is None:
            self.erro(f"identificador '{no.nome}' não declarado", linha)
            return NO_TYPE
        return tipo

    # ---- atribuição ----
    def visitar_Assign(self, no):
        linha = self.linha_atual
        tipo_valor = self.checar(no.valor)
        if no.nome == "self":
            self.erro("não é possível atribuir a 'self'", linha)
            return tipo_valor
        tipo_var = self.buscar_variavel(no.nome)
        if tipo_var is None:
            self.erro(f"atribuição a identificador não declarado '{no.nome}'", linha)
        elif not self.conforma(tipo_valor, tipo_var):
            self.erro(f"não é possível atribuir um valor do tipo '{tipo_valor}' "
                      f"a '{no.nome}', que é do tipo '{tipo_var}'", linha)
        return tipo_valor

    # ---- chamada de método (dinâmica e estática) ----
    def visitar_Dispatch(self, no):
        linha = self.linha_atual
        tipo_receptor = self.checar(no.receptor)
        tipos_args = [self.checar(a) for a in no.argumentos]

        tipo_busca = tipo_receptor
        if no.tipo_estatico is not None:               # e@T.f(...)
            t = no.tipo_estatico
            if t == SELF_TYPE:
                self.erro("despacho estático não pode usar SELF_TYPE", linha)
                return NO_TYPE
            if t not in self.classes:
                self.erro(f"despacho estático para tipo não definido '{t}'", linha)
                return NO_TYPE
            if not self.conforma(tipo_receptor, t):
                self.erro(f"expressão do tipo '{tipo_receptor}' não conforma com o tipo "
                          f"'{t}' usado no despacho estático", linha)
            tipo_busca = t

        if tipo_busca == NO_TYPE:
            return NO_TYPE
        classe_busca = self.classe_atual.nome if tipo_busca == SELF_TYPE else tipo_busca
        metodo = self.buscar_metodo(classe_busca, no.metodo)
        if metodo is None:
            self.erro(f"método '{no.metodo}' não definido na classe '{classe_busca}'", linha)
            return NO_TYPE

        if len(tipos_args) != len(metodo.formais):
            self.erro(f"método '{no.metodo}' espera {len(metodo.formais)} argumento(s), "
                      f"mas recebeu {len(tipos_args)}", linha)
        else:
            for i, (arg, (nome, tipo_formal)) in enumerate(zip(tipos_args, metodo.formais), 1):
                if not self.conforma(arg, tipo_formal):
                    self.erro(f"argumento {i} ('{nome}') de '{no.metodo}' tem tipo '{arg}', "
                              f"que não conforma com '{tipo_formal}'", linha)

        # se o método devolve SELF_TYPE, o resultado é o tipo do receptor
        if metodo.retorno == SELF_TYPE:
            return tipo_receptor
        return metodo.retorno

    # ---- controle de fluxo ----
    def visitar_If(self, no):
        linha = self.linha_atual
        tipo_cond = self.checar(no.cond)
        if not self.conforma(tipo_cond, BOOL):
            self.erro(f"a condição do 'if' deve ser Bool, mas é '{tipo_cond}'", linha)
        t_entao = self.checar(no.entao)
        t_senao = self.checar(no.senao)
        return self.lub(t_entao, t_senao)

    def visitar_While(self, no):
        linha = self.linha_atual
        tipo_cond = self.checar(no.cond)
        if not self.conforma(tipo_cond, BOOL):
            self.erro(f"a condição do 'while' deve ser Bool, mas é '{tipo_cond}'", linha)
        self.checar(no.corpo)
        return OBJECT

    def visitar_Block(self, no):
        linha = self.linha_atual
        if not no.exprs:
            self.erro("um bloco precisa ter ao menos uma expressão", linha)
            return NO_TYPE
        tipo = NO_TYPE
        for e in no.exprs:
            tipo = self.checar(e)
        return tipo

    # ---- let e case (criam escopos) ----
    def visitar_Let(self, no):
        linha = self.linha_atual
        self.escopos.append({})
        for nome, tipo, init in no.bindings:
            # o inicializador enxerga as variáveis anteriores do let, mas não a própria
            tipo_init = self.checar(init) if init is not None else None
            tipo_decl = tipo
            if not self.tipo_existe(tipo):
                self.erro(f"variável '{nome}' do let tem tipo não definido '{tipo}'", linha)
                tipo_decl = NO_TYPE
            if tipo_init is not None and not self.conforma(tipo_init, tipo_decl):
                self.erro(f"inicializador de '{nome}' tem tipo '{tipo_init}', "
                          f"que não conforma com '{tipo}'", linha)
            if nome == "self":
                self.erro("'self' não pode ser usado como variável do let", linha)
            else:
                self.escopos[-1][nome] = tipo_decl
        tipo_corpo = self.checar(no.corpo)
        self.escopos.pop()
        return tipo_corpo

    def visitar_Case(self, no):
        linha = self.linha_atual
        self.checar(no.expr)
        if not no.ramos:
            self.erro("o 'case' precisa ter ao menos um ramo", linha)
            return NO_TYPE
        tipos_vistos = set()
        resultado = None
        for nome, tipo, corpo in no.ramos:
            tipo_decl = tipo
            if tipo == SELF_TYPE:
                self.erro("o tipo de um ramo do 'case' não pode ser SELF_TYPE", linha)
                tipo_decl = NO_TYPE
            elif tipo not in self.classes:
                self.erro(f"ramo do 'case' com tipo não definido '{tipo}'", linha)
                tipo_decl = NO_TYPE
            elif tipo in tipos_vistos:
                self.erro(f"tipo '{tipo}' aparece em mais de um ramo do 'case'", linha)
            tipos_vistos.add(tipo)

            escopo = {}
            if nome == "self":
                self.erro("'self' não pode ser usado como variável de um ramo do 'case'", linha)
            else:
                escopo[nome] = tipo_decl
            self.escopos.append(escopo)
            t = self.checar(corpo)
            self.escopos.pop()
            resultado = t if resultado is None else self.lub(resultado, t)
        return resultado

    # ---- new / isvoid ----
    def visitar_New(self, no):
        linha = self.linha_atual
        if no.tipo == SELF_TYPE:
            return SELF_TYPE
        if no.tipo not in self.classes:
            self.erro(f"'new' com tipo não definido '{no.tipo}'", linha)
            return NO_TYPE
        return no.tipo

    def visitar_IsVoid(self, no):
        self.checar(no.expr)
        return BOOL

    # ---- operadores ----
    def visitar_BinaryOp(self, no):
        linha = self.linha_atual
        te = self.checar(no.esq)
        td = self.checar(no.dir)

        if no.op in ("+", "-", "*", "/", "<", "<="):
            if not (self.conforma(te, INT) and self.conforma(td, INT)):
                self.erro(f"o operador '{no.op}' exige operandos Int, "
                          f"mas recebeu '{te}' e '{td}'", linha)
            return INT if no.op in ("+", "-", "*", "/") else BOOL

        if no.op == "=":
            # Int, String e Bool só podem ser comparados com o mesmo tipo
            if NO_TYPE not in (te, td) and te != td and (te in (INT, STRING, BOOL) or td in (INT, STRING, BOOL)):
                self.erro(f"não é possível comparar '{te}' com '{td}' usando '='", linha)
            return BOOL

        raise ValueError(f"operador binário desconhecido: {no.op}")

    def visitar_UnaryOp(self, no):
        linha = self.linha_atual
        t = self.checar(no.expr)
        if no.op == "~":
            if not self.conforma(t, INT):
                self.erro(f"o operador '~' exige um operando Int, mas recebeu '{t}'", linha)
            return INT
        if no.op == "not":
            if not self.conforma(t, BOOL):
                self.erro(f"o operador 'not' exige um operando Bool, mas recebeu '{t}'", linha)
            return BOOL
        raise ValueError(f"operador unário desconhecido: {no.op}")
