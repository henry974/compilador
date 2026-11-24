-- substr fora do intervalo
class Main inherits IO {
  main() : Object {
    {
      out_string("abc".substr(0, 2)).out_string("\n");
      out_string("abc".substr(1, 5)).out_string("\n");
      out_string("depois (nao deve aparecer)\n");
    }
  };
};
