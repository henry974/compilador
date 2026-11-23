#!/usr/bin/env bash
# Compila o runtime para runtime/build/ e roda os testes de fumaça.
set -e
cd "$(dirname "$0")"
rm -rf build && mkdir build
javac -d build *.java
echo "Runtime compilado em $(pwd)/build"
java -cp build TesteRuntime