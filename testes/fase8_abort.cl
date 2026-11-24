-- abort() encerra o programa com erro de execução
class Main inherits IO {
  main() : Object {
    {
      out_string("antes\n");
      abort();
      out_string("depois (nao deve aparecer)\n");
    }
  };
};
    