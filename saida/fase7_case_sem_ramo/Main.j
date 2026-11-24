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
  .limit locals 2
  aload_0
  new CoolString
  dup
  ldc "antes\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new A
  dup
  invokespecial A/<init>()V
  dup
  ifnonnull Lcaseok1
  invokestatic CoolRuntime/caseSobreVoid()LCoolRuntimeError;
  athrow
Lcaseok1:
  astore 1
  aload 1
  instanceof B
  ifeq Lproximo3
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfimcase2
Lproximo3:
  aload 1
  invokestatic CoolRuntime/caseSemRamo(LCoolObject;)LCoolRuntimeError;
  athrow
Lfimcase2:
  pop
  aload_0
  new CoolString
  dup
  ldc "depois (nao deve aparecer)\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  areturn
.end method

