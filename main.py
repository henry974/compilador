import re

class Token:
    def __init__(self,tipo,valor,linha):
        self.tipo=tipo
        self.valor=valor
        self.linha = linha
        pass
    def __str__(self):
        return f"Token(Tipo={self.tipo:<15}, Valor={repr(self.valor)}, Linha={self.linha})"

text = r"""class Main inherits IO {
    main(): Object {
        let hello: String <- "Hello, ",
            name: String <- "",
            ending: String <- "!\n"
        in {
            out_string("Please enter your name:\n");
            name <- in_string();
            out_string(hello.concat(name.concat(ending)));
        }
    };
};
"""
regex_tokens = [
    (r"[ \n\f\r\t\v]+",None),                   #ignora
    (r"--[^\n]*|\(\*.*?\*\)",None),                      #ignora
    (r'"([^"\\\n\x00]|\\[^\x00])*"','STRING'),
    (r"\d+",'INTEGER'),
    (r"[A-Z][a-zA-Z0-9_]*",'TYPE_IDENTIFIER'),
    (r"[a-z][a-zA-Z0-9_]*",'OBJECT_IDENTIFIER'),
    (r"\{",'LBRACE'),
    (r"\}",'RBRACE'),
    (r";", 'SEMI'),
    (r"<-", 'ASSIGN'),                        
    (r"=>", 'DARROW'),
    (r"<=", 'LE'),
    (r"=", 'EQUALS'),                          
    (r'<', 'LESS_THAN'),
    (r'\(', 'LPAREN'),   
    (r'\)', 'RPAREN'),
    (r':', 'COLON'),
    (r',', 'COMMA'),
    (r'\.','DOT'),
    (r'\+','PLUS'),
    (r'-','MINUS'),
    (r'\*','MULT'),
    (r'/','DIVISION'),
    (r'~','NOT'),
    (r'@', 'AT')
]
keywords={
    'class': 'CLASS', 'else': 'ELSE', 'fi': 'FI', 'if': 'IF',
    'in': 'IN', 'inherits': 'INHERITS', 'isvoid': 'ISVOID', 'let': 'LET',
    'loop': 'LOOP', 'pool': 'POOL', 'then': 'THEN', 'while': 'WHILE',
    'case': 'CASE', 'esac': 'ESAC', 'new': 'NEW', 'of': 'OF', 'not': 'NOT',
    'true': 'true', 'false': 'false'
}

def analisador_lexico(codigo):
    posicao = 0
    tamanho = len(codigo)

    linha_atual = 1

    while posicao < tamanho:
        match = None

        for regex,tipo in regex_tokens:
            padrao = re.compile(regex,re.DOTALL)
            match = padrao.match(codigo,posicao)

            if match:
                token_capturado = match.group(0)

                if ((tipo == 'OBJECT_IDENTIFIER') | (tipo == 'TYPE_IDENTIFIER')):
                    token_lower = token_capturado.lower()
                    if token_lower in keywords:
                        tipo = keywords[token_lower]

                if tipo is not None :
                    novo_token = Token(tipo,token_capturado,linha_atual)
                    print(novo_token)

                linha_atual += token_capturado.count('\n')
                posicao = match.end()
                break
        if not match:
            raise ValueError(f"Erro léxico: caractere inválido '{codigo[posicao]}' na linha {linha_atual}")
    return 1
analisador_lexico(text)