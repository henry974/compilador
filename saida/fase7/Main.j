.class public Main
.super CoolIO

.field public o LCoolObject;
.field public i LCoolObject;

.method public <init>()V
  .limit stack 64
  .limit locals 1
  aload_0
  invokespecial CoolIO/<init>()V
  aload_0
  aconst_null
  putfield Main/o LCoolObject;
  aload_0
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  putfield Main/i LCoolObject;
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

.method public descreve(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Main/_s_descreve(LMain;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_descreve(LMain;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 3
  aload 1
  dup
  ifnonnull Lcaseok1
  invokestatic CoolRuntime/caseSobreVoid()LCoolRuntimeError;
  athrow
Lcaseok1:
  astore 2
  aload 2
  instanceof Cachorro
  ifeq Lproximo3
  new CoolString
  dup
  ldc "cachorro"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfimcase2
Lproximo3:
  aload 2
  instanceof Gato
  ifeq Lproximo4
  new CoolString
  dup
  ldc "gato"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfimcase2
Lproximo4:
  aload 2
  instanceof Animal
  ifeq Lproximo5
  new CoolString
  dup
  ldc "animal generico"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfimcase2
Lproximo5:
  aload 2
  invokestatic CoolRuntime/caseSemRamo(LCoolObject;)LCoolRuntimeError;
  athrow
Lfimcase2:
  areturn
.end method

.method public tipo(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Main/_s_tipo(LMain;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_tipo(LMain;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 3
  aload 1
  dup
  ifnonnull Lcaseok6
  invokestatic CoolRuntime/caseSobreVoid()LCoolRuntimeError;
  athrow
Lcaseok6:
  astore 2
  aload 2
  instanceof CoolInt
  ifeq Lproximo8
  new CoolString
  dup
  ldc "Int"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfimcase7
Lproximo8:
  aload 2
  instanceof CoolString
  ifeq Lproximo9
  new CoolString
  dup
  ldc "String"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfimcase7
Lproximo9:
  aload 2
  instanceof CoolBool
  ifeq Lproximo10
  new CoolString
  dup
  ldc "Bool"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfimcase7
Lproximo10:
  aload 2
  instanceof CoolObject
  ifeq Lproximo11
  new CoolString
  dup
  ldc "Object"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  goto Lfimcase7
Lproximo11:
  aload 2
  invokestatic CoolRuntime/caseSemRamo(LCoolObject;)LCoolRuntimeError;
  athrow
Lfimcase7:
  areturn
.end method

.method public tamanho(LCoolObject;)LCoolObject;
  .limit stack 2
  .limit locals 2
  aload 0
  aload 1
  invokestatic Main/_s_tamanho(LMain;LCoolObject;)LCoolObject;
  areturn
.end method

.method public static _s_tamanho(LMain;LCoolObject;)LCoolObject;
  .limit stack 64
  .limit locals 3
  aload 1
  dup
  ifnonnull Lcaseok12
  invokestatic CoolRuntime/caseSobreVoid()LCoolRuntimeError;
  athrow
Lcaseok12:
  astore 2
  aload 2
  instanceof CoolInt
  ifeq Lproximo14
  aload 2
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
  goto Lfimcase13
Lproximo14:
  aload 2
  instanceof CoolString
  ifeq Lproximo15
  aload 2
  dup
  ifnonnull Lnaovoid16
  ldc "length"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid16:
  checkcast CoolString
  invokevirtual CoolString/length()LCoolObject;
  goto Lfimcase13
Lproximo15:
  aload 2
  instanceof CoolObject
  ifeq Lproximo17
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  goto Lfimcase13
Lproximo17:
  aload 2
  invokestatic CoolRuntime/caseSemRamo(LCoolObject;)LCoolRuntimeError;
  athrow
Lfimcase13:
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
  .limit locals 5
  new Animal
  dup
  invokespecial Animal/<init>()V
  dup
  ifnonnull Lnaovoid18
  ldc "fala"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid18:
  checkcast Animal
  invokevirtual Animal/fala()LCoolObject;
  pop
  new CoolString
  dup
  ldc "rex"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  new Cachorro
  dup
  invokespecial Cachorro/<init>()V
  dup
  ifnonnull Lnaovoid19
  ldc "batiza"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid19:
  checkcast Cachorro
  aload 1
  invokevirtual Cachorro/batiza(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid20
  ldc "fala"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid20:
  checkcast Cachorro
  invokevirtual Cachorro/fala()LCoolObject;
  pop
  new Gato
  dup
  invokespecial Gato/<init>()V
  dup
  ifnonnull Lnaovoid21
  ldc "fala"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid21:
  checkcast Gato
  invokevirtual Gato/fala()LCoolObject;
  pop
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  aload_0
  new Cachorro
  dup
  invokespecial Cachorro/<init>()V
  invokevirtual Main/descreve(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid22
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid22:
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
  new Gato
  dup
  invokespecial Gato/<init>()V
  invokevirtual Main/descreve(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
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
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  aload_0
  new Animal
  dup
  invokespecial Animal/<init>()V
  invokevirtual Main/descreve(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid24
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid24:
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
  ldc 1
  invokespecial CoolInt/<init>(I)V
  invokevirtual Main/tipo(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid25
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid25:
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
  new CoolString
  dup
  ldc "s"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/tipo(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
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
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  aload_0
  aload_0
  new CoolBool
  dup
  iconst_1
  invokespecial CoolBool/<init>(Z)V
  invokevirtual Main/tipo(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid27
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid27:
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
  aload_0
  invokevirtual Main/tipo(LCoolObject;)LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid28
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid28:
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
  ldc 21
  invokespecial CoolInt/<init>(I)V
  invokevirtual Main/tamanho(LCoolObject;)LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid29
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid29:
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
  new CoolString
  dup
  ldc "abcde"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/tamanho(LCoolObject;)LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid30
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid30:
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
  aload_0
  invokevirtual Main/tamanho(LCoolObject;)LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid31
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid31:
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
  new Gato
  dup
  invokespecial Gato/<init>()V
  dup
  ifnonnull Lnaovoid32
  ldc "copia"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid32:
  checkcast Gato
  invokevirtual Gato/copia()LCoolObject;
  dup
  ifnonnull Lnaovoid33
  ldc "type_name"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid33:
  checkcast Gato
  invokevirtual Gato/type_name()LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid34
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid34:
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
  new Cachorro
  dup
  invokespecial Cachorro/<init>()V
  dup
  ifnonnull Lnaovoid35
  ldc "copia"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid35:
  checkcast Cachorro
  invokevirtual Cachorro/copia()LCoolObject;
  dup
  ifnonnull Lnaovoid36
  ldc "type_name"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid36:
  checkcast Cachorro
  invokevirtual Cachorro/type_name()LCoolObject;
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid37
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid37:
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
  invokespecial CoolInt/<init>()V
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid38
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid38:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolString
  dup
  ldc "]\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 1
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  astore 2
  aload_0
  new CoolString
  dup
  ldc "["
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid39
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid39:
  checkcast Main
  aload 2
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid40
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid40:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolBool
  dup
  invokespecial CoolBool/<init>()V
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao41
  aload_0
  new CoolString
  dup
  ldc "ERRO new Bool\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim42
Lsenao41:
  aload_0
  new CoolString
  dup
  ldc "ok new Bool\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim42:
  pop
  aload_0
  getfield Main/o LCoolObject;
  ifnull Lvoid45
  iconst_0
  goto Lfim46
Lvoid45:
  iconst_1
Lfim46:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao43
  aload_0
  new CoolString
  dup
  ldc "ok o void\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim44
Lsenao43:
  aload_0
  new CoolString
  dup
  ldc "ERRO o void\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim44:
  pop
  new Animal
  dup
  invokespecial Animal/<init>()V
  ifnull Lvoid49
  iconst_0
  goto Lfim50
Lvoid49:
  iconst_1
Lfim50:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao47
  aload_0
  new CoolString
  dup
  ldc "ERRO new Animal void\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim48
Lsenao47:
  aload_0
  new CoolString
  dup
  ldc "ok new Animal nao void\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim48:
  pop
Linicio55:
  new CoolBool
  dup
  iconst_0
  invokespecial CoolBool/<init>(Z)V
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lfimwhile56
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  pop
  goto Linicio55
Lfimwhile56:
  aconst_null
  ifnull Lvoid53
  iconst_0
  goto Lfim54
Lvoid53:
  iconst_1
Lfim54:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao51
  aload_0
  new CoolString
  dup
  ldc "ok while vale void\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim52
Lsenao51:
  aload_0
  new CoolString
  dup
  ldc "ERRO while void\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim52:
  pop
  aload_0
  new Animal
  dup
  invokespecial Animal/<init>()V
  dup_x1
  putfield Main/o LCoolObject;
  pop
  aload_0
  getfield Main/o LCoolObject;
  aload_0
  getfield Main/o LCoolObject;
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao57
  aload_0
  new CoolString
  dup
  ldc "ok o = o\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim58
Lsenao57:
  aload_0
  new CoolString
  dup
  ldc "ERRO o = o\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim58:
  pop
  aload_0
  getfield Main/o LCoolObject;
  new Animal
  dup
  invokespecial Animal/<init>()V
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao59
  aload_0
  new CoolString
  dup
  ldc "ERRO objetos distintos\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim60
Lsenao59:
  aload_0
  new CoolString
  dup
  ldc "ok objetos distintos\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim60:
  pop
  aload_0
  getfield Main/o LCoolObject;
  aload_0
  getfield Main/o LCoolObject;
  dup
  ifnonnull Lnaovoid63
  ldc "copy"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid63:
  checkcast CoolObject
  invokevirtual CoolObject/copy()LCoolObject;
  invokestatic CoolRuntime/eq(LCoolObject;LCoolObject;)Z
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao61
  aload_0
  new CoolString
  dup
  ldc "ERRO copia\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim62
Lsenao61:
  aload_0
  new CoolString
  dup
  ldc "ok copia e outro objeto\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim62:
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
  astore 2
  aload 2
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
  astore 3
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  astore 4
  aload 2
  checkcast CoolInt
  getfield CoolInt/value I
  aload 3
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  checkcast CoolInt
  getfield CoolInt/value I
  aload 4
  checkcast CoolInt
  getfield CoolInt/value I
  iadd
  invokestatic CoolInt/of(I)LCoolInt;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid64
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid64:
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
  astore 2
  aload 2
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
  astore 3
  aload 3
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid65
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid65:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  astore 1
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  astore 2
  aload_0
  aload 2
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  pop
  aload_0
  aload 1
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
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
  new CoolString
  dup
  invokespecial CoolString/<init>()V
  astore 2
  aload 2
  dup
  ifnonnull Lnaovoid66
  ldc "length"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid66:
  checkcast CoolString
  invokevirtual CoolString/length()LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid67
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid67:
  checkcast Main
  aload 1
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  aconst_null
  astore 1
  aload 1
  ifnull Lvoid70
  iconst_0
  goto Lfim71
Lvoid70:
  iconst_1
Lfim71:
  invokestatic CoolBool/of(Z)LCoolBool;
  checkcast CoolBool
  getfield CoolBool/value Z
  ifeq Lsenao68
  aload_0
  new CoolString
  dup
  ldc "ok let sem init e void\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  goto Lfim69
Lsenao68:
  aload_0
  new CoolString
  dup
  ldc "ERRO let void\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
Lfim69:
  pop
  aload_0
  new CoolInt
  dup
  ldc 0
  invokespecial CoolInt/<init>(I)V
  dup_x1
  putfield Main/i LCoolObject;
  pop
Linicio72:
  aload_0
  getfield Main/i LCoolObject;
  checkcast CoolInt
  getfield CoolInt/value I
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
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
  new CoolInt
  dup
  invokespecial CoolInt/<init>()V
  astore 1
  aload_0
  aload 1
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  pop
  aload 1
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
  dup
  astore 1
  pop
  aload_0
  aload 1
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  pop
  aload_0
  new CoolString
  dup
  ldc "|"
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
  goto Linicio72
Lfimwhile73:
  aconst_null
  pop
  aload_0
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  astore 1
  new CoolString
  dup
  ldc "\n"
  invokespecial CoolString/<init>(Ljava/lang/String;)V
  astore 2
  aload_0
  aload 1
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid76
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid76:
  checkcast Main
  aload 2
  invokevirtual Main/out_string(LCoolObject;)LCoolObject;
  pop
  new CoolInt
  dup
  ldc 1
  invokespecial CoolInt/<init>(I)V
  astore 1
  new CoolInt
  dup
  ldc 2
  invokespecial CoolInt/<init>(I)V
  astore 2
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  astore 3
  new List
  dup
  invokespecial List/<init>()V
  dup
  ifnonnull Lnaovoid77
  ldc "cons"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid77:
  checkcast List
  aload 3
  invokevirtual List/cons(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid78
  ldc "cons"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid78:
  checkcast List
  aload 2
  invokevirtual List/cons(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid79
  ldc "cons"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid79:
  checkcast List
  aload 1
  invokevirtual List/cons(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid80
  ldc "imprime"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid80:
  checkcast List
  invokevirtual List/imprime()LCoolObject;
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
  ldc 2
  invokespecial CoolInt/<init>(I)V
  astore 3
  new CoolInt
  dup
  ldc 3
  invokespecial CoolInt/<init>(I)V
  astore 4
  new List
  dup
  invokespecial List/<init>()V
  dup
  ifnonnull Lnaovoid81
  ldc "cons"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid81:
  checkcast List
  aload 4
  invokevirtual List/cons(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid82
  ldc "cons"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid82:
  checkcast List
  aload 3
  invokevirtual List/cons(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid83
  ldc "cons"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid83:
  checkcast List
  aload 2
  invokevirtual List/cons(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid84
  ldc "soma"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid84:
  checkcast List
  invokevirtual List/soma()LCoolObject;
  invokevirtual Main/out_int(LCoolObject;)LCoolObject;
  dup
  ifnonnull Lnaovoid85
  ldc "out_string"
  invokestatic CoolRuntime/despachoSobreVoid(Ljava/lang/String;)LCoolRuntimeError;
  athrow
Lnaovoid85:
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

