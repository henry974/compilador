/** Testes de fumaça do runtime (sem JUnit). Executar: java -cp build TesteRuntime */
public class TesteRuntime {
    static int falhas = 0;

    static void check(String nome, boolean ok) {
        System.out.println((ok ? "[ok]   " : "[FALHA] ") + nome);
        if (!ok) falhas++;
    }

    static boolean lanca(Runnable r) {
        try { r.run(); return false; } catch (CoolRuntimeError e) { return true; }
    }

    static boolean lancaNpe(Runnable r) {
        try { r.run(); return false; } catch (NullPointerException e) { return true; }
    }

    static String s(CoolObject o) { return ((CoolString) o).value; }
    static int i(CoolObject o) { return ((CoolInt) o).value; }

    public static void main(String[] args) {
        // valores básicos
        check("Int padrão = 0", new CoolInt().value == 0);
        check("Bool padrão = false", !new CoolBool().value);
        check("String padrão = \"\"", s(new CoolString()).isEmpty());

        // String
        CoolString oi = new CoolString("hello");
        check("length", i(oi.length()) == 5);
        check("concat", s(oi.concat(new CoolString(" world"))).equals("hello world"));
        check("substr", s(oi.substr(new CoolInt(1), new CoolInt(3))).equals("ell"));
        check("substr no limite", s(oi.substr(new CoolInt(5), new CoolInt(0))).isEmpty());
        check("substr fora do intervalo", lanca(() -> oi.substr(new CoolInt(3), new CoolInt(5))));
        check("substr índice negativo", lanca(() -> oi.substr(new CoolInt(-1), new CoolInt(1))));

        // Object
        check("type_name Object", s(new CoolObject().type_name()).equals("Object"));
        check("type_name IO", s(new CoolIO().type_name()).equals("IO"));
        check("type_name Int", s(new CoolInt(3).type_name()).equals("Int"));
        check("type_name Bool", s(new CoolBool(true).type_name()).equals("Bool"));
        check("type_name String", s(oi.type_name()).equals("String"));
        check("type_name classe do usuário", s(new Foo().type_name()).equals("Foo"));
        check("abort lança erro", lanca(() -> new Foo().abort()));
        Foo f = new Foo();
        CoolObject copia = f.copy();
        check("copy gera outro objeto da mesma classe", copia != f && copia instanceof Foo);
        check("_novo em classe básica", new CoolInt(9)._novo() instanceof CoolInt);

        // igualdade
        check("eq Int por valor", CoolRuntime.eq(new CoolInt(4), new CoolInt(4)));
        check("eq Int diferente", !CoolRuntime.eq(new CoolInt(4), new CoolInt(5)));
        check("eq String por valor", CoolRuntime.eq(new CoolString("a"), new CoolString("a")));
        check("eq Bool por valor", CoolRuntime.eq(new CoolBool(true), new CoolBool(true)));
        check("eq objetos por referência", !CoolRuntime.eq(new Foo(), new Foo()) && CoolRuntime.eq(f, f));
        check("eq void = void", CoolRuntime.eq(null, null));
        check("eq void vs objeto", !CoolRuntime.eq(null, f));
        check("eq Int vs String", !CoolRuntime.eq(new CoolInt(1), new CoolString("1")));

        // versões estáticas (usadas pelo despacho estático e@T.f())
        check("_s_type_name estático", s(CoolObject._s_type_name(new Foo())).equals("Foo"));
        check("_s_length estático", i(CoolString._s_length(oi)) == 5);
        check("_s_out_string devolve self", CoolIO._s_out_string(new Foo(), new CoolString("")) != null);
        check("_s_type_name sobre void lança NPE", lancaNpe(() -> CoolObject._s_type_name(null)));
        check("despachoSobreVoid", CoolRuntime.despachoSobreVoid("f").getMessage().contains("'f'"));

        // conversão de entrada
        check("lerInteiro 42", CoolIO.lerInteiro("42") == 42);
        check("lerInteiro -7 com lixo", CoolIO.lerInteiro("  -7abc") == -7);
        check("lerInteiro inválido", CoolIO.lerInteiro("abc") == 0);
        check("lerInteiro estouro", CoolIO.lerInteiro("99999999999") == 0);
        check("lerInteiro INT_MIN", CoolIO.lerInteiro("-2147483648") == Integer.MIN_VALUE);

        // saída (via buffer do runtime)
        CoolIO io = new CoolIO();
        ((CoolIO) io.out_string(new CoolString("saida: "))).out_string(new CoolString("ok\n"));
        CoolRuntime.OUT.flush();

        System.out.println(falhas == 0 ? "\nTodos os testes passaram." : "\n" + falhas + " teste(s) falharam.");
        System.exit(falhas == 0 ? 0 : 1);
    }
}

/** Simula uma classe gerada pelo compilador (pacote padrão, herda de CoolIO). */
class Foo extends CoolIO {
}