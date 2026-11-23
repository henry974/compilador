/** Int do COOL: objeto imutável que embrulha um int de 32 bits. */
public final class CoolInt extends CoolObject {
    public final int value;

    public CoolInt() {            // valor padrão de Int: 0
        this(0);
    }

    public CoolInt(int value) {
        this.value = value;
    }

    @Override
    public CoolObject _novo() {
        return new CoolInt(0);
    }
}