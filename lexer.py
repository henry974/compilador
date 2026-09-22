import re
import sys
from tokens import Token
from errors import LexerError



regex_tokens = [
    (r"[ \n\f\r\t\v]+",None),                   #ignora
    (r"--[^\n]*", None),                      #ignora
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
    (r'~','COMPLEMENT'),
    (r'@', 'AT')
]
keywords={
    'class': 'CLASS', 'else': 'ELSE', 'fi': 'FI', 'if': 'IF',
    'in': 'IN', 'inherits': 'INHERITS', 'isvoid': 'ISVOID', 'let': 'LET',
    'loop': 'LOOP', 'pool': 'POOL', 'then': 'THEN', 'while': 'WHILE',
    'case': 'CASE', 'esac': 'ESAC', 'new': 'NEW', 'of': 'OF', 'not': 'NOT',
    'true': 'TRUE', 'false': 'FALSE'
}

def analisador_lexico(codigo):
    tokens = []
    posicao = 0
    tamanho = len(codigo)

    linha_atual = 1

    while posicao < tamanho:
        char = codigo[posicao:posicao+2]
        if char == '(*':
            contador = 1
            #print(contador)
            posicao += 2
            while contador > 0 and posicao < tamanho:
                if codigo[posicao] == '\n':
                    linha_atual +=1
                char = codigo[posicao:posicao+2]
                if char == '(*':
                    contador +=1
                    posicao += 2
                elif char == '*)':
                    contador -=1
                    posicao += 2
                else :
                    posicao += 1
            if contador > 0:
                raise LexerError(f"Erro léxico: EOF encontrado, comentário de bloco não foi fechado.")  
            continue      
        match = None
        for regex,tipo in regex_tokens:
            padrao = re.compile(regex,re.DOTALL)
            match = padrao.match(codigo,posicao)

            if match:
                token_capturado = match.group(0)

                if ((tipo == 'OBJECT_IDENTIFIER') or (tipo == 'TYPE_IDENTIFIER')):
                    token_lower = token_capturado.lower()
                    if token_lower in keywords:
                        tipo = keywords[token_lower]

                
                if tipo is not None :

                    novo_token = Token(tipo,token_capturado,linha_atual)
                    tokens.append(novo_token)
                    #print(novo_token)

                linha_atual += token_capturado.count('\n')
                posicao = match.end()
                break
        if not match:
            raise LexerError(f"Erro léxico: caractere inválido '{codigo[posicao]}' na linha {linha_atual}")
    tokens.append(Token("EOF","$",linha_atual))
    return tokens

if __name__ == "__main__":
    
    if len(sys.argv) < 2:
        print("Uso incorreto. Formato esperado:")
        print("python3 main.py <arquivo.cl>")
        sys.exit(1) # erro

    nome_arquivo = sys.argv[1]

    try:

        with open(nome_arquivo, 'r') as arquivo:
            codigo_fonte = arquivo.read()
        
        analisador_lexico(codigo_fonte)
    except FileNotFoundError:
        print(f"Erro: O arquivo '{nome_arquivo}' não foi encontrado.")

