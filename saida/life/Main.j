.class public Main
.super CellularAutomaton

.field public cells LCoolObject;

.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial CellularAutomaton/<init>()V
  aload_0
  aconst_null
  putfield Main/cells LCoolObject;
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
  .limit locals 4
  new CoolBool
  dup
  invokespecial CoolBool/<init>()V
  astore 1
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  astore 2
  aload_0
  new CoolString
  dup
  ldc "Welcome to the Game of Life.\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "There are many initial states to choose from. \n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
Linicio1:
  aload_0
  invokevirtual Main/prompt2()LCoolObject;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lfimwhile2
  new CoolBool
  dup
  iconst_1
  invokespecial CoolBool/<init>(Z)V
  dup
  astore 1
  pop
  aload_0
  invokevirtual Main/option()LCoolObject;
  dup
  astore 2
  pop
  aload_0
  aload 2
  astore 3
  new CellularAutomaton
  dup
  invokespecial CellularAutomaton/<init>()V
  dup
  ifnonnull Lnaovoid3
  ldc "init"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid3:
  checkcast CellularAutomaton
  aload 3
  invokevirtual CellularAutomaton/init(LCoolObject;)LCoolObject;
  dup_x1
  putfield Main/cells LCoolObject;
  pop
  aload_0
  getfield Main/cells LCoolObject;
  dup
  ifnonnull Lnaovoid4
  ldc "print"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid4:
  checkcast CellularAutomaton
  invokevirtual CellularAutomaton/print()LCoolObject;
  pop
Linicio5:
  aload 1
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lfimwhile6
  aload_0
  invokevirtual Main/prompt()LCoolObject;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao7
  aload_0
  getfield Main/cells LCoolObject;
  dup
  ifnonnull Lnaovoid9
  ldc "evolve"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid9:
  checkcast CellularAutomaton
  invokevirtual CellularAutomaton/evolve()LCoolObject;
  pop
  aload_0
  getfield Main/cells LCoolObject;
  dup
  ifnonnull Lnaovoid10
  ldc "print"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid10:
  checkcast CellularAutomaton
  invokevirtual CellularAutomaton/print()LCoolObject;
  goto Lfim8
Lsenao7:
  new CoolBool
  dup
  iconst_0
  invokespecial CoolBool/<init>(Z)V
  dup
  astore 1
Lfim8:
  pop
  goto Linicio5
Lfimwhile6:
  aconst_null
  pop
  goto Linicio1
Lfimwhile2:
  aconst_null
  pop
  aload_0
  areturn
.end method

