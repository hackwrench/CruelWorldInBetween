DEFINT A-Z

'$INCLUDE: 'W:\COMMON\LOCATE.INC'

TYPE RegTypeX
     AX    AS INTEGER
     BX    AS INTEGER
     CX    AS INTEGER
     DX    AS INTEGER
     BP    AS INTEGER
     SI    AS INTEGER
     DI    AS INTEGER
     Flags AS INTEGER
     DS    AS INTEGER
     ES    AS INTEGER
END TYPE

DECLARE SUB InterruptX (intnum AS INTEGER, inreg AS RegTypeX, outreg AS RegTypeX)

DECLARE FUNCTION HexVal$ (Value AS INTEGER, Length AS INTEGER)
DECLARE FUNCTION Mouse.Driver.Version$ ()
DECLARE FUNCTION Mouse.Detect% ()

COMMON SHARED /Mouse/ Mouse.Click.Left%, Mouse.Click.Right
COMMON SHARED /Mouse/ Mouse.Click.Left.X, Mouse.Click.Left.Y
COMMON SHARED /Mouse/ Mouse.Click.Right.X, Mouse.Click.Right.Y
COMMON SHARED /Mouse/ Mouse.X, Mouse.Y

FUNCTION HexVal$ (Value AS INTEGER, Length AS INTEGER)
    HexVal = STRING$(Length - LEN(HEX$(Value)), "0") + HEX$(Value)
END FUNCTION

SUB Mouse.Clicks (Left%, Right%)
    DIM Regs AS RegTypeX
    Regs.AX = 5
    Regs.BX = 1
    CALL InterruptX(&H33, Regs, Regs)
    Left% = Left% + Regs.BX
    Regs.AX = 5
    Regs.BX = 2
    CALL InterruptX(&H33, Regs, Regs)
    Right% = Right% + Regs.BX
END SUB

SUB Mouse.Cursor.Set (mask() AS INTEGER, XHot, YHot)
    DIM Regs AS RegTypeX
    Regs.AX = &H9
    Regs.BX = XHot
    Regs.CX = YHot
    Regs.DX = VARPTR(mask(LBOUND(mask)))
    Regs.ES = VARSEG(mask(LBOUND(mask)))
    CALL InterruptX(&H33, Regs, Regs)
END SUB

SUB Mouse.Cursor.Set0 (Text AS STRING, Fore, Back)
    DIM Regs AS RegTypeX
    Regs.AX = &HA
    Regs.BX = 0
    Regs.DX = VAL("&H" + HEX$(Back) + HEX$(Fore) + HexVal(ASC(Text), 2))
    CALL InterruptX(&H33, Regs, Regs)
END SUB

FUNCTION Mouse.Detect
    DIM Regs AS RegTypeX
    Regs.AX = 0
    CALL InterruptX(&H33, Regs, Regs)
    Mouse.Detect = Regs.AX
END FUNCTION

FUNCTION Mouse.Driver.Version$
    DIM Regs AS RegTypeX
    Regs.AX = &H24
    CALL InterruptX(&H33, Regs, Regs)
    PRINT HEX$(Regs.BX)
   
    Temp1$ = LTRIM$(RTRIM$(STR$(VAL("&H" + LEFT$(HexVal(Regs.BX, 4), 2)))))
    Temp2$ = LTRIM$(RTRIM$(STR$(VAL("&H" + RIGHT$(HexVal(Regs.BX, 4), 2)))))
    Mouse.Driver.Version = Temp1$ + "." + Temp2$
END FUNCTION

SUB Mouse.Hide
    DIM Regs AS RegTypeX
    Regs.AX = 2
    CALL InterruptX(&H33, Regs, Regs)
END SUB

SUB Mouse.Info.Get
    
END SUB

SUB Mouse.Init
END SUB

SUB Mouse.Location.Get (X%, Y%)
    DIM Regs AS RegTypeX
    Regs.AX = 3
    CALL InterruptX(&H33, Regs, Regs)
    X% = Regs.CX
    Y% = Regs.DX
END SUB

SUB Mouse.Location.Set (X%, Y%)
    DIM Regs AS RegTypeX
    Regs.AX = 4
    Regs.CX = X%
    Regs.DX = Y%
    CALL InterruptX(&H33, Regs, Regs)
END SUB

SUB Mouse.Show
    DIM Regs AS RegTypeX
    Regs.AX = 1
    CALL InterruptX(&H33, Regs, Regs)
END SUB

SUB OMouse.Location.Get (Object AS Location2D)
    DIM Regs AS RegTypeX
    Regs.AX = 3
    CALL InterruptX(&H33, Regs, Regs)
    Object.X = Regs.CX
    Object.Y = Regs.DX
END SUB

