.class public Cachorro
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
  new Cachorro
  dup
  invokespecial Cachorro/<init>()V
  areturn
.end method

.method public som()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Cachorro/_s_som(LCachorro;)LCoolObject;
  areturn
.end method

.method public static _s_som(LCachorro;)LCoolObject;
  .limit stack 64
  .limit locals 1
  new CoolString
  dup
  ldc "au au"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  areturn
.end method

.method public batiza(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Cachorro/_s_batiza(LCachorro;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_batiza(LCachorro;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  aload 1
  dup_x1
  putfield Animal/nome LCoolObject;
  pop
  aload_0
  areturn
.end method

