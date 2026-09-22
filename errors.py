class LexerError(Exception):
    def __init__(self, mensagem, linha):
        super().__init__(f"Erro léxico (linha {linha}): {mensagem}")
        self.linha = linha


class ParseError(Exception):
    def __init__(self, mensagem, linha):
        super().__init__(f"Erro sintático (linha {linha}): {mensagem}")
        self.linha = linha