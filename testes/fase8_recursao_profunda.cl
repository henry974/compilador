-- recursão legítima e profunda (100000 chamadas) não pode estourar a pilha
class Main inherits IO {
  conta(n : Int) : Int { if n = 0 then 0 else 1 + conta(n - 1) fi };
  main() : Object { out_int(conta(100000)).out_string("\n") };
};
