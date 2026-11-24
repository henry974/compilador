/**
 * Classe Object do COOL. Toda classe COOL (inclusive as geradas pelo compilador)
 * descende desta.
 *
 * Convenções:
 *  - todos os métodos têm assinatura "apagada" (parâmetros e retorno CoolObject);
 *  - cada método tem uma versão virtual (f) que só delega para uma versão ESTÁTICA (_s_f),
 *    onde está a implementação. O despacho estático do COOL (e@Object.f()) usa a estática,
 *    exatamente como o código gerado para as classes do usuário.
 */
public class CoolObject implements Cloneable {

    public CoolObject() {
    }

    // ---- abort ----
    public CoolObject abort() {
        return _s_abort(this);
    }

    public static CoolObject _s_abort(CoolObject self) {
        throw new CoolRuntimeError("abort() chamado em objeto da classe " + self._nomeCool());
    }

    // ---- type_name ----
    public CoolObject type_name() {
        return _s_type_name(this);
    }

    public static CoolObject _s_type_name(CoolObject self) {
        return new CoolString(self._nomeCool());
    }

    // ---- copy (cópia rasa) ----
    public CoolObject copy() {
        return _s_copy(this);
    }

    public static CoolObject _s_copy(CoolObject self) {
        try {
            return (CoolObject) self.clone();
        } catch (CloneNotSupportedException e) {
            throw new CoolRuntimeError("falha ao copiar objeto: " + e.getMessage());
        }
    }

    /**
     * Cria uma instância nova da classe dinâmica deste objeto (usado por "new SELF_TYPE").
     * O compilador gera uma redefinição deste método em cada classe do usuário.
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