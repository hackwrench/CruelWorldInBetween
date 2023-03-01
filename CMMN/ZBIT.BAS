DEFINT A-Z

DECLARE FUNCTION ZBIT% (Byte%, Position%)
DECLARE FUNCTION ZBIT2% (Byte AS INTEGER, Position AS INTEGER)

COMMON SHARED /Bit/ XBit() AS INTEGER

SUB XBit.Init
    XBit(0) = 1
    XBit(1) = 2
    XBit(2) = 4
    XBit(3) = 8
    XBit(4) = 16
    XBit(5) = 32
    XBit(6) = 64
    XBit(7) = 128
END SUB

FUNCTION ZBIT (Byte, Position)
    ZBIT = (Byte AND XBit(Position))
END FUNCTION

FUNCTION ZBIT2 (Byte AS INTEGER, Position AS INTEGER)
    Temp = Byte
    FOR I = 0 TO Position
        Temp = Temp / 2
    NEXT
    ZBIT2 = Temp AND 1
END FUNCTION

