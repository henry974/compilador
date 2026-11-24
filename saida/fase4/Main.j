.class public Main
.super Base

.field public x LCoolObject;
.field public y LCoolObject;
.field public z LCoolObject;
.field public s LCoolObject;
.field public b LCoolObject;
.field public o LCoolObject;
.field public tmp LCoolObject;

.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial Base/<init>()V
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Main/x LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Main/y LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Main/z LCoolObject;
  aload_0
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  putfield Main/s LCoolObject;
  aload_0
  new CoolBool
  dup
  invokespecial CoolBool/<init>()V
  putfield Main/b LCoolObject;
  aload_0
  aconst_null
  putfield Main/o LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Main/tmp LCoolObject;
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  putfield Main/x LCoolObject;
  aload_0
  aload_0
  getfield Main/x LCoolObject;
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
  putfield Main/y LCoolObject;
  aload_0
  aload_0
  getfield Main/z LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 10
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  putfield Main/tmp LCoolObject;
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

.method public soma(LCoolObject;LCoolObject;)LCoolObject;
  .limit stack 3
  .limit locals 3
  aload 0
  aload 1
  aload 2
  invokestatic Main/_s_soma(LMain;LCoolObject;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_soma(LMain;LCoolObject;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 3
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload 2
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  areturn
.end method

.method public incrementa()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic Main/_s_incrementa(LMain;)LCoolObject;
  areturn
.end method

.method public static _s_incrementa(LMain;)LCoolObject;
  .limit stack 64
  .limit locals 1
  aload_0
  aload_0
  getfield Main/x LCoolObject;
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
  putfield Main/x LCoolObject;
  pop
  aload_0
  getfield Main/x LCoolObject;
  areturn
.end method

.method public sombra(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Main/_s_sombra(LMain;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_sombra(LMain;LCoolObject;)LCoolObject;
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
  imul
  invokestatic CoolInt/of(I)LCoolInt;
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
  .limit locals 1
  aload_0
  invokevirtual Main/mostra()LCoolObject;
  pop
  aload_0
  aload_0
  getfield Main/x LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  getfield Main/y LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  getfield Main/z LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "["
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  checkcast Main
  aload_0
  getfield Main/s LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "]\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  getfield Main/b LCoolObject;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao1
  aload_0
  new CoolString
  dup
  ldc "ERRO b\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim2
Lsenao1:
  aload_0
  new CoolString
  dup
  ldc "ok b falso\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim2:
  pop
  aload_0
  aload_0
  getfield Main/tmp LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  new CoolInt
  dup
  ldc 4
  invokespecial CoolInt/<init>(I)V
  invokevirtual Main/soma(LCoolObject;LCoolObject;)LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  invokevirtual Main/incrementa()LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  getfield Main/x LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  new CoolInt
  dup
  ldc 21
  invokespecial CoolInt/<init>(I)V
  invokevirtual Main/sombra(LCoolObject;)LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  getfield Main/x LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "alterado"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  dup_x1
  putfield Base/nome LCoolObject;
  pop
  aload_0
  aload_0
  getfield Base/total LCoolObject;
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
  putfield Base/total LCoolObject;
  pop
  aload_0
  invokevirtual Main/mostra()LCoolObject;
  pop
  aload_0
  aload_0
  new CoolInt
  dup
  ldc 99
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Main/x LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload_0
  getfield Main/x LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  checkcast Main
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
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

