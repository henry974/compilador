-- deve imprimir "antes" e terminar com: Erro de execução: case sobre uma expressão void
class Main inherits IO {
  o : Object;
  main() : Object {
    {
      out_string("antes\n");
      case o of x : Object => 1; esac;
      out_string("depois (nao deve aparecer)\n");
    }
  };
};
