.class public List
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
  new List
  dup
  invokespecial List/<init>()V
  areturn
.end method

.method public isNil()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic List/_s_isNil(LList;)LCoolObject;
  areturn
.end method

.method public static _s_isNil(LList;)LCoolObject;
  .limit stack 64
  .limit locals 1
  new CoolBool
  dup
  iconst_1
  invokespecial CoolBool/<init>(Z)V
  areturn
.end method

.method public cons(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic List/_s_cons(LList;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_cons(LList;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 4
  aload 1
  astore 2
  aload_0
  astore 3
  new Cons
  dup
  invokespecial Cons/<init>()V
  dup
  ifnonnull Lnaovoid1
  ldc "init"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid1:
  checkcast Cons
  aload 2
  aload 3
  invokevirtual Cons/init(LCoolObject;LCoolObject;)LCoolObject;
  areturn
.end method

.method public soma()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic List/_s_soma(LList;)LCoolObject;
  areturn
.end method

.method public static _s_soma(LList;)LCoolObject;
  .limit stack 64
  .limit locals 1
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  areturn
.end method

.method public imprime()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic List/_s_imprime(LList;)LCoolObject;
  areturn
.end method

.method public static _s_imprime(LList;)LCoolObject;
  .limit stack 64
  .limit locals 1
  aload_0
  new CoolString
  dup
  ldc "nil\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual List/out_string(LCoolObject;)LCoolObject;
  areturn
.end method

