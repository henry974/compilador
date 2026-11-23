/** String do COOL: objeto imutável que embrulha um java.lang.String. */
public final class CoolString extends CoolObject {
    public final String value;

    public CoolString() {         // valor padrão de String: ""
        this("");
    }

    public CoolString(String value) {
        this.value = value;
    }

    /** String.length() : Int */
    public CoolObject length() {
        return new CoolInt(value.length());
    }

    /** String.concat(s : String) : String */
    public CoolObject concat(CoolObject s) {
        return new CoolString(value + ((CoolString) s).value);
    }

    /** String.substr(i : Int, l : Int) : String  -- erro de execução se fora do intervalo. */
    public CoolObject substr(CoolObject i, CoolObject l) {
        long ini = ((CoolInt) i).value;
        long len = ((CoolInt) l).value;
        if (ini < 0 || len < 0 || ini + len > value.length()) {
            throw new CoolRuntimeError("substr fora do intervalo: substr(" + ini + ", " + len
                    + ") em String de tamanho " + value.length());
        }
        return new CoolString(value.substring((int) ini, (int) (ini + len)));
    }

    @Override
    public CoolObject _novo() {
        return new CoolString("");
    }
}