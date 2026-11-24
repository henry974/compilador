.class public Cons
.super List

.field public h LCoolObject;
.field public t LCoolObject;

.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial List/<init>()V
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Cons/h LCoolObject;
  aload_0
  aconst_null
  putfield Cons/t LCoolObject;
  return
.end method

.method public _novo()LCoolObject;
  .limit stack 4
  .limit locals 1
  new Cons
  dup
  invokespecial Cons/<init>()V
  areturn
.end method

.method public init(LCoolObject;LCoolObject;)LCoolObject;
  .limit stack 3
  .limit locals 3
  aload 0
  aload 1
  aload 2
  invokestatic Cons/_s_init(LCons;LCoolObject;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_init(LCons;LCoolObject;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 3
  aload_0
  aload 1
  dup_x1
  putfield Cons/h LCoolObject;
  pop
  aload_0
  aload 2
  dup_x1
  putfield Cons/t LCoolObject;
  pop
  aload_0
  areturn
.end method

.method public isNil()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Cons/_s_isNil(LCons;)LCoolObject;
  areturn
.end method

.method public static _s_isNil(LCons;)LCoolObject;
  .limit stack 64
  .limit locals 1
  new CoolBool
  dup
  iconst_0
  invokespecial CoolBool/<init>(Z)V
  areturn
.end method

.method public soma()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Cons/_s_soma(LCons;)LCoolObject;
  areturn
.end method

.method public static _s_soma(LCons;)LCoolObject;
  .limit stack 64
  .limit locals 1
  aload_0
  getfield Cons/h LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Cons/t LCoolObject;
  dup
  ifnonnull Lnaovoid1
  ldc "soma"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid1:
  checkcast List
  invokevirtual List/soma()LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  areturn
.end method

.method public imprime()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Cons/_s_imprime(LCons;)LCoolObject;
  areturn
.end method

.method public static _s_imprime(LCons;)LCoolObject;
  .limit stack 64
  .limit locals 2
  new CoolString
  dup
  ldc " -> "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  aload_0
  getfield Cons/h LCoolObject;
  invokevirtual Cons/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid2
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid2:
  checkcast Cons
  aload 1
  invokevirtual Cons/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  getfield Cons/t LCoolObject;
  dup
  ifnonnull Lnaovoid3
  ldc "imprime"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid3:
  checkcast List
  invokevirtual List/imprime()LCoolObject;
  areturn
.end method

