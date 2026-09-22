# abstract sintatic tree
class Program:
    def __init__(self, classes):
        self.classes = classes

class ClassNode:
    def __init__(self, nome, pai, features):
        self.nome = nome        # str
        self.pai = pai          # str ou None
        self.features = features  # lista

# features

class Attribute:
    def __init__(self, nome, tipo, inicializador):
        self.nome = nome
        self.tipo = tipo
        self.inicializador = inicializador  # Expr ou None

class Method:
    def __init__(self, nome, formais, tipo_retorno, corpo):
        self.nome = nome
        self.formais = formais            # list[Formal]
        self.tipo_retorno = tipo_retorno
        self.corpo = corpo                # Expr

class Formal:
    def __init__(self, nome, tipo):
        self.nome = nome
        self.tipo = tipo


# expressoes

class Assign:
    def __init__(self, nome, valor):
        self.nome = nome
        self.valor = valor

class Dispatch:
    def __init__(self, receptor, tipo_estatico, metodo, argumentos):
        self.receptor = receptor          # Expr
        self.tipo_estatico = tipo_estatico  # str ou None (para @Tipo)
        self.metodo = metodo
        self.argumentos = argumentos

class If:
    def __init__(self, cond, entao, senao):
        self.cond = cond
        self.entao = entao
        self.senao = senao

class While:
    def __init__(self, cond, corpo):
        self.cond = cond
        self.corpo = corpo

class Block:
    def __init__(self, exprs):
        self.exprs = exprs

class Let:
    def __init__(self, bindings, corpo):
        self.bindings = bindings   # list[(nome, tipo, expr_ou_None)]
        self.corpo = corpo

class Case:
    def __init__(self, expr, ramos):
        self.expr = expr
        self.ramos = ramos         # list[(nome, tipo, corpo)]

class New:
    def __init__(self, tipo):
        self.tipo = tipo

class IsVoid:
    def __init__(self, expr):
        self.expr = expr

class BinaryOp:
    def __init__(self, op, esq, dir):
        self.op = op               # "+", "-", "*", "/", "<", "<=", "="
        self.esq = esq
        self.dir = dir

class UnaryOp:
    def __init__(self, op, expr):
        self.op = op               # "~" ou "not"
        self.expr = expr

class Id:
    def __init__(self, nome):
        self.nome = nome

class IntLit:
    def __init__(self, valor):
        self.valor = valor

class StringLit:
    def __init__(self, valor):
        self.valor = valor

class BoolLit:
    def __init__(self, valor):
        self.valor = valor