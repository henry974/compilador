#!/usr/bin/env bash
# Uso: ./compilar.sh programa.cl
# Pipeline: .cl -> (main.py) .j -> (jasmin) .class -> (java) executa
set -e

if [ $# -lt 1 ]; then
    echo "Uso: ./compilar.sh programa.cl"
    exit 1
fi

RAIZ="$(cd "$(dirname "$0")" && pwd)"
FONTE="$1"
SAIDA="$RAIZ/saida/$(basename "${FONTE%.cl}")"

# 1) runtime em Java (compila uma vez)
if [ ! -d "$RAIZ/runtime/build" ]; then
    "$RAIZ/runtime/build.sh"
fi

# 2) COOL -> .j
rm -rf "$SAIDA" && mkdir -p "$SAIDA"
python3 "$RAIZ/main.py" "$FONTE" --saida "$SAIDA"

# 3) .j -> .class
if command -v jasmin >/dev/null 2>&1; then
    JASMIN=(jasmin)
elif [ -n "$JASMIN_JAR" ]; then
    JASMIN=(java -jar "$JASMIN_JAR")
else
    echo "Jasmin não encontrado: instale o pacote 'jasmin-sable' ou defina JASMIN_JAR=/caminho/jasmin.jar"
    exit 1
fi
"${JASMIN[@]}" -d "$SAIDA" "$SAIDA"/*.j

if ! ls "$SAIDA"/*.class >/dev/null 2>&1; then
    echo "Erro: o Jasmin não gerou nenhum .class (veja as mensagens acima)."
    exit 1
fi

# 4) executa
echo "---- execução ----"
java -cp "$SAIDA:$RAIZ/runtime/build" CoolRuntime