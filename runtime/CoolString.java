/** String do COOL: objeto imutável que embrulha um java.lang.String. */
public final class CoolString extends CoolObject {
    public final String value;

    public CoolString() {         // valor padrão de String: ""
        this("");
    }

    public CoolString(String value) {
        this.value = value;
    }

    // ---- length() : Int ----
    public CoolObject length() {
        return _s_length(this);
    }

    public static CoolObject _s_length(CoolString self) {
        return new CoolInt(self.value.length());
    }

    // ---- concat(s : String) : String ----
    public CoolObject concat(CoolObject s) {
        return _s_concat(this, s);
    }

    public static CoolObject _s_concat(CoolString self, CoolObject s) {
        return new CoolString(self.value + ((CoolString) s).value);
    }

    // ---- substr(i : Int, l : Int) : String -- erro de execução se fora do intervalo ----
    public CoolObject substr(CoolObject i, CoolObject l) {
        return _s_substr(this, i, l);
    }

    public static CoolObject _s_substr(CoolString self, CoolObject i, CoolObject l) {
        long ini = ((CoolInt) i).value;
        long len = ((CoolInt) l).value;
        if (ini < 0 || len < 0 || ini + len > self.value.length()) {
            throw new CoolRuntimeError("substr fora do intervalo: substr(" + ini + ", " + len
                    + ") em String de tamanho " + self.value.length());
        }
        return new CoolString(self.value.substring((int) ini, (int) (ini + len)));
    }

    @Override
    public CoolObject _novo() {
        return new CoolString("");
    }
}