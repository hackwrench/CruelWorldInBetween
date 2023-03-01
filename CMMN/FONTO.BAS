'This File contains old routines from Font.BAS
'This File Requires Font.Bas and movement.BAS
'$DYNAMIC
DEFINT A-Z

TYPE MemLoc
     Segment AS INTEGER
     Offset  AS INTEGER
END TYPE

DECLARE SUB Font.System.Init ()
DECLARE FUNCTION ZBIT% (Byte AS INTEGER, Position AS INTEGER)

COMMON SHARED /Fonts/ Scale%, Font$(), FontPointer AS MemLoc

SUB Font.System.A (TEXT$, X, Y, Colour)
    DEF SEG = &HF000
    X1 = X
    Truth = LEN(TEXT$)
    FOR K = 1 TO Truth
        acode = ASC(MID$(TEXT$, K, 1))
        COFF = &HFA6E + 8 * acode
        FOR I = 0 TO 7
            A% = PEEK(COFF + I)
            FOR J = 0 TO 7
                IF ZBIT(A%, J) THEN
                   PSET (X1 + (7 - J), I + Y), Colour
                END IF
            NEXT J
        NEXT I
        X1 = X1 + 8
    NEXT K
    DEF SEG
END SUB

'Note: Font.System.Init should be run before calling this subroutine
'This routine can be used in all graphics modes
SUB Font.System.B (TEXT$, X, Y, Colour)
    SHARED FontPointer AS MemLoc
    DEF SEG = FontPointer.Segment
    X1 = X
    FOR K = 1 TO LEN(RTRIM$(TEXT$))
        acode = ASC(MID$(TEXT$, K, 1))
        COFF = FontPointer.Offset + 8 * acode
        FOR I = 0 TO 7
            FOR J = 0 TO 7
                IF ZBIT(PEEK(COFF + I), J) THEN
                   PSET (X1 + (7 - J), I + Y), Colour
                END IF
            NEXT J
        NEXT I
        X1 = X1 + 8
    NEXT K
    DEF SEG
END SUB

REM $STATIC
SUB Font.System.C (TEXT$, X, Y, Colour)
    SHARED FontPointer AS MemLoc
    DEF SEG = FontPointer.Segment
    XPlot = X
    FOR K = 1 TO LEN(RTRIM$(TEXT$))
        acode = ASC(MID$(TEXT$, K, 1))
        COFF = FontPointer.Offset + 8 * acode
        FOR I = 0 TO 7
            TempDisp = VAL("&H" + HEX$(PEEK(COFF + I)) + "00")
            LINE (XPlot, I + Y)-(XPlot + 7, I + Y), Colour, , TempDisp
        NEXT I
        XPlot = XPlot + 8
    NEXT K
    DEF SEG
END SUB

