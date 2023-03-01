DEFINT A-Z

SUB MasterList
    LINE (20, 20)-(410, 310), 1, B
    LINE (21, 21)-(409, 309), 0, BF
    FOR I = LBOUND(Thing) TO UBOUND(Thing)
        COLOR 7
        X = Map1D22DX(I - LBOUND(Thing), 20)
        Y = Map1D22DY(I - LBOUND(Thing), X, 20)
        LOCATE X + 3, Y * 25 + 5
        PRINT Thing(I).Description;
        COLOR Thing(I).Colour
        PRINT Thing(I).Icon
    NEXT I
END SUB

