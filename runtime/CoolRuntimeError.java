/** Erro de execução de um programa COOL (abort, case sem ramo, substr inválido...). */
public class CoolRuntimeError extends RuntimeException {
    public CoolRuntimeError(String mensagem) {
        super(mensagem, null, false, false); // sem stack trace: barato e a mensagem basta
    }
}