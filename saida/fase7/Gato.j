.class public Gato
.super Animal


.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial Animal/<init>()V
  return
.end method

.method public _novo()LCoolObject;
  .limit stack 4
  .limit locals 1
  new Gato
  dup
  invokespecial Gato/<init>()V
  areturn
.end method

.method public som()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Gato/_s_som(LGato;)LCoolObject;
  areturn
.end method

.method public static _s_som(LGato;)LCoolObject;
  .limit stack 64
  .limit locals 1
  new CoolString
  dup
  ldc "miau"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  areturn
.end method

