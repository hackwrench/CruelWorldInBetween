`

DEFINT A-Z
SUB Dither1 (X1, Y1, X2, Y2, DispColor)
    RealDispColor1 = Map1D22DX(DispColor, 4)
    IF RealDispColor1 = DispColor THEN
       LINE (X1, Y1)-(X2, Y2), DispColor, BF
       EXIT SUB
    END IF
 
    RealDispColor2 = Map1D22DY(DispColor, RealDispColor1, 4)
 
    TempX1 = X1 MOD 2
    TempX2 = X2 MOD 2
    TempY1 = Y1 MOD 2
    TempY2 = Y2 MOD 2
 
    'ON RealDispColor2 GOTO DitherA, DitherB
DitherA:
    RealDispColor2 = RealDispColor2 - 1
    FOR i = X1 + TempX1 TO X2 - TempX2 STEP 2
        LINE (0, i)-(319, i), RealDispColor1, , &HAAAA
        LINE (0, i)-(319, i), RealDispColor2, , &H5555
    NEXT i
    FOR i = X1 + (1 XOR TempX1) TO X1 - (1 XOR TempX1) STEP 2
        LINE (0, i)-(319, i), RealDispColor3, , &H5555
        LINE (0, i)-(319, i), RealDispColor4, , &HAAAA
    NEXT i
EXIT SUB
END SUB

