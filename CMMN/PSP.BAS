DEFINT A-Z

TYPE MemLoc
     Segment AS INTEGER
     Offset  AS INTEGER
END TYPE

TYPE RegTypeX
     AX    AS INTEGER
     BX    AS INTEGER
     cx    AS INTEGER
     dx    AS INTEGER
     BP    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     flags AS INTEGER
     ds    AS INTEGER
     ES    AS INTEGER
END TYPE

DECLARE SUB INTERRUPTX (intnum AS INTEGER, inreg AS RegTypeX, outreg AS RegTypeX)

DECLARE SUB PSP.Current.Get (PSPHandle AS ANY)
DECLARE FUNCTION Directory.Program.Get$ ()

FUNCTION Directory.Program.Get$
    DIM PSPMem AS MemLoc, EnvMem AS MemLoc
    CALL PSP.Current.Get(PSPMem)
    DEF SEG = PSPMem.Segment
    Temp$ = CHR$(PEEK(&H2C)) + CHR$(PEEK(&H2D))
    EnvMem.Segment = CVI(Temp$)
    DEF SEG = EnvMem.Segment
    I = 0
    DO
      LastChar$ = CurrChar$
      CurrChar$ = CHR$(PEEK(I))
      I = I + 1
    LOOP UNTIL LastChar$ = CurrChar$ AND CurrChar$ = CHR$(0)
    I = I + 2
    
    DO
    CurrChar$ = CHR$(PEEK(I))
    Test$ = Test$ + CurrChar$
    I = I + 1
    LOOP UNTIL CurrChar$ = CHR$(0)
    Directory.Program.Get = Test$ 'Make sure we return something
    FOR I = LEN(Test$) TO 1 STEP -1
        IF MID$(Test$, I, 1) = "\" THEN
           Directory.Program.Get = LEFT$(Test$, I)
           EXIT FUNCTION
        END IF
    NEXT I
END FUNCTION' Directory.Program.Get

SUB PSP.Current.Get (PSPHandle AS MemLoc)
    DIM Regs AS RegTypeX
    Regs.AX = &H5100
    CALL INTERRUPTX(&H21, Regs, Regs)
    PSPHandle.Segment = Regs.BX
END SUB

