DEFINT A-Z

TYPE RegTypeX
     AX    AS INTEGER
     BX    AS INTEGER
     cx    AS INTEGER
     DX    AS INTEGER
     BP    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     flags AS INTEGER
     ds    AS INTEGER
     ES    AS INTEGER
END TYPE

DECLARE SUB InterruptX (intnum AS INTEGER, inreg AS RegTypeX, outreg AS RegTypeX)

DECLARE FUNCTION IntTimer1% ()
DECLARE FUNCTION IntTime2% ()

FUNCTION IntTime2
    DIM Regs AS RegTypeX
    Regs.AX = &H2C00
    CALL InterruptX(&H21, Regs, Regs)
    IntTime2 = Regs.DX AND &H7FFF
END FUNCTION

FUNCTION IntTimer1
    DIM Regs AS RegTypeX
    CALL InterruptX(&H1A, Regs, Regs)
    IntTimer1 = Regs.DX AND &H7FFF
END FUNCTION

