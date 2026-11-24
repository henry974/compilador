class Main inherits IO {
  ola() : Object { out_string("Hello, World!\n") };

  main() : Object {
    {
      ola();
      out_string("Tab:\t|\n");
      out_string("Aspas: \"ok\"\n");
      out_int(42);
      out_string("\n");
      out_string("a").out_string("b").out_string("\n");
    }
  };
};
