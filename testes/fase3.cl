-- Fase 3: aritmética, ~, not, comparações (e if para observar os Bool)
class Main inherits IO {
  main() : Object {
    {
      out_int(1 + 2 * 3).out_string("\n");            -- 7  (precedência)
      out_int((1 + 2) * 3).out_string("\n");          -- 9
      out_int(10 - 3 - 2).out_string("\n");           -- 5  (assoc. à esquerda)
      out_int(20 / 6).out_string("\n");               -- 3
      out_int(~5).out_string("\n");                   -- -5
      out_int(~(2 - 10)).out_string("\n");            -- 8
      out_int(2147483647 + 1).out_string("\n");       -- estouro: -2147483648
      out_int(7 / 2 * 2).out_string("\n");            -- 6

      if 1 < 2 then out_string("ok 1 < 2\n") else out_string("ERRO 1 < 2\n") fi;
      if 2 < 2 then out_string("ERRO 2 < 2\n") else out_string("ok 2 < 2 e falso\n") fi;
      if 2 <= 2 then out_string("ok 2 <= 2\n") else out_string("ERRO 2 <= 2\n") fi;
      if 3 <= 2 then out_string("ERRO 3 <= 2\n") else out_string("ok 3 <= 2 e falso\n") fi;
      if 3 = 3 then out_string("ok 3 = 3\n") else out_string("ERRO 3 = 3\n") fi;
      if 3 = 4 then out_string("ERRO 3 = 4\n") else out_string("ok 3 = 4 e falso\n") fi;
      if "abc" = "abc" then out_string("ok strings iguais\n") else out_string("ERRO strings iguais\n") fi;
      if "abc" = "abd" then out_string("ERRO strings diferentes\n") else out_string("ok strings diferentes\n") fi;
      if true = true then out_string("ok true = true\n") else out_string("ERRO true = true\n") fi;
      if not false then out_string("ok not false\n") else out_string("ERRO not false\n") fi;
      if not true then out_string("ERRO not true\n") else out_string("ok not true e falso\n") fi;
      if not (1 = 2) then out_string("ok not (1 = 2)\n") else out_string("ERRO not (1 = 2)\n") fi;

      out_string("fim\n");
    }
  };
};