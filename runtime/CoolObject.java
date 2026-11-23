
public class CoolObject implements Cloneable {

    public CoolObject() {
    }

    /** Object.abort(): encerra o programa com erro. */
    public CoolObject abort() {
        throw new CoolRuntimeError("abort() chamado em objeto da classe " + _nomeCool());
    }

    /** Object.type_name(): nome da classe dinâmica, como String. */
    public CoolObject type_name() {
        return new CoolString(_nomeCool());
    }

    /** Object.copy(): cópia rasa (shallow copy). */
    public CoolObject copy() {
        try {
            return (CoolObject) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new CoolRuntimeError("falha ao copiar objeto: " + e.getMessage());
        }
    }

    /**
     * Cria uma instância nova da classe dinâmica deste objeto (usado por "new SELF_TYPE").
     * O compilador deve gerar uma redefinição deste método em cada classe do usuário.
     */
    public CoolObject _novo() {
        return new CoolObject();
    }

    /** Nome COOL da classe (o prefixo "_" evita colisão com métodos do usuário). */
    public String _nomeCool() {
        String n = getClass().getName();
        switch (n) {
            case "CoolObject": return "Object";
            case "CoolIO":     return "IO";
            case "CoolInt":    return "Int";
            case "CoolBool":   return "Bool";
            case "CoolString": return "String";
            default:           return n; // classes do usuário usam o mesmo nome do COOL
        }
    }
}