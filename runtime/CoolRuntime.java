import java.io.BufferedOutputStream;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.lang.reflect.InvocationTargetException;

/**
 * Ponto de entrada e funções auxiliares do runtime.
 *
 *   java -cp <pasta com os .class> CoolRuntime
 *
 * carrega a classe "Main" (gerada pelo compilador), cria um objeto e chama main().
 * O código gerado exige: classes, construtores e métodos PUBLIC.
 */
public final class CoolRuntime {

    /** Saída padrão com buffer (muito mais rápida que System.out); descarregada no fim. */
    public static final PrintStream OUT =
            new PrintStream(new BufferedOutputStream(new FileOutputStream(FileDescriptor.out), 1 << 16), false);

    private CoolRuntime() {
    }

    // ------------------------------------------------------------------
    // auxiliares chamados pelo código gerado (todos estáticos)
    // ------------------------------------------------------------------

    /**
     * Operador '=' do COOL: Int, Bool e String comparam por valor;
     * qualquer outro objeto compara por referência (void = null).
     * Descritor: (LCoolObject;LCoolObject;)Z
     */
    public static boolean eq(CoolObject a, CoolObject b) {
        if (a == b) return true;
        if (a == null || b == null) return false;
        if (a instanceof CoolInt && b instanceof CoolInt)
            return ((CoolInt) a).value == ((CoolInt) b).value;
        if (a instanceof CoolBool && b instanceof CoolBool)
            return ((CoolBool) a).value == ((CoolBool) b).value;
        if (a instanceof CoolString && b instanceof CoolString)
            return ((CoolString) a).value.equals(((CoolString) b).value);
        return false;
    }

    /** Despacho (dinâmico ou estático) sobre void. Uso no código gerado: invokestatic ... ; athrow */
    public static CoolRuntimeError despachoSobreVoid(String metodo) {
        return new CoolRuntimeError("despacho de '" + metodo + "' sobre um valor void");
    }

    /** "case" sobre void. Uso no código gerado:  invokestatic ...caseSobreVoid()  ;  athrow */
    public static CoolRuntimeError caseSobreVoid() {
        return new CoolRuntimeError("case sobre uma expressão void");
    }

    /** "case" em que nenhum ramo casa com o tipo do valor. Uso: invokestatic ... ; athrow */
    public static CoolRuntimeError caseSemRamo(CoolObject valor) {
        return new CoolRuntimeError("nenhum ramo do case casa com o tipo '" + valor._nomeCool() + "'");
    }

    // ------------------------------------------------------------------
    // ponto de entrada
    // ------------------------------------------------------------------

    public static void main(String[] args) {
        final int[] codigo = {0};
        // thread com pilha grande: programas COOL recursivos estouram a pilha padrão da JVM cedo demais
        Thread t = new Thread(null, () -> codigo[0] = executar(), "cool-main", 1L << 29);
        t.start();
        try {
            t.join();
        } catch (InterruptedException e) {
            codigo[0] = 1;
        }
        OUT.flush();
        System.exit(codigo[0]);
    }

    private static int executar() {
        try {
            Class<?> classeMain = Class.forName("Main");
            Object programa = classeMain.getDeclaredConstructor().newInstance();
            classeMain.getMethod("main").invoke(programa);
            return 0;
        } catch (InvocationTargetException e) {
            return tratar(e.getCause());
        } catch (ClassNotFoundException e) {
            return falha("classe Main não encontrada (o classpath inclui a pasta dos .class gerados?)");
        } catch (NoSuchMethodException e) {
            return falha("a classe Main não tem um método main() público sem parâmetros");
        } catch (Throwable e) {
            return tratar(e);
        }
    }

    private static int tratar(Throwable e) {
        if (e instanceof CoolRuntimeError)
            return falha(e.getMessage());
        if (e instanceof NullPointerException)
            return falha("despacho (ou acesso) sobre um valor void");
        if (e instanceof ArithmeticException)
            return falha("divisão por zero");
        if (e instanceof StackOverflowError)
            return falha("estouro da pilha (recursão muito profunda)");
        // qualquer outra coisa é quase certamente bug do gerador (ClassCastException, VerifyError...)
        OUT.flush();
        System.err.println("Erro interno do runtime (provável bug do gerador de código):");
        e.printStackTrace();
        return 2;
    }

    private static int falha(String mensagem) {
        OUT.flush(); // garante que a saída normal apareça antes da mensagem de erro
        System.err.println("Erro de execução: " + mensagem);
        return 1;
    }
}