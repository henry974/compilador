.class public Base
.super CoolIO

.field public nome LCoolObject;
.field public total LCoolObject;

.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial CoolIO/<init>()V
  aload_0
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  putfield Base/nome LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Base/total LCoolObject;
  aload_0
  new CoolString
  dup
  ldc "base"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  putfield Base/nome LCoolObject;
  aload_0
  new CoolInt
  dup
  ldc 100
  invokespecial CoolInt/<init>(I)V
  putfield Base/total LCoolObject;
  return
.end method

.method public _novo()LCoolObject;
  .limit stack 4
  .limit locals 1
  new Base
  dup
  invokespecial Base/<init>()V
  areturn
.end method

.method public mostra()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Base/_s_mostra(LBase;)LCoolObject;
  areturn
.end method

.method public static _s_mostra(LBase;)LCoolObject;
  .limit stack 64
  .limit locals 1
  aload_0
  aload_0
  getfield Base/nome LCoolObject;
  invokevirtual Base/out_string(LCoolObject;)LCoolObject;
  checkcast Base
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Base/out_string(LCoolObject;)LCoolObject;
  checkcast Base
  aload_0
  getfield Base/total LCoolObject;
  invokevirtual Base/out_int(LCoolObject;)LCoolObject;
  checkcast Base
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Base/out_string(LCoolObject;)LCoolObject;
  areturn
.end method

