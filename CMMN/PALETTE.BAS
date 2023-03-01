DEFINT A-Z
TYPE RegType
     AX    AS INTEGER
     BX    AS INTEGER
     cx    AS INTEGER
     dx    AS INTEGER
     bp    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     flags AS INTEGER
END TYPE

DECLARE SUB Interrupt (intnum AS INTEGER, inreg AS RegType, outreg AS RegType)
DECLARE SUB CGA.BlinkOff ()
DECLARE SUB EGAVGA.BlinkOff ()
DECLARE SUB Mono.BlinkOff ()
DECLARE FUNCTION ColorBackGet% (X%, Y%)

SUB CGA.BlinkOff
    OUT &H3DA, 9
END SUB

SUB CGA.BlinkOn
    OUT &H3DA, 29
END SUB

FUNCTION ColorBackGet (X, Y)
    'Didn't want to have to write this, but the SCREEN Function does not
    'return the background color
    DEF SEG = &HB800
END FUNCTION

SUB ColorSet0 (Fore, Back)
    'This is to fix the discrepancy in BASIC's COLOR command
    IF Back > 7 THEN
       TempBack = Back - 8
       TempFore = Fore + 16
    ELSE
       TempBack = Back
       TempFore = Fore
    END IF
       COLOR TempFore, TempBack
END SUB

SUB EGAVGA.BlinkOff
    DIM Regs AS RegType
    Regs.AX = &H1003
    Regs.BX = &H0
    CALL Interrupt(&H10, Regs, Regs)
END SUB

SUB EGAVGA.BlinkOn
    DIM Regs AS RegType
    Regs.AX = &H1003
    Regs.BX = &H1
    CALL Interrupt(&H10, Regs, Regs)
END SUB

SUB Mode0.Init
    WIDTH 80, 25
    SCREEN 0
    COLOR 7, 0
    LOCATE , , 0
    CLS
    SELECT CASE Graphics.Card.Detect
           CASE 1
                Mono.BlinkOff
           CASE 2
                CGA.BlinkOff
           CASE 3, 4, 5, 6, 7, 8
                EGAVGA.BlinkOff
           CASE ELSE
    END SELECT
END SUB

SUB Mono.BlinkOff
    OUT &H3BA, 9
END SUB

SUB Mono.BlinkOn
    OUT &H3BA, 29
END SUB

DEFSNG A-Z
SUB VGA.Grayscale
    DIM Regs AS RegType
    Regs.AX = &H1200
    Regs.BX = &H33
    CALL Interrupt(&H10, Regs, Regs)
END SUB

SUB VGA.NoGrayscale
    DIM Regs AS RegType
    Regs.AX = &H1201
    Regs.BX = &H33
    CALL Interrupt(&H10, Regs, Regs)
END SUB

SUB VGA.Regs.Load (Value, PalItem AS STRING)
    OUT &H3C8, Value
    OUT &H3C9, ASC(MID$(PalItem, 1, 1))
    OUT &H3C9, ASC(MID$(PalItem, 2, 1))
    OUT &H3C9, ASC(MID$(PalItem, 3, 1))
END SUB

SUB VGA.Regs.Retrieve (Value, PalItem AS STRING)
    OUT &H3C8, Value
    MID$(PalItem, 1, 1) = CHR$(INP(&H3C9))
    MID$(PalItem, 2, 1) = CHR$(INP(&H3C9))
    MID$(PalItem, 3, 1) = CHR$(INP(&H3C9))
END SUB

