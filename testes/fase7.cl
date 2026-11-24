-- Fase 7: new, new SELF_TYPE, case, let, isvoid, polimorfismo e lista ligada
class Animal inherits IO {
  nome : String <- "animal";
  som() : String { "..." };
  fala() : Object { out_string(nome).out_string(" faz ").out_string(som()).out_string("\n") };
  copia() : SELF_TYPE { new SELF_TYPE };
};

class Cachorro inherits Animal {
  som() : String { "au au" };
  batiza(n : String) : Cachorro { { nome <- n; self; } };
};

class Gato inherits Animal {
  som() : String { "miau" };
};

class List inherits IO {
  isNil() : Bool { true };
  cons(h : Int) : List { (new Cons).init(h, self) };
  soma() : Int { 0 };
  imprime() : Object { out_string("nil\n") };
};

class Cons inherits List {
  h : Int;
  t : List;
  init(hh : Int, tt : List) : Cons { { h <- hh; t <- tt; self; } };
  isNil() : Bool { false };
  soma() : Int { h + t.soma() };
  imprime() : Object { { out_int(h).out_string(" -> "); t.imprime(); } };
};

class Main inherits IO {
  o : Object;
  i : Int;

  descreve(a : Animal) : String {
    case a of
      c : Cachorro => "cachorro";
      g : Gato => "gato";
      x : Animal => "animal generico";
    esac
  };

  tipo(v : Object) : String {
    case v of
      n : Int => "Int";
      s : String => "String";
      b : Bool => "Bool";
      x : Object => "Object";
    esac
  };

  tamanho(v : Object) : Int {
    case v of
      n : Int => n * 2;
      s : String => s.length();
      x : Object => 0;
    esac
  };

  main() : Object {
    {
      -- new + despacho dinâmico (polimorfismo)
      (new Animal).fala();
      (new Cachorro).batiza("rex").fala();
      (new Gato).fala();

      -- case: o ramo mais específico vence
      out_string(descreve(new Cachorro)).out_string("\n");
      out_string(descreve(new Gato)).out_string("\n");
      out_string(descreve(new Animal)).out_string("\n");
      out_string(tipo(1)).out_string("\n");
      out_string(tipo("s")).out_string("\n");
      out_string(tipo(true)).out_string("\n");
      out_string(tipo(self)).out_string("\n");
      out_int(tamanho(21)).out_string("\n");
      out_int(tamanho("abcde")).out_string("\n");
      out_int(tamanho(self)).out_string("\n");

      -- new SELF_TYPE
      out_string((new Gato).copia().type_name()).out_string("\n");
      out_string((new Cachorro).copia().type_name()).out_string("\n");

      -- new das classes básicas (valores padrão)
      out_int(new Int).out_string("\n");
      out_string("[").out_string(new String).out_string("]\n");
      if new Bool then out_string("ERRO new Bool\n") else out_string("ok new Bool\n") fi;

      -- isvoid
      if isvoid o then out_string("ok o void\n") else out_string("ERRO o void\n") fi;
      if isvoid (new Animal) then out_string("ERRO new Animal void\n") else out_string("ok new Animal nao void\n") fi;
      if isvoid (while false loop 1 pool) then out_string("ok while vale void\n") else out_string("ERRO while void\n") fi;

      -- igualdade por referência
      o <- new Animal;
      if o = o then out_string("ok o = o\n") else out_string("ERRO o = o\n") fi;
      if o = new Animal then out_string("ERRO objetos distintos\n") else out_string("ok objetos distintos\n") fi;
      if o = o.copy() then out_string("ERRO copia\n") else out_string("ok copia e outro objeto\n") fi;

      -- let
      out_int(let x : Int <- 5, y : Int <- x + 1, z : Int in x + y + z).out_string("\n");
      out_int(let x : Int <- 10 in let x : Int <- x + 1 in x).out_string("\n");
      let a : Int <- 1 in { let a : Int <- 2 in out_int(a); out_int(a); };
      out_string("\n");
      out_int(let s : String in s.length()).out_string("\n");
      if let p : Object in isvoid p then out_string("ok let sem init e void\n") else out_string("ERRO let void\n") fi;

      -- let dentro de while: recomeça do valor padrão a cada volta
      i <- 0;
      while i < 3 loop
        {
          let k : Int in { out_int(k); k <- k + 10; out_int(k); };
          out_string("|");
          i <- i + 1;
        }
      pool;
      out_string("\n");
      let a : Int <- 3 in out_int(a).out_string("\n");

      -- lista ligada
      (new List).cons(3).cons(2).cons(1).imprime();
      out_int((new List).cons(3).cons(2).cons(1).soma()).out_string("\n");
      out_string("fim\n");
    }
  };
};
