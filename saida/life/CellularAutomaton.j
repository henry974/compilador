.class public CellularAutomaton
.super Board

.field public population_map LCoolObject;

.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial Board/<init>()V
  aload_0
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  putfield CellularAutomaton/population_map LCoolObject;
  return
.end method

.method public _novo()LCoolObject;
  .limit stack 4
  .limit locals 1
  new CellularAutomaton
  dup
  invokespecial CellularAutomaton/<init>()V
  areturn
.end method

.method public init(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_init(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_init(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  aload 1
  dup_x1
  putfield CellularAutomaton/population_map LCoolObject;
  pop
  aload_0
  aload 1
  invokevirtual CellularAutomaton/board_init(LCoolObject;)LCoolObject;
  pop
  aload_0
  areturn
.end method

.method public print()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic CellularAutomaton/_s_print(LCellularAutomaton;)LCoolObject;
  areturn
.end method

.method public static _s_print(LCellularAutomaton;)LCoolObject;
  .limit stack 64
  .limit locals 5
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  astore 1
  aload_0
  getfield Board/board_size LCoolObject;
  astore 2
  aload_0
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
Linicio1:
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload 2
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
  aload_0
  aload 1
  astore 3
  aload_0
  getfield Board/columns LCoolObject;
  astore 4
  aload_0
  getfield CellularAutomaton/population_map LCoolObject;
  dup
  ifnonnull Lnaovoid5
  ldc "substr"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid5:
  checkcast CoolString
  aload 3
  aload 4
  invokevirtual CoolString/substr(LCoolObject;LCoolObject;)LCoolObject;
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  dup
  astore 1
  pop
  goto Linicio1
Lfimwhile2:
  aconst_null
  pop
  aload_0
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  areturn
.end method

.method public num_cells()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic CellularAutomaton/_s_num_cells(LCellularAutomaton;)LCoolObject;
  areturn
.end method

.method public static _s_num_cells(LCellularAutomaton;)LCoolObject;
  .limit stack 64
  .limit locals 1
  aload_0
  getfield CellularAutomaton/population_map LCoolObject;
  dup
  ifnonnull Lnaovoid6
  ldc "length"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid6:
  checkcast CoolString
  invokevirtual CoolString/length()LCoolObject;
  areturn
.end method

.method public cell(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_cell(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_cell(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 4
  aload_0
  getfield Board/board_size LCoolObject;
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
  checkcast CoolInt
  getfield CoolInt/value I
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade9
  iconst_0
  goto Lfim10
Lverdade9:
  iconst_1
Lfim10:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao7
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim8
Lsenao7:
  aload 1
  astore 2
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  astore 3
  aload_0
  getfield CellularAutomaton/population_map LCoolObject;
  dup
  ifnonnull Lnaovoid11
  ldc "substr"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid11:
  checkcast CoolString
  aload 2
  aload 3
  invokevirtual CoolString/substr(LCoolObject;LCoolObject;)LCoolObject;
Lfim8:
  areturn
.end method

.method public north(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_north(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_north(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  isub
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade14
  iconst_0
  goto Lfim15
Lverdade14:
  iconst_1
Lfim15:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao12
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim13
Lsenao12:
  aload_0
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  isub
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual CellularAutomaton/cell(LCoolObject;)LCoolObject;
Lfim13:
  areturn
.end method

.method public south(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_south(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_south(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  getfield Board/board_size LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade18
  iconst_0
  goto Lfim19
Lverdade18:
  iconst_1
Lfim19:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao16
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim17
Lsenao16:
  aload_0
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual CellularAutomaton/cell(LCoolObject;)LCoolObject;
Lfim17:
  areturn
.end method

.method public east(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_east(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_east(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
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
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  idiv
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
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
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao20
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim21
Lsenao20:
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
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual CellularAutomaton/cell(LCoolObject;)LCoolObject;
Lfim21:
  areturn
.end method

.method public west(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_west(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_west(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload 1
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao22
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim23
Lsenao22:
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  idiv
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
  aload 1
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao24
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim25
Lsenao24:
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
  invokevirtual CellularAutomaton/cell(LCoolObject;)LCoolObject;
Lfim25:
Lfim23:
  areturn
.end method

.method public northwest(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_northwest(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_northwest(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  isub
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade28
  iconst_0
  goto Lfim29
Lverdade28:
  iconst_1
Lfim29:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao26
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim27
Lsenao26:
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  idiv
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
  aload 1
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao30
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim31
Lsenao30:
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
  invokevirtual CellularAutomaton/north(LCoolObject;)LCoolObject;
Lfim31:
Lfim27:
  areturn
.end method

.method public northeast(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_northeast(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_northeast(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  isub
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade34
  iconst_0
  goto Lfim35
Lverdade34:
  iconst_1
Lfim35:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao32
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim33
Lsenao32:
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
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  idiv
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
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
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao36
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim37
Lsenao36:
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
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual CellularAutomaton/north(LCoolObject;)LCoolObject;
Lfim37:
Lfim33:
  areturn
.end method

.method public southeast(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_southeast(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_southeast(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  getfield Board/board_size LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade40
  iconst_0
  goto Lfim41
Lverdade40:
  iconst_1
Lfim41:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao38
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim39
Lsenao38:
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
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  idiv
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
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
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao42
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim43
Lsenao42:
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
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual CellularAutomaton/south(LCoolObject;)LCoolObject;
Lfim43:
Lfim39:
  areturn
.end method

.method public southwest(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_southwest(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_southwest(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  getfield Board/board_size LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade46
  iconst_0
  goto Lfim47
Lverdade46:
  iconst_1
Lfim47:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao44
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim45
Lsenao44:
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  idiv
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  getfield Board/columns LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  imul
  invokestatic CoolInt/of(I)LCoolInt;
  aload 1
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao48
  new CoolString
  dup
  ldc " "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim49
Lsenao48:
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
  invokevirtual CellularAutomaton/south(LCoolObject;)LCoolObject;
Lfim49:
Lfim45:
  areturn
.end method

.method public neighbors(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_neighbors(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_neighbors(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  aload 1
  invokevirtual CellularAutomaton/north(LCoolObject;)LCoolObject;
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao50
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfim51
Lsenao50:
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
Lfim51:
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  aload 1
  invokevirtual CellularAutomaton/south(LCoolObject;)LCoolObject;
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao52
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfim53
Lsenao52:
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
Lfim53:
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  aload 1
  invokevirtual CellularAutomaton/east(LCoolObject;)LCoolObject;
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao54
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfim55
Lsenao54:
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
Lfim55:
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  aload 1
  invokevirtual CellularAutomaton/west(LCoolObject;)LCoolObject;
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao56
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfim57
Lsenao56:
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
Lfim57:
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  aload 1
  invokevirtual CellularAutomaton/northeast(LCoolObject;)LCoolObject;
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao58
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfim59
Lsenao58:
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
Lfim59:
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  aload 1
  invokevirtual CellularAutomaton/northwest(LCoolObject;)LCoolObject;
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao60
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfim61
Lsenao60:
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
Lfim61:
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  aload 1
  invokevirtual CellularAutomaton/southeast(LCoolObject;)LCoolObject;
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao62
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfim63
Lsenao62:
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
Lfim63:
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload_0
  aload 1
  invokevirtual CellularAutomaton/southwest(LCoolObject;)LCoolObject;
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao64
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  goto Lfim65
Lsenao64:
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
Lfim65:
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  areturn
.end method

.method public cell_at_next_evolution(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic CellularAutomaton/_s_cell_at_next_evolution(LCellularAutomaton;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_cell_at_next_evolution(LCellularAutomaton;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 2
  aload_0
  aload 1
  invokevirtual CellularAutomaton/neighbors(LCoolObject;)LCoolObject;
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao66
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim67
Lsenao66:
  aload_0
  aload 1
  invokevirtual CellularAutomaton/neighbors(LCoolObject;)LCoolObject;
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao68
  aload_0
  aload 1
  invokevirtual CellularAutomaton/cell(LCoolObject;)LCoolObject;
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao70
  new CoolString
  dup
  ldc "X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim71
Lsenao70:
  new CoolString
  dup
  ldc "-"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
Lfim71:
  goto Lfim69
Lsenao68:
  new CoolString
  dup
  ldc "-"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
Lfim69:
Lfim67:
  areturn
.end method

.method public evolve()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic CellularAutomaton/_s_evolve(LCellularAutomaton;)LCoolObject;
  areturn
.end method

.method public static _s_evolve(LCellularAutomaton;)LCoolObject;
  .limit stack 64
  .limit locals 5
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  astore 1
  aload_0
  invokevirtual CellularAutomaton/num_cells()LCoolObject;
  astore 2
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  astore 3
Linicio72:
  aload 1
  checkcast CoolInt
  getfield CoolInt/value I
  aload 2
  checkcast CoolInt
  getfield CoolInt/value I
  if_icmplt Lverdade74
  iconst_0
  goto Lfim75
Lverdade74:
  iconst_1
Lfim75:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lfimwhile73
  aload_0
  aload 1
  invokevirtual CellularAutomaton/cell_at_next_evolution(LCoolObject;)LCoolObject;
  astore 4
  aload 3
  dup
  ifnonnull Lnaovoid76
  ldc "concat"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid76:
  checkcast CoolString
  aload 4
  invokevirtual CoolString/concat(LCoolObject;)LCoolObject;
  dup
  astore 3
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
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  dup
  astore 1
  pop
  goto Linicio72
Lfimwhile73:
  aconst_null
  pop
  aload_0
  aload 3
  dup_x1
  putfield CellularAutomaton/population_map LCoolObject;
  pop
  aload_0
  areturn
.end method

.method public option()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic CellularAutomaton/_s_option(LCellularAutomaton;)LCoolObject;
  areturn
.end method

.method public static _s_option(LCellularAutomaton;)LCoolObject;
  .limit stack 64
  .limit locals 2
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  astore 1
  aload_0
  new CoolString
  dup
  ldc "\nPlease chose a number:\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t1: A cross\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t2: A slash from the upper left to lower right\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t3: A slash from the upper right to lower left\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t4: An X\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t5: A greater than sign \n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t6: A less than sign\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t7: Two greater than signs\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t8: Two less than signs\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t9: A 'V'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t10: An inverse 'V'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t11: Numbers 9 and 10 combined\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t12: A full grid\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t13: A 'T'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t14: A plus '+'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t15: A 'W'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t16: An 'M'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t17: An 'E'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t18: A '3'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t19: An 'O'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t20: An '8'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "\t21: An 'S'\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "Your choice => "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  invokevirtual CellularAutomaton/in_int()LCoolObject;
  dup
  astore 1
  pop
  aload_0
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload 1
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao77
  new CoolString
  dup
  ldc " XX  XXXX XXXX  XX  "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim78
Lsenao77:
  aload 1
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao79
  new CoolString
  dup
  ldc "    X   X   X   X   X    "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim80
Lsenao79:
  aload 1
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao81
  new CoolString
  dup
  ldc "X     X     X     X     X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim82
Lsenao81:
  aload 1
  new CoolInt
  dup
  ldc 4
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao83
  new CoolString
  dup
  ldc "X   X X X   X   X X X   X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim84
Lsenao83:
  aload 1
  new CoolInt
  dup
  ldc 5
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao85
  new CoolString
  dup
  ldc "X     X     X   X   X    "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim86
Lsenao85:
  aload 1
  new CoolInt
  dup
  ldc 6
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao87
  new CoolString
  dup
  ldc "    X   X   X     X     X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim88
Lsenao87:
  aload 1
  new CoolInt
  dup
  ldc 7
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao89
  new CoolString
  dup
  ldc "X  X  X  XX  X      "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim90
Lsenao89:
  aload 1
  new CoolInt
  dup
  ldc 8
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao91
  new CoolString
  dup
  ldc " X  XX  X  X  X     "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim92
Lsenao91:
  aload 1
  new CoolInt
  dup
  ldc 9
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao93
  new CoolString
  dup
  ldc "X   X X X   X  "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim94
Lsenao93:
  aload 1
  new CoolInt
  dup
  ldc 10
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao95
  new CoolString
  dup
  ldc "  X   X X X   X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim96
Lsenao95:
  aload 1
  new CoolInt
  dup
  ldc 11
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao97
  new CoolString
  dup
  ldc "X X X X X X X X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim98
Lsenao97:
  aload 1
  new CoolInt
  dup
  ldc 12
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao99
  new CoolString
  dup
  ldc "XXXXXXXXXXXXXXXXXXXXXXXXX"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim100
Lsenao99:
  aload 1
  new CoolInt
  dup
  ldc 13
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao101
  new CoolString
  dup
  ldc "XXXXX  X    X    X    X  "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim102
Lsenao101:
  aload 1
  new CoolInt
  dup
  ldc 14
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao103
  new CoolString
  dup
  ldc "  X    X  XXXXX  X    X  "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim104
Lsenao103:
  aload 1
  new CoolInt
  dup
  ldc 15
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao105
  new CoolString
  dup
  ldc "X     X X X X   X X  "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim106
Lsenao105:
  aload 1
  new CoolInt
  dup
  ldc 16
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao107
  new CoolString
  dup
  ldc "  X X   X X X X     X"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim108
Lsenao107:
  aload 1
  new CoolInt
  dup
  ldc 17
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao109
  new CoolString
  dup
  ldc "XXXXX   X   XXXXX   X   XXXX"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim110
Lsenao109:
  aload 1
  new CoolInt
  dup
  ldc 18
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao111
  new CoolString
  dup
  ldc "XXX    X   X  X    X   XXXX "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim112
Lsenao111:
  aload 1
  new CoolInt
  dup
  ldc 19
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao113
  new CoolString
  dup
  ldc " XX X  XX  X XX "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim114
Lsenao113:
  aload 1
  new CoolInt
  dup
  ldc 20
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao115
  new CoolString
  dup
  ldc " XX X  XX  X XX X  XX  X XX "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim116
Lsenao115:
  aload 1
  new CoolInt
  dup
  ldc 21
  invokespecial CoolInt/<init>(I)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao117
  new CoolString
  dup
  ldc " XXXX   X    XX    X   XXXX "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfim118
Lsenao117:
  new CoolString
  dup
  ldc "                         "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
Lfim118:
Lfim116:
Lfim114:
Lfim112:
Lfim110:
Lfim108:
Lfim106:
Lfim104:
Lfim102:
Lfim100:
Lfim98:
Lfim96:
Lfim94:
Lfim92:
Lfim90:
Lfim88:
Lfim86:
Lfim84:
Lfim82:
Lfim80:
Lfim78:
  areturn
.end method

.method public prompt()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic CellularAutomaton/_s_prompt(LCellularAutomaton;)LCoolObject;
  areturn
.end method

.method public static _s_prompt(LCellularAutomaton;)LCoolObject;
  .limit stack 64
  .limit locals 2
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  astore 1
  aload_0
  new CoolString
  dup
  ldc "Would you like to continue with the next generation? \n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "Please use lowercase y or n for your answer [y]: "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  invokevirtual CellularAutomaton/in_string()LCoolObject;
  dup
  astore 1
  pop
  aload_0
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload 1
  new CoolString
  dup
  ldc "n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao119
  new CoolBool
  dup
  iconst_0
  invokespecial CoolBool/<init>(Z)V
  goto Lfim120
Lsenao119:
  new CoolBool
  dup
  iconst_1
  invokespecial CoolBool/<init>(Z)V
Lfim120:
  areturn
.end method

.method public prompt2()LCoolObject;
  .limit stack 1
  .limit locals 1
  aload 0
  invokestatic CellularAutomaton/_s_prompt2(LCellularAutomaton;)LCoolObject;
  areturn
.end method

.method public static _s_prompt2(LCellularAutomaton;)LCoolObject;
  .limit stack 64
  .limit locals 2
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  astore 1
  aload_0
  new CoolString
  dup
  ldc "\n\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "Would you like to choose a background pattern? \n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "Please use lowercase y or n for your answer [n]: "
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual CellularAutomaton/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  invokevirtual CellularAutomaton/in_string()LCoolObject;
  dup
  astore 1
  pop
  aload 1
  new CoolString
  dup
  ldc "y"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao121
  new CoolBool
  dup
  iconst_1
  invokespecial CoolBool/<init>(Z)V
  goto Lfim122
Lsenao121:
  new CoolBool
  dup
  iconst_0
  invokespecial CoolBool/<init>(Z)V
Lfim122:
  areturn
.end method

