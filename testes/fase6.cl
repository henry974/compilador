-- Fase 6: while (contagem, acumulador, laços aninhados, condição falsa, laço longo)
class Main inherits IO {
  i : Int;
  j : Int;
  acc : Int;
  soma : Int;

  -- o while é o corpo do método (vale void) e altera o formal n
  contagem_regressiva(n : Int) : Object {
    while 0 < n loop { out_int(n).out_string("|"); n <- n - 1; } pool
  };

  fat_iter(n : Int) : Int {
    {
      acc <- 1;
      while 1 < n loop { acc <- acc * n; n <- n - 1; } pool;
      acc;
    }
  };

  tabuada() : Object {
    {
      i <- 1;
      while i < 4 loop
        {
          j <- 1;
          while j < 4 loop { out_int(i * j).out_string("|"); j <- j + 1; } pool;
          out_string("\n");
          i <- i + 1;
        }
      pool;
    }
  };

  soma_ate(n : Int) : Int {
    {
      soma <- 0;
      i <- 1;
      while i < n + 1 loop { soma <- soma + i; i <- i + 1; } pool;
      soma;
    }
  };

  main() : Object {
    {
      contagem_regressiva(3);
      out_string("\n");
      out_int(fat_iter(5)).out_string("\n");
      tabuada();
      while false loop out_string("ERRO while false\n") pool;
      out_int(soma_ate(60000)).out_string("\n");
      out_string("fim\n");
    }
  };
};
