import sys
from lexer import analisador_lexico
from parser import Parser
from errors import LexerError, ParseError

def imprimir_ast(no, nivel=0):
    prefixo = "  " * nivel

    # None
    if no is None:
        print(f"{prefixo}None")
        return

    #  Primitivos
    if isinstance(no, (str, int, bool, float)):
        print(f"{prefixo}{no!r}")
        return

    #  Listas
    if isinstance(no, list):
        if not no:
            print(f"{prefixo}[]")
            return
        for item in no:
            imprimir_ast(item, nivel)
        return

    #  Tuplas  
    if isinstance(no, tuple):
        print(f"{prefixo}(")
        for item in no:
            imprimir_ast(item, nivel + 1)
        print(f"{prefixo})")
        return

    #  Objetos da AST
    if hasattr(no, "__dict__"):
        nome_classe = type(no).__name__
        print(f"{prefixo}{nome_classe}")
        for chave, valor in vars(no).items():
            print(f"{prefixo}  {chave}:")
            imprimir_ast(valor, nivel + 2)
        return

    # qualquer outra coisa
    print(f"{prefixo}{no!r}")

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

    #  imprimir tokens pra debug
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
    imprimir_ast(ast)

if __name__ == "__main__":
    main()