DEFINT A-Z

TYPE RegTypeX
     ax    AS INTEGER
     bx    AS INTEGER
     cx    AS INTEGER
     dx    AS INTEGER
     bp    AS INTEGER
     SI    AS INTEGER
     DI    AS INTEGER
     Flags AS INTEGER
     DS    AS INTEGER
     es    AS INTEGER
END TYPE

DECLARE SUB InterruptX (intnum AS INTEGER, inreg AS RegTypeX, outreg AS RegTypeX)

SUB BIOS.Font.EGA.Default.Load
    DIM Regs AS RegTypeX
    Regs.ax = &H1101             ' Load ROM 8x14 character set.
    InterruptX &H10, Regs, Regs
END SUB

SUB Bios.Font.EGA.Load (Store())
    DIM Regs AS RegTypeX
    Regs.bp = VARPTR(Store(0))      ' Offset of font data address.
    Regs.es = VARSEG(Store(0))      ' Segment of font data address.
    Regs.ax = &H1100                ' Service &H11, sub-service &H00.
    Regs.bx = &HE00                 ' 14 bytes/char, Load into block 0.
    Regs.cx = 256                   ' Load all 256 characters.
    Regs.dx = 0                     ' Start at offset 0 (into font data).
END SUB

SUB BIOS.Font.Load (Store(), FontType, FileNum)
    SELECT CASE FontType
           CASE 16 'half of CGA 8x8
                MaxVal = 511
           CASE 1 'Full CGA 8x8
                MaxVal = 1023
           CASE 2 'EGA 8x14
                MaxVal = 1791
           CASE 3 'VGA
                MaxVal = 2047
           CASE ELSE
    END SELECT
    FOR I = 0 TO MaxVal
        GET FileNum, , Store(I)
    NEXT I
END SUB

