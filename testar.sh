#!/usr/bin/env bash
# Roda todos os testes/*.cl que têm um .esperado ao lado e compara a saída.
# Uso: ./testar.sh
RAIZ="$(cd "$(dirname "$0")" && pwd)"
ok=0; falha=0
for esperado in "$RAIZ"/testes/*.esperado; do
    base="$(basename "$esperado" .esperado)"
    real="$("$RAIZ/compilar.sh" "$RAIZ/testes/$base.cl" 2>&1 \
            | sed -n '/---- execução ----/,$p' | tail -n +2)"
    if [ "$real" == "$(cat "$esperado")" ]; then
        echo "[ok]    $base"; ok=$((ok + 1))
    else
        echo "[FALHA] $base"; falha=$((falha + 1))
        diff <(echo "$real") "$esperado" | head -n 10
    fi
done
echo; echo "$ok passou, $falha falhou"
[ "$falha" -eq 0 ]