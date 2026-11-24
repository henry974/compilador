-- Fase 5: despacho dinâmico e estático, redefinição de métodos, SELF_TYPE,
-- métodos das classes básicas, recursão e ordem de avaliação
class A inherits IO {
  nome() : String { "A" };
  quem() : Object { out_string("sou ").out_string(nome()).out_string("\n") };
  dobro(n : Int) : Int { n * 2 };
  eu() : SELF_TYPE { self };
};

class Main inherits A {
  nome() : String { "Main" };          -- redefine A.nome
  dobro(n : Int) : Int { n * 3 };      -- redefine A.dobro
  fat(n : Int) : Int { if n < 2 then 1 else n * fat(n - 1) fi };
  trace(s : String, n : Int) : Int { { out_string(s); n; } };
  eu_trace() : Main { { out_string("receptor "); self; } };

  main() : Object {
    {
      quem();                                               -- sou Main (nome() é virtual)
      self@A.quem();                                        -- sou Main (quem() de A, mas nome() ainda é virtual)
      out_string(self@A.nome()).out_string("\n");           -- A  (estático: usa A.nome)
      out_string(nome()).out_string("\n");                  -- Main
      out_int(dobro(5)).out_string("\n");                   -- 15
      out_int(self@A.dobro(5)).out_string("\n");            -- 10
      out_int(fat(5)).out_string("\n");                     -- 120
      out_string(type_name()).out_string("\n");             -- Main
      out_string(self@Object.type_name()).out_string("\n"); -- Main (receptor continua sendo um Main)
      out_int("hello".length()).out_string("\n");           -- 5
      out_string("ab".concat("cd")).out_string("\n");       -- abcd
      out_string("abcdef".substr(1, 3)).out_string("\n");   -- bcd
      eu().eu().quem();                                     -- sou Main (cadeia com SELF_TYPE)
      self@IO.out_string("via IO\n");                       -- via IO
      out_int(eu_trace().dobro(trace("arg ", 1))).out_string("\n");  -- arg receptor 3
      out_int(copy().dobro(2)).out_string("\n");            -- 6
      out_string("fim\n");
    }
  };
};
