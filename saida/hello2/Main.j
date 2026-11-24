.class public Main
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
  new Main
  dup
  invokespecial Main/<init>()V
  areturn
.end method

.method public main()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Main/_s_main(LMain;)LCoolObject;
  areturn
.end method

.method public static _s_main(LMain;)LCoolObject;
  .limit stack 64
  .limit locals 6
  new CoolString
  dup
  ldc "Hello, "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  new CoolString
  dup
  ldc ""
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 2
  new CoolString
  dup
  ldc "!\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 3
  aload_0
  new CoolString
  dup
  ldc "Please enter your name:\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  invokevirtual Main/in_string()LCoolObject;
  dup
  astore 2
  pop
  aload_0
  aload 3
  astore 5
  aload 2
  dup
  ifnonnull Lnaovoid1
  ldc "concat"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid1:
  checkcast CoolString
  aload 5
  invokevirtual CoolString/concat(LCoolObject;)LCoolObject;
  astore 4
  aload 1
  dup
  ifnonnull Lnaovoid2
  ldc "concat"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid2:
  checkcast CoolString
  aload 4
  invokevirtual CoolString/concat(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  areturn
.end method

