import sys
from lexer import analisador_lexico
from parser import Parser
from errors import LexerError, ParseError

def main():
    if len(sys.argv) < 2:
        print("Uso: python3 main.py <arquivo.cl>")
        sys.exit(1)

    nome_arquivo = sys.argv[1]

    try:
        with open(nome_arquivo, 'r') as f:
            codigo = f.read()
    except FileNotFoundError:
        print(f"Erro: arquivo '{nome_arquivo}' não encontrado.")
        sys.exit(1)

    # 1) Léxico
    try:
        tokens = analisador_lexico(codigo)
    except LexerError as e:
        print(e)
        sys.exit(1)

    # (opcional) imprimir tokens pra debug
    for t in tokens:
        print(t)
    print("-" * 40)

    # 2) Sintático
    try:
        parser = Parser(tokens)
        ast = parser.parse_program()
    except ParseError as e:
        print(e)
        sys.exit(1)

    print("Parse OK!")
    print(ast)

if __name__ == "__main__":
    main()