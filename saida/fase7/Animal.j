.class public Animal
.super CoolIO

.field public nome LCoolObject;

.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial CoolIO/<init>()V
  aload_0
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  putfield Animal/nome LCoolObject;
  aload_0
  new CoolString
  dup
  ldc "animal"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  putfield Animal/nome LCoolObject;
  return
.end method

.method public _novo()LCoolObject;
  .limit stack 4
  .limit locals 1
  new Animal
  dup
  invokespecial Animal/<init>()V
  areturn
.end method

.method public som()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Animal/_s_som(LAnimal;)LCoolObject;
  areturn
.end method

.method public static _s_som(LAnimal;)LCoolObject;
  .limit stack 64
  .limit locals 1
  new CoolString
  dup
  ldc "..."
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  areturn
.end method

.method public fala()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Animal/_s_fala(LAnimal;)LCoolObject;
  areturn
.end method

.method public static _s_fala(LAnimal;)LCoolObject;
  .limit stack 64
  .limit locals 4
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  invokevirtual Animal/som()LCoolObject;
  astore 2
  new CoolString
  dup
  ldc " faz "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 3
  aload_0
  aload_0
  getfield Animal/nome LCoolObject;
  invokevirtual Animal/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid1
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid1:
  checkcast Animal
  aload 3
  invokevirtual Animal/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid2
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid2:
  checkcast Animal
  aload 2
  invokevirtual Animal/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid3
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid3:
  checkcast Animal
  aload 1
  invokevirtual Animal/out_string(LCoolObject;)LCoolObject;
  areturn
.end method

.method public copia()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Animal/_s_copia(LAnimal;)LCoolObject;
  areturn
.end method

.method public static _s_copia(LAnimal;)LCoolObject;
  .limit stack 64
  .limit locals 1
  aload_0
  invokevirtual Animal/_novo()LCoolObject;
  areturn
.end method

