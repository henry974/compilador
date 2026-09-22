class Token:
    def __init__(self,tipo,valor,linha):
        self.tipo=tipo
        self.valor=valor
        self.linha = linha
        pass
    def __str__(self):
        return f"Token(Tipo={self.tipo:<15}, Valor={repr(self.valor)}, Linha={self.linha})"
    def __repr__(self):
        return self.__str__()