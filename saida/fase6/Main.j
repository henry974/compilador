.class public Main
.super CoolIO

.field public i LCoolObject;
.field public j LCoolObject;
.field public acc LCoolObject;
.field public soma LCoolObject;

.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial CoolIO/<init>()V
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Main/i LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Main/j LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Main/acc LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Main/soma LCoolObject;
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

.method public contagem_regressiva(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Main/_s_contagem_regressiva(LMain;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_contagem_regressiva(LMain;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 3
Linicio1:
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  aload 1
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
  ifeq Lfimwhile2
  new CoolString
  dup
  ldc "|"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 2
  aload_0
  aload 1
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid5
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid5:
  checkcast Main
  aload 2
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
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
  dup
  astore 1
  pop
  goto Linicio1
Lfimwhile2:
  aconst_null
  areturn
.end method

.method public fat_iter(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Main/_s_fat_iter(LMain;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_fat_iter(LMain;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Main/acc LCoolObject;
  pop
Linicio6:
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade8
  iconst_0
  goto Lfim9
Lverdade8:
  iconst_1
Lfim9:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lfimwhile7
  aload_0
  aload_0
  getfield Main/acc LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
  dup_x1
  putfield Main/acc LCoolObject;
  pop
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
  dup
  astore 1
  pop
  goto Linicio6
Lfimwhile7:
  aconst_null
  pop
  aload_0
  getfield Main/acc LCoolObject;
  areturn
.end method

.method public tabuada()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Main/_s_tabuada(LMain;)LCoolObject;
  areturn
.end method

.method public static _s_tabuada(LMain;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Main/i LCoolObject;
  pop
Linicio10:
  aload_0
  getfield Main/i LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 4
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade12
  iconst_0
  goto Lfim13
Lverdade12:
  iconst_1
Lfim13:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lfimwhile11
  aload_0
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Main/j LCoolObject;
  pop
Linicio14:
  aload_0
  getfield Main/j LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 4
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade16
  iconst_0
  goto Lfim17
Lverdade16:
  iconst_1
Lfim17:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lfimwhile15
  new CoolString
  dup
  ldc "|"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  aload_0
  getfield Main/i LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Main/j LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid18
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid18:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  getfield Main/j LCoolObject;
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
  dup_x1
  putfield Main/j LCoolObject;
  pop
  goto Linicio14
Lfimwhile15:
  aconst_null
  pop
  aload_0
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  getfield Main/i LCoolObject;
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
  dup_x1
  putfield Main/i LCoolObject;
  pop
  goto Linicio10
Lfimwhile11:
  aconst_null
  areturn
.end method

.method public soma_ate(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Main/_s_soma_ate(LMain;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_soma_ate(LMain;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Main/soma LCoolObject;
  pop
  aload_0
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Main/i LCoolObject;
  pop
Linicio19:
  aload_0
  getfield Main/i LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  aload 1
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
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade21
  iconst_0
  goto Lfim22
Lverdade21:
  iconst_1
Lfim22:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lfimwhile20
  aload_0
  aload_0
  getfield Main/soma LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Main/i LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  dup_x1
  putfield Main/soma LCoolObject;
  pop
  aload_0
  aload_0
  getfield Main/i LCoolObject;
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
  dup_x1
  putfield Main/i LCoolObject;
  pop
  goto Linicio19
Lfimwhile20:
  aconst_null
  pop
  aload_0
  getfield Main/soma LCoolObject;
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
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  invokevirtual Main/contagem_regressiva(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
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
  invokevirtual Main/fat_iter(LCoolObject;)LCoolObject;
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
  invokevirtual Main/tabuada()LCoolObject;
  pop
Linicio24:
  new CoolBool
  dup
  iconst_0
  invokespecial CoolBool/<init>(Z)V
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lfimwhile25
  aload_0
  new CoolString
  dup
  ldc "ERRO while false\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  goto Linicio24
Lfimwhile25:
  aconst_null
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
  ldc 60000
  invokespecial CoolInt/<init>(I)V
  invokevirtual Main/soma_ate(LCoolObject;)LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid26
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid26:
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

