
/** Bool do COOL: objeto imutável que embrulha um boolean. */
public final class CoolBool extends CoolObject {
    public final boolean value;

    public CoolBool() {           // valor padrão de Bool: false
        this(false);
    }

    public CoolBool(boolean value) {
        this.value = value;
    }

    /** Atalho estático, útil para o código gerado: CoolBool.of(Z)LCoolBool; */
    public static CoolBool of(boolean b) {
        return new CoolBool(b);
    }

    @Override
    public CoolObject _novo() {
        return new CoolBool(false);
    }
}
