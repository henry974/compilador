import re

class Token:
    def __init__(self,id,tipo,valor):
        self.id = id
        self.tipo=tipo
        self.valor=valor
        pass

integers = r"^\d+$"
type_identifier = r"^[A-Z][a-zA-Z]*$"
object_identifier = r"^[a-z][a-zA-Z]*$"
string_regex = r'"([^"\\\n\x00]|\\[^\x00])*"'
comment_regex = r"--[^\n]*|\(\*.*?\*\)"
keywords={
    'class': 'CLASS', 'else': 'ELSE', 'fi': 'FI', 'if': 'IF',
    'in': 'IN', 'inherits': 'INHERITS', 'isvoid': 'ISVOID', 'let': 'LET',
    'loop': 'LOOP', 'pool': 'POOL', 'then': 'THEN', 'while': 'WHILE',
    'case': 'CASE', 'esac': 'ESAC', 'new': 'NEW', 'of': 'OF', 'not': 'NOT',
}
white_space = r"[ \n\f\r\t\v]+"