.class public B
.super A


.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial A/<init>()V
  return
.end method

.method public _novo()LCoolObject;
  .limit stack 4
  .limit locals 1
  new B
  dup
  invokespecial B/<init>()V
  areturn
.end method

