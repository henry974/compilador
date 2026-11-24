-- deve imprimir "antes" e terminar com: Erro de execução: nenhum ramo do case casa com o tipo 'A'
class A inherits IO {
};

class B inherits A {
};

class Main inherits IO {
  main() : Object {
    {
      out_string("antes\n");
      case new A of b : B => 1; esac;
      out_string("depois (nao deve aparecer)\n");
    }
  };
};
