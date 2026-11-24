-- deve imprimir "antes" e terminar com: Erro de execução: despacho de 'abort' sobre um valor void
class Main inherits IO {
  o : Object;
  main() : Object {
    {
      out_string("antes\n");
      o.abort();
      out_string("depois (nao deve aparecer)\n");
    }
  };
};
