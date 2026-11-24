.class public A
.super CoolIO


.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial CoolIO/<init>()V
  return
.end method

.method public _novo()LCoolObject;
  .limit stack 4
  .limit locals 1
  new A
  dup
  invokespecial A/<init>()V
  areturn
.end method

.method public nome()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic A/_s_nome(LA;)LCoolObject;
  areturn
.end method

.method public static _s_nome(LA;)LCoolObject;
  .limit stack 64
  .limit locals 1
  new CoolString
  dup
  ldc "A"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  areturn
.end method

.method public quem()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic A/_s_quem(LA;)LCoolObject;
  areturn
.end method

.method public static _s_quem(LA;)LCoolObject;
  .limit stack 64
  .limit locals 3
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  invokevirtual A/nome()LCoolObject;
  astore 2
  aload_0
  new CoolString
  dup
  ldc "sou "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual A/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid1
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid1:
  checkcast A
  aload 2
  invokevirtual A/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid2
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid2:
  checkcast A
  aload 1
  invokevirtual A/out_string(LCoolObject;)LCoolObject;
  areturn
.end method

.method public dobro(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic A/_s_dobro(LA;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_dobro(LA;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
  areturn
.end method

.method public eu()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic A/_s_eu(LA;)LCoolObject;
  areturn
.end method

.method public static _s_eu(LA;)LCoolObject;
  .limit stack 64
  .limit locals 1
  aload_0
  areturn
.end method

