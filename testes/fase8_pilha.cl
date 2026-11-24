-- recursão infinita: estouro da pilha vira erro de execução
class Main inherits IO {
  infinita(n : Int) : Int { infinita(n + 1) + 1 };
  main() : Object {
    {
      out_string("antes\n");
      out_int(infinita(0));
      out_string("depois (nao deve aparecer)\n");
    }
  };
};
