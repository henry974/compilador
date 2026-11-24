-- in_string / in_int (a entrada vem de fase8_entrada.entrada)
class Main inherits IO {
  main() : Object {
    {
      out_string("Nome: ");
      let nome : String <- in_string() in out_string("Ola, ").out_string(nome).out_string("!\n");
      out_string("Numero: ");
      let n : Int <- in_int() in out_int(n * 2).out_string("\n");
      let ruim : Int <- in_int() in out_int(ruim).out_string("\n");
      out_string("[").out_string(in_string()).out_string("]\n");
    }
  };
};
