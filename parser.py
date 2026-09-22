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
        if indice >= len(self.tokens):
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


    def parse_feature(self):
        # Todo feature começa com um OBJECT_IDENTIFIER (nome do método ou atributo)
        nome = self.expect("OBJECT_IDENTIFIER").valor

        # Se o próximo token for 'LPAREN' (, é um MÉTODO
        if self.peek().tipo == "LPAREN":
            self.consume() # consome o '('
            formais = []
            
            # Lê os parâmetros formais, se houver
            if self.peek().tipo != "RPAREN":
                formais.append(self.parse_formal())
                while self.match("COMMA"):
                    formais.append(self.parse_formal())
                    
            self.expect("RPAREN")
            self.expect("COLON")
            tipo_retorno = self.expect("TYPE_IDENTIFIER").valor
            self.expect("LBRACE")
            
            corpo = self.parse_expr() 
            
            self.expect("RBRACE")
            return Method(nome, formais, tipo_retorno, corpo)

        # Se o próximo token for 'COLON' :, é um ATRIBUTO
        elif self.peek().tipo == "COLON":
            self.consume() # consome o ':'
            tipo = self.expect("TYPE_IDENTIFIER").valor
            
            inicializador = None
            if self.match("ASSIGN"): # se tiver '<-'
                inicializador = self.parse_expr()
                
            return Attribute(nome, tipo, inicializador)
            
        else:
            raise ParseError("Esperado '(' para método ou ':' para atributo", self.peek().linha)

    def parse_formal(self):
        nome = self.expect("OBJECT_IDENTIFIER").valor
        self.expect("COLON")
        tipo = self.expect("TYPE_IDENTIFIER").valor
        return Formal(nome, tipo)

    def parse_if(self):
        self.consume() # Consome o token 'IF'
        
        cond = self.parse_expr() # Lê a condição
        
        self.expect("THEN")
        entao = self.parse_expr() # Lê o que acontece se for verdade
        
        self.expect("ELSE")
        senao = self.parse_expr() # Lê o que acontece se for falso
        
        self.expect("FI")
        
        # Cria e retorna o nó AST do If
        return If(cond, entao, senao)

    def parse_while(self):
        self.consume() # Consome o token 'WHILE'
        
        cond = self.parse_expr() # Lê a condição
        
        self.expect("LOOP")
        corpo = self.parse_expr() # Lê o corpo do laço
        
        self.expect("POOL")
        
        # Cria e retorna o nó AST do While
        return While(cond, corpo)

    def parse_block(self):
        self.consume() # Consome o token '{' (LBRACE)
        
        exprs = []
        # Um bloco na linguagem COOL é uma sequência de expressões, 
        # onde cada expressão obrigatoriamente termina com ponto-e-vírgula (;)
        while self.peek().tipo != "RBRACE":
            exprs.append(self.parse_expr())
            self.expect("SEMI")
            
        self.expect("RBRACE") # Consome o '}'
        
        # Cria e retorna o nó AST do Bloco
        return Block(exprs)

    def parse_let(self):
        self.consume() # Consome o token 'LET'
        bindings = []
        
        # O laço roda para pegar uma ou mais declarações de variáveis
        while True:
            nome = self.expect("OBJECT_IDENTIFIER").valor
            self.expect("COLON")
            tipo = self.expect("TYPE_IDENTIFIER").valor
            
            inicializador = None
            if self.match("ASSIGN"): # Se houver '<-'
                inicializador = self.parse_expr()
                
            # Adiciona a tupla na lista de bindings exigida pelo nó AST
            bindings.append((nome, tipo, inicializador))
            
            # Se não tiver vírgula, acabaram as declarações
            if not self.match("COMMA"):
                break
                
        self.expect("IN")
        corpo = self.parse_expr() # Lê o corpo do let
        
        # Constrói o nó usando a estrutura do seu ast_nodes.py
        return Let(bindings, corpo)

    def parse_new(self):
        self.consume() # Consome o token 'NEW'
        tipo = self.expect("TYPE_IDENTIFIER").valor
        
        
        return New(tipo) # Retorna o nó AST New definido no ast_nodes.py

    def parse_case(self):
        self.consume() # Consome o token 'CASE'
        
        # Lê a expressão que será testada
        expr_principal = self.parse_expr()
        
        self.expect("OF")
        
        ramos = []
        # O laço continua até encontrar o fechamento 'ESAC'
        while self.peek().tipo != "ESAC":
            nome = self.expect("OBJECT_IDENTIFIER").valor
            self.expect("COLON")
            tipo = self.expect("TYPE_IDENTIFIER").valor
            
            self.expect("DARROW") # Consome a seta '=>'
            
            corpo = self.parse_expr()
            
            self.expect("SEMI") # Cada ramo do case termina obrigatoriamente com ';'
            
            # Adiciona a tupla à lista de ramos exigida pelo nó Case
            ramos.append((nome, tipo, corpo))
            
        self.expect("ESAC")
        
        # Retorna o nó AST Case
        return Case(expr_principal, ramos)

    def parse_expr(self):
        token = self.peek()
        
        # Estruturas de Controlo e Fluxo
        if token.tipo == "IF":
            return self.parse_if()
        elif token.tipo == "WHILE":
            return self.parse_while()
        elif token.tipo == "LBRACE": 
            return self.parse_block()
        elif token.tipo == "LET":
            return self.parse_let()
        elif token.tipo == "CASE":
            return self.parse_case()
        elif token.tipo == "NEW":
            return self.parse_new()
        
        # Se não for uma palavra-chave de controle estrutural, 
        # desce para a cadeia matemática (começando na prioridade mais baixa: atribuição)
        return self.parse_assign()

    def parse_assign(self):
        # 1. Tenta descer a cadeia para pegar o lado esquerdo
        esq = self.parse_not()
        
        # 2. Se achar uma setinha de atribuição, pega o lado direito
        if self.match("ASSIGN"):
            dir = self.parse_expr() 
            if isinstance(esq, Id):
                return Assign(esq.nome, dir)
            else:
                raise ParseError("Lado esquerdo da atribuição deve ser um identificador", self.peek().linha)
        
        # Se não tiver atribuição, só devolve o que achou na esquerda
        return esq

    def parse_not(self):
        # Operador lógico unário (not)
        if self.match("NOT"):
            expr = self.parse_comparison()
            return UnaryOp("not", expr)
        return self.parse_comparison()

    def parse_comparison(self):
        # Operadores relacionais (<, <=, =)
        esq = self.parse_add()
        
        token = self.peek()
        if token.tipo in ["LESS_THAN", "LE", "EQUALS"]:
            self.consume()
            dir = self.parse_add()
            return BinaryOp(token.valor, esq, dir)
            
        return esq

    def parse_add(self):
        # Adição e Subtração (+, -)
        esq = self.parse_mul()
        
        # Usamos 'while' aqui porque você pode ter 1 + 2 - 3 + 4
        # Isso garante a "associatividade à esquerda"
        while self.peek().tipo in ["PLUS", "MINUS"]:
            token = self.consume()
            dir = self.parse_mul()
            esq = BinaryOp(token.valor, esq, dir)
            
        return esq

    def parse_mul(self):
        # Multiplicação e Divisão (*, /)
        esq = self.parse_isvoid()
        
        while self.peek().tipo in ["MULT", "DIVISION"]:
            token = self.consume()
            dir = self.parse_isvoid()
            esq = BinaryOp(token.valor, esq, dir)
            
        return esq

    def parse_isvoid(self):
        # Operador unário (isvoid)
        if self.match("ISVOID"):
            expr = self.parse_neg()
            return IsVoid(expr)
        return self.parse_neg()

    def parse_neg(self):
        # Operador unário matemático (~) que inverte sinal do inteiro
        if self.match("COMPLEMENT"): 
            expr = self.parse_dispatch()
            return UnaryOp("~", expr)
        return self.parse_dispatch()

    def parse_dispatch(self):
        # Pega a expressão base (o receptor, que fica à esquerda do ponto)
        esq = self.parse_primary()
        
        # Enquanto o próximo caractere for um PONTO (.) ou um ARROBA (@)
        while self.peek().tipo in ["DOT", "AT"]:
            tipo_estatico = None
            
            
            if self.match("AT"): # Tratamento do @ (Static Dispatch)
                tipo_estatico = self.expect("TYPE_IDENTIFIER").valor
                self.expect("DOT") # Após o @Tipo, obrigatoriamente vem um ponto
            else:
                self.consume() # Consome o ponto simples
                
            metodo = self.expect("OBJECT_IDENTIFIER").valor
            self.expect("LPAREN")
            
            argumentos = []
            # Se o próximo token não for ')', lemos os argumentos
            if self.peek().tipo != "RPAREN":
                argumentos.append(self.parse_expr())
                while self.match("COMMA"):
                    argumentos.append(self.parse_expr())
                    
            self.expect("RPAREN")
            
            # A mágica do encadeamento: o resultado desta chamada de método
            # vira o receptor (o lado esquerdo) da próxima iteração do while!
            esq = Dispatch(esq, tipo_estatico, metodo, argumentos)
            
        return esq

    def parse_primary(self):
        token = self.consume()
        
        if token.tipo == "INTEGER":
            return IntLit(int(token.valor))
        elif token.tipo == "STRING":
            return StringLit(token.valor)
        elif token.tipo == "TRUE":
            return BoolLit(True)
        elif token.tipo == "FALSE":
            return BoolLit(False)
        elif token.tipo == "OBJECT_IDENTIFIER":
            nome = token.valor
            
            # Se for seguido por parênteses, é um shorthand dispatch de 'self'
            if self.peek().tipo == "LPAREN":
                self.consume() # consome '('
                argumentos = []
                if self.peek().tipo != "RPAREN":
                    argumentos.append(self.parse_expr())
                    while self.match("COMMA"):
                        argumentos.append(self.parse_expr())
                self.expect("RPAREN")
                return Dispatch(Id("self"), None, nome, argumentos)
            
            # Se não tiver parênteses, é só uma variável normal
            return Id(nome)
        elif token.tipo == "LPAREN":
            
            expr = self.parse_expr() # Se achou '(', resolve a expressão de dentro chamando o topo, e depois fecha ')'
            self.expect("RPAREN")
            return expr
            
        raise ParseError(f"Expressão inválida iniciada com {token.tipo}", token.linha)
    
