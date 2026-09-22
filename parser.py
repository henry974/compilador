from tokens import Token
from ast_nodes import *
from errors import ParseError

class Parser:
    def __init__(self,tokens):
        self.tokens = tokens 
        self.pos = 0

    # utilitarios

    #olha o token da posição atual, podendo ter um offset ou nao
    def peek(self,offset=0):
        indice = self.pos + offset
        if indice > len(self.tokens):
            return self.tokens[-1] # ultimo token = eof
        return self.tokens[indice]

    # similar ao pop de estruturas de pilha
    def consume(self):
        aux_tok = self.peek()
        self.pos += 1
        return aux_tok
    # se o tipo for igual, retorna o elemento, senao, um error
    def expect(self,tipo):
        aux_token = self.peek()
        if aux_token.tipo != tipo:
            raise ParseError(f"esperando {tipo}, encontrado {aux_token.tipo} ({aux_token.valor!r})",aux_token.linha)
        return self.consume()

    def match(self,tipo):
        if self.peek().tipo == tipo:
            return self.consume()
        return None


    # regras de gramática
    
    def parse_program(self):
        classes = []
        while self.peek().tipo != "EOF":
            classes.append(self.parse_class())
        return Program(classes)

    def parse_class(self):
        self.expect("CLASS")
        nome = self.expect("TYPE_IDENTIFIER").valor
        pai = None
        if self.match("INHERITS"):
            pai = self.expect("TYPE_IDENTIFIER").valor
        self.expect("LBRACE")
        features = []
        while self.peek().tipo != "RBRACE":
            features.append(self.parse_feature())
            self.expect("SEMI")
        self.expect("RBRACE")
        self.expect("SEMI")
        return ClassNode(nome, pai, features)
    