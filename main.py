import sys
from lexer import analisador_lexico
from parser import Parser
from errors import LexerError, ParseError
from semantic import AnalisadorSemantico
from codegen import GeradorJasmin

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
    args = sys.argv[1:]
    pasta_saida = "saida"
    if "--saida" in args:
        i = args.index("--saida")
        if i + 1 >= len(args):
            print("Erro: --saida precisa de um diretório.")
            sys.exit(1)
        pasta_saida = args[i + 1]
        del args[i:i + 2]

    if not args:
        print("Uso: python3 main.py <arquivo.cl> [--saida <diretório>]")
        sys.exit(1)

    nome_arquivo = args[0]

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

    # 2) Sintático
    try:
        parser = Parser(tokens)
        ast = parser.parse_program()
    except ParseError as e:
        print(e)
        sys.exit(1)
    print("Parse OK!")

    # 3) Semântico
    analisador = AnalisadorSemantico(ast)
    erros = analisador.analisar()
    if erros:
        for e in erros:
            print(e)
        print(f"{len(erros)} erro(s) semântico(s).")
        sys.exit(1)
    print("Análise semântica OK!")

    # 4) Geração de código (Jasmin)
    try:
        arquivos = GeradorJasmin(ast, analisador).gerar_programa(pasta_saida)
    except NotImplementedError as e:
        print(f"Erro de geração de código: {e}")
        sys.exit(1)
    print(f"Geração de código OK! {len(arquivos)} arquivo(s) .j em '{pasta_saida}'")

if __name__ == "__main__":
    main()