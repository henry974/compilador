.class public Main
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
  new Main
  dup
  invokespecial Main/<init>()V
  areturn
.end method

.method public nome()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Main/_s_nome(LMain;)LCoolObject;
  areturn
.end method

.method public static _s_nome(LMain;)LCoolObject;
  .limit stack 64
  .limit locals 1
  new CoolString
  dup
  ldc "Main"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  areturn
.end method

.method public dobro(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Main/_s_dobro(LMain;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_dobro(LMain;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload 1
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
  areturn
.end method

.method public fat(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Main/_s_fat(LMain;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_fat(LMain;LCoolObject;)LCoolObject;
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
  if_icmplt Lverdade3
  iconst_0
  goto Lfim4
Lverdade3:
  iconst_1
Lfim4:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao1
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfim2
Lsenao1:
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  isub
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/fat(LCoolObject;)LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
Lfim2:
  areturn
.end method

.method public trace(LCoolObject;LCoolObject;)LCoolObject;
  .limit stack 3
  .limit locals 3
  aload 0
  aload 1
  aload 2
  invokestatic Main/_s_trace(LMain;LCoolObject;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_trace(LMain;LCoolObject;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 3
  aload_0
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload 2
  areturn
.end method

.method public eu_trace()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Main/_s_eu_trace(LMain;)LCoolObject;
  areturn
.end method

.method public static _s_eu_trace(LMain;)LCoolObject;
  .limit stack 64
  .limit locals 1
  aload_0
  new CoolString
  dup
  ldc "receptor "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
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
  .limit locals 4
  aload_0
  invokevirtual Main/quem()LCoolObject;
  pop
  aload_0
  invokestatic A/_s_quem(LA;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  aload_0
  invokestatic A/_s_nome(LA;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
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
  aload_0
  invokevirtual Main/nome()LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
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
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  invokevirtual Main/dobro(LCoolObject;)LCoolObject;
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
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  invokestatic A/_s_dobro(LA;LCoolObject;)LCoolObject;
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
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  invokevirtual Main/fat(LCoolObject;)LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid9
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid9:
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
  aload_0
  invokevirtual Main/type_name()LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid10
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid10:
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
  aload_0
  invokestatic CoolObject/_s_type_name(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid11
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid11:
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
  new CoolString
  dup
  ldc "hello"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  dup
  ifnonnull Lnaovoid12
  ldc "length"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid12:
  checkcast CoolString
  invokevirtual CoolString/length()LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid13
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid13:
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
  new CoolString
  dup
  ldc "cd"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 2
  new CoolString
  dup
  ldc "ab"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  dup
  ifnonnull Lnaovoid14
  ldc "concat"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid14:
  checkcast CoolString
  aload 2
  invokevirtual CoolString/concat(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid15
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid15:
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
  astore 2
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  astore 3
  new CoolString
  dup
  ldc "abcdef"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  dup
  ifnonnull Lnaovoid16
  ldc "substr"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid16:
  checkcast CoolString
  aload 2
  aload 3
  invokevirtual CoolString/substr(LCoolObject;LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid17
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid17:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  invokevirtual Main/eu()LCoolObject;
  dup
  ifnonnull Lnaovoid18
  ldc "eu"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid18:
  checkcast Main
  invokevirtual Main/eu()LCoolObject;
  dup
  ifnonnull Lnaovoid19
  ldc "quem"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid19:
  checkcast Main
  invokevirtual Main/quem()LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "via IO\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolIO/_s_out_string(LCoolIO;LCoolObject;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  aload_0
  new CoolString
  dup
  ldc "arg "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  invokevirtual Main/trace(LCoolObject;LCoolObject;)LCoolObject;
  astore 2
  aload_0
  invokevirtual Main/eu_trace()LCoolObject;
  dup
  ifnonnull Lnaovoid20
  ldc "dobro"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid20:
  checkcast Main
  aload 2
  invokevirtual Main/dobro(LCoolObject;)LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid21
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid21:
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
  astore 2
  aload_0
  invokevirtual Main/copy()LCoolObject;
  dup
  ifnonnull Lnaovoid22
  ldc "dobro"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid22:
  checkcast Main
  aload 2
  invokevirtual Main/dobro(LCoolObject;)LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid23
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid23:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "fim\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  areturn
.end method

