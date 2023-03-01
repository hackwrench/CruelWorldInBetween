DEFINT A-Z
'$INCLUDE: 'C:\HIQB\CMMN\LOCATE.INC'

'Area.Tile:
'  Uses a graphic to tile in an area
SUB Area.Tile (Tile%(), TileArea AS RectangleType)
    VIEW SCREEN (TileArea.X1, TileArea.Y1)-(TileArea.X2, TileArea.Y2)
    FOR I = TileArea.X1 TO TileArea.X2 - 15 STEP 16
        FOR J = TileArea.Y1 TO TileArea.Y2 - 15 STEP 16
            PUT (I, J), Tile%, PSET
        NEXT J
    NEXT I
END SUB 'Area.Tile

SUB Block.Get STATIC
    DIM Fld(15, 15)
    FOR I = 0 TO 15
        FOR J = 0 TO 15
            INPUT #1, Fld(I, J)
        NEXT J
    NEXT I
    CLOSE
    FOR I = 0 TO 15
        FOR J = 0 TO 15
            PSET (I, J), Fld(I, J)
        NEXT J
    NEXT I
END SUB 'Block.Get

SUB Block.PSET (BlockList() AS INTEGER, BlockNum, X, Y)
    PUT (X, Y), BlockList(0, BlockNum), PSET
END SUB 'Block.PSET

SUB HGB2Screen (FileNum%)
    DIM FileByte AS STRING * 1
    GET FileNum%, , X%
    GET FileNum%, , Y%
    FOR I = 0 TO Y% - 1
        FOR J = 0 TO X% - 1
            GET FileNum%, , FileByte
            PSET (I, J), ASC(FileByte)
        NEXT J
    NEXT I
END SUB 'HGB2Screen

SUB VisibleSpace.Set (Object AS RectangleType)
    VIEW SCREEN (Object.X1, Object.Y1)-(Object.X2, Object.Y2)
END SUB 'VisibleSpace.Set

