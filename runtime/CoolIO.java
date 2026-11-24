import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/** Classe IO do COOL. Os métodos de saída devolvem SELF_TYPE (self). */
public class CoolIO extends CoolObject {
    private static final BufferedReader ENTRADA = new BufferedReader(new InputStreamReader(System.in));

    public CoolIO() {
    }

    // ---- out_string(x : String) : SELF_TYPE ----
    public CoolObject out_string(CoolObject x) {
        return _s_out_string(this, x);
    }

    public static CoolObject _s_out_string(CoolIO self, CoolObject x) {
        CoolRuntime.OUT.print(((CoolString) x).value);
        return self;
    }

    // ---- out_int(x : Int) : SELF_TYPE ----
    public CoolObject out_int(CoolObject x) {
        return _s_out_int(this, x);
    }

    public static CoolObject _s_out_int(CoolIO self, CoolObject x) {
        CoolRuntime.OUT.print(((CoolInt) x).value);
        return self;
    }

    // ---- in_string() : String -- lê uma linha (sem o \n); EOF devolve "" ----
    public CoolObject in_string() {
        return _s_in_string(this);
    }

    public static CoolObject _s_in_string(CoolIO self) {
        CoolRuntime.OUT.flush(); // programas interativos: mostra o prompt antes de ler
        try {
            String linha = ENTRADA.readLine();
            return new CoolString(linha == null ? "" : linha);
        } catch (IOException e) {
            return new CoolString("");
        }
    }

    // ---- in_int() : Int -- lê uma linha e converte; se não for inteiro válido, devolve 0 ----
    public CoolObject in_int() {
        return _s_in_int(this);
    }

    public static CoolObject _s_in_int(CoolIO self) {
        CoolRuntime.OUT.flush();
        try {
            String linha = ENTRADA.readLine();
            return new CoolInt(linha == null ? 0 : lerInteiro(linha));
        } catch (IOException e) {
            return new CoolInt(0);
        }
    }

    /** Lê um inteiro (com sinal opcional) no início do texto; 0 se não houver ou se estourar 32 bits. */
    static int lerInteiro(String s) {
        s = s.trim();
        int i = 0, n = s.length();
        boolean negativo = false;
        if (i < n && (s.charAt(i) == '-' || s.charAt(i) == '+')) {
            negativo = s.charAt(i) == '-';
            i++;
        }
        long v = 0;
        int digitos = 0;
        while (i < n && s.charAt(i) >= '0' && s.charAt(i) <= '9') {
            v = v * 10 + (s.charAt(i) - '0');
            if (v > 2147483648L) return 0;
            i++;
            digitos++;
        }
        if (digitos == 0) return 0;
        if (negativo) v = -v;
        if (v < Integer.MIN_VALUE || v > Integer.MAX_VALUE) return 0;
        return (int) v;
    }

    @Override
    public CoolObject _novo() {
        return new CoolIO();
    }
}