#!/usr/bin/env bash
# Roda todos os testes/*.cl que têm um .esperado ao lado e compara a saída do programa COOL
# (stdout e stderr, na ordem em que aparecem) e o código de saída.
#
# Arquivos ao lado de testes/X.cl:
#   X.esperado  (obrigatório) saída esperada
#   X.entrada   (opcional)    texto enviado ao stdin do programa
#   X.codigo    (opcional)    código de saída esperado; sem o arquivo, espera-se 0
RAIZ="$(cd "$(dirname "$0")" && pwd)"
ok=0; falha=0
for esperado in "$RAIZ"/testes/*.esperado; do
    base="$(basename "$esperado" .esperado)"

    entrada=/dev/null
    [ -f "$RAIZ/testes/$base.entrada" ] && entrada="$RAIZ/testes/$base.entrada"
    codigo_esperado=0
    [ -f "$RAIZ/testes/$base.codigo" ] && codigo_esperado="$(tr -d '[:space:]' < "$RAIZ/testes/$base.codigo")"

    bruto="$("$RAIZ/compilar.sh" "$RAIZ/testes/$base.cl" < "$entrada" 2>&1; echo "@@CODIGO=$?")"
    codigo="${bruto##*@@CODIGO=}"
    real="$(printf '%s\n' "${bruto%@@CODIGO=*}" | sed -n '/---- execução ----/,$p' | tail -n +2)"

    problemas=""
    [ "$real" == "$(cat "$esperado")" ] || problemas="saída diferente"
    [ "$codigo" == "$codigo_esperado" ] || problemas="${problemas:+$problemas; }código de saída $codigo (esperado $codigo_esperado)"

    if [ -z "$problemas" ]; then
        echo "[ok]    $base"; ok=$((ok + 1))
    else
        echo "[FALHA] $base -- $problemas"; falha=$((falha + 1))
        diff <(echo "$real") "$esperado" | head -n 10
    fi
done
echo; echo "$ok passou, $falha falhou"
[ "$falha" -eq 0 ]