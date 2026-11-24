.class public Board
.super CoolIO

.field public rows LCoolObject;
.field public columns LCoolObject;
.field public board_size LCoolObject;

.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial CoolIO/<init>()V
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Board/rows LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Board/columns LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Board/board_size LCoolObject;
  return
.end method

.method public _novo()LCoolObject;
  .limit stack 4
  .limit locals 1
  new Board
  dup
  invokespecial Board/<init>()V
  areturn
.end method

.method public size_of_board(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Board/_s_size_of_board(LBoard;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_size_of_board(LBoard;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload 1
  dup
  ifnonnull Lnaovoid1
  ldc "length"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid1:
  checkcast CoolString
  invokevirtual CoolString/length()LCoolObject;
  areturn
.end method

.method public board_init(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Board/_s_board_init(LBoard;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_board_init(LBoard;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 3
  aload_0
  aload 1
  invokevirtual Board/size_of_board(LCoolObject;)LCoolObject;
  astore 2
  aload 2
  new CoolInt
  dup
  ldc 15
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao2
  aload_0
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/rows LCoolObject;
  pop
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/columns LCoolObject;
  pop
  aload_0
  aload 2
  dup_x1
  putfield Board/board_size LCoolObject;
  goto Lfim3
Lsenao2:
  aload 2
  new CoolInt
  dup
  ldc 16
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao4
  aload_0
  new CoolInt
  dup
  ldc 4
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/rows LCoolObject;
  pop
  aload_0
  new CoolInt
  dup
  ldc 4
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/columns LCoolObject;
  pop
  aload_0
  aload 2
  dup_x1
  putfield Board/board_size LCoolObject;
  goto Lfim5
Lsenao4:
  aload 2
  new CoolInt
  dup
  ldc 20
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao6
  aload_0
  new CoolInt
  dup
  ldc 4
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/rows LCoolObject;
  pop
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/columns LCoolObject;
  pop
  aload_0
  aload 2
  dup_x1
  putfield Board/board_size LCoolObject;
  goto Lfim7
Lsenao6:
  aload 2
  new CoolInt
  dup
  ldc 21
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao8
  aload_0
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/rows LCoolObject;
  pop
  aload_0
  new CoolInt
  dup
  ldc 7
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/columns LCoolObject;
  pop
  aload_0
  aload 2
  dup_x1
  putfield Board/board_size LCoolObject;
  goto Lfim9
Lsenao8:
  aload 2
  new CoolInt
  dup
  ldc 25
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao10
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/rows LCoolObject;
  pop
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/columns LCoolObject;
  pop
  aload_0
  aload 2
  dup_x1
  putfield Board/board_size LCoolObject;
  goto Lfim11
Lsenao10:
  aload 2
  new CoolInt
  dup
  ldc 28
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao12
  aload_0
  new CoolInt
  dup
  ldc 7
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/rows LCoolObject;
  pop
  aload_0
  new CoolInt
  dup
  ldc 4
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/columns LCoolObject;
  pop
  aload_0
  aload 2
  dup_x1
  putfield Board/board_size LCoolObject;
  goto Lfim13
Lsenao12:
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/rows LCoolObject;
  pop
  aload_0
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Board/columns LCoolObject;
  pop
  aload_0
  aload 2
  dup_x1
  putfield Board/board_size LCoolObject;
Lfim13:
Lfim11:
Lfim9:
Lfim7:
Lfim5:
Lfim3:
  pop
  aload_0
  areturn
.end method

