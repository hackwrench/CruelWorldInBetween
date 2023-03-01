DEFINT A-Z

DECLARE FUNCTION ColorSelect.256& (Red%, Green%, Blue%)

SUB ColorMap.256
    ' VGA colors in 6 bits of 3 bytes of a long integer
    ' Bits:  000000000 00bbbbbb 00gggggg 00rrrrrr
    ' Change the order of FOR loops to change color mix
    ' Decrease the STEP and increase VC.Colors to get more colors
    Index = 0
    FOR Rs = 0 TO 63 STEP 11
        FOR Bs = 0 TO 63 STEP 11
            FOR Gs = 0 TO 63 STEP 11
                PALETTE Index, ColorSelect.256&(Rs, Bs, Gs)
                Index = Index + 1
            NEXT Gs
        NEXT Bs
    NEXT Rs
END SUB 'ColorMap.256

FUNCTION ColorSelect.256& (Red%, Green%, Blue%)
    ColorSelect.256& = (65536 * Blue) + (256 * Green) + Red
END FUNCTION 'ColorSelect.256&

