DEFINT A-Z

TYPE MemLoc
     segment AS INTEGER
     offset  AS INTEGER
END TYPE

SUB Font.System (Text$, X, Y, ForeColor)
    SHARED FontPointer AS MemLoc
    DEF SEG = FontPointer.segment
    XPlot = X
    FOR K = 1 TO LEN(RTRIM$(Text$))
        acode = ASC(MID$(Text$, K, 1))
        COFF = FontPointer.offset + 8 * acode
        FOR I = 0 TO 7
            TempDisp = CVI(CHR$(0) + CHR$(PEEK(COFF + I)))
            LINE (XPlot, I + Y)-(XPlot + 7, I + Y), ForeColor, , TempDisp
        NEXT I
        XPlot = XPlot + 8
    NEXT K
    DEF SEG

END SUB

SUB Font.System.Init
    DEF SEG = 0
    FontPointer.segment = CVI(CHR$(PEEK(&H7E)) + CHR$(PEEK(&H7F)))
    FontPointer.offset = CVI(CHR$(PEEK(&H7C)) + CHR$(PEEK(&H7D))) - 128 * 8
  
    DEF SEG
END SUB

