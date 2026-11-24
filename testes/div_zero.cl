-- deve imprimir "antes" e terminar com: Erro de execução: divisão por zero
class Main inherits IO {
  main() : Object {
    {
      out_string("antes\n");
      out_int(1 / 0);
      out_string("depois (nao deve aparecer)\n");
    }
  };
};