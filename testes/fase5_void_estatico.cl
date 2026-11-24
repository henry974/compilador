-- deve imprimir "antes" e terminar com: Erro de execução: despacho de 'type_name' sobre um valor void
class Main inherits IO {
  o : Object;
  main() : Object {
    {
      out_string("antes\n");
      o@Object.type_name();
      out_string("depois (nao deve aparecer)\n");
    }
  };
};
