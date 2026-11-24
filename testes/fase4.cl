-- Fase 4: atributos (padrão e inicializador), herança de atributos, formais, atribuição
class Base inherits IO {
  nome : String <- "base";
  total : Int <- 100;
  mostra() : Object {
    out_string(nome).out_string(" ").out_int(total).out_string("\n")
  };
};

class Main inherits Base {
  x : Int <- 5;
  y : Int <- x + 1;       -- inicializador lê atributo anterior
  z : Int;                -- padrão: 0
  s : String;             -- padrão: ""
  b : Bool;               -- padrão: false
  o : Object;             -- padrão: void
  tmp : Int <- z + 10;

  soma(a : Int, c : Int) : Int { a + c };
  incrementa() : Int { { x <- x + 1; x; } };
  sombra(x : Int) : Int { x * 2 };   -- formal esconde o atributo x

  main() : Object {
    {
      mostra();
      out_int(x).out_string("\n");
      out_int(y).out_string("\n");
      out_int(z).out_string("\n");
      out_string("[").out_string(s).out_string("]\n");
      if b then out_string("ERRO b\n") else out_string("ok b falso\n") fi;
      out_int(tmp).out_string("\n");
      out_int(soma(3, 4)).out_string("\n");
      out_int(incrementa()).out_string("\n");
      out_int(x).out_string("\n");
      out_int(sombra(21)).out_string("\n");
      out_int(x).out_string("\n");
      nome <- "alterado";
      total <- total + 1;
      mostra();
      out_int(x <- 99).out_string("\n");
      out_int(x).out_string("\n");
      out_string("fim\n");
    }
  };
};
