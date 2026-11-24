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
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid1
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid1:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid2
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid2:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  new CoolInt
  dup
  ldc 10
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  isub
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  isub
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid3
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid3:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  new CoolInt
  dup
  ldc 20
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 6
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  idiv
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid4
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid4:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  ineg
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid5
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid5:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 10
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  isub
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  ineg
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid6
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid6:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  new CoolInt
  dup
  ldc 2147483647
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid7
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid7:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  new CoolInt
  dup
  ldc 7
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  idiv
  invokestatic CoolInt/of(I)LCoolInt;
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
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid8
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid8:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade11
  iconst_0
  goto Lfim12
Lverdade11:
  iconst_1
Lfim12:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao9
  aload_0
  new CoolString
  dup
  ldc "ok 1 < 2\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim10
Lsenao9:
  aload_0
  new CoolString
  dup
  ldc "ERRO 1 < 2\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim10:
  pop
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade15
  iconst_0
  goto Lfim16
Lverdade15:
  iconst_1
Lfim16:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao13
  aload_0
  new CoolString
  dup
  ldc "ERRO 2 < 2\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim14
Lsenao13:
  aload_0
  new CoolString
  dup
  ldc "ok 2 < 2 e falso\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim14:
  pop
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmple Lverdade19
  iconst_0
  goto Lfim20
Lverdade19:
  iconst_1
Lfim20:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao17
  aload_0
  new CoolString
  dup
  ldc "ok 2 <= 2\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim18
Lsenao17:
  aload_0
  new CoolString
  dup
  ldc "ERRO 2 <= 2\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim18:
  pop
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmple Lverdade23
  iconst_0
  goto Lfim24
Lverdade23:
  iconst_1
Lfim24:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao21
  aload_0
  new CoolString
  dup
  ldc "ERRO 3 <= 2\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim22
Lsenao21:
  aload_0
  new CoolString
  dup
  ldc "ok 3 <= 2 e falso\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim22:
  pop
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao25
  aload_0
  new CoolString
  dup
  ldc "ok 3 = 3\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim26
Lsenao25:
  aload_0
  new CoolString
  dup
  ldc "ERRO 3 = 3\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim26:
  pop
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  new CoolInt
  dup
  ldc 4
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao27
  aload_0
  new CoolString
  dup
  ldc "ERRO 3 = 4\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim28
Lsenao27:
  aload_0
  new CoolString
  dup
  ldc "ok 3 = 4 e falso\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim28:
  pop
  new CoolString
  dup
  ldc "abc"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  new CoolString
  dup
  ldc "abc"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao29
  aload_0
  new CoolString
  dup
  ldc "ok strings iguais\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim30
Lsenao29:
  aload_0
  new CoolString
  dup
  ldc "ERRO strings iguais\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim30:
  pop
  new CoolString
  dup
  ldc "abc"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  new CoolString
  dup
  ldc "abd"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao31
  aload_0
  new CoolString
  dup
  ldc "ERRO strings diferentes\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim32
Lsenao31:
  aload_0
  new CoolString
  dup
  ldc "ok strings diferentes\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim32:
  pop
  new CoolBool
  dup
  iconst_1
  invokespecial CoolBool/<init>(Z)V
  new CoolBool
  dup
  iconst_1
  invokespecial CoolBool/<init>(Z)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao33
  aload_0
  new CoolString
  dup
  ldc "ok true = true\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim34
Lsenao33:
  aload_0
  new CoolString
  dup
  ldc "ERRO true = true\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim34:
  pop
  new CoolBool
  dup
  iconst_0
  invokespecial CoolBool/<init>(Z)V
  checkcast CoolBool
  getfield CoolBool/value Z
  iconst_1
  ixor
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao35
  aload_0
  new CoolString
  dup
  ldc "ok not false\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim36
Lsenao35:
  aload_0
  new CoolString
  dup
  ldc "ERRO not false\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim36:
  pop
  new CoolBool
  dup
  iconst_1
  invokespecial CoolBool/<init>(Z)V
  checkcast CoolBool
  getfield CoolBool/value Z
  iconst_1
  ixor
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao37
  aload_0
  new CoolString
  dup
  ldc "ERRO not true\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim38
Lsenao37:
  aload_0
  new CoolString
  dup
  ldc "ok not true e falso\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim38:
  pop
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  iconst_1
  ixor
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao39
  aload_0
  new CoolString
  dup
  ldc "ok not (1 = 2)\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim40
Lsenao39:
  aload_0
  new CoolString
  dup
  ldc "ERRO not (1 = 2)\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim40:
  pop
  aload_0
  new CoolString
  dup
  ldc "fim\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  areturn
.end method

