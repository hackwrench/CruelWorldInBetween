DEFINT A-Z
'$INCLUDE: 'ARENA.INC'

DECLARE SUB Arena.Block.Set (Object() AS ANY, Row%, Col%, Acolor%)
DECLARE SUB Font.Regular2 (Text$, X%, Y%, ForeColor%, backColor%)

CONST True = -1
CONST False = NOT True

'Arena.Block.Set:
'  Sets row and column on playing field to given color
SUB Arena.Block.Set (Object() AS ArenaType, Row, Col, Acolor)
    DIM OutString AS STRING * 1
    Object(Row, Col).Acolor = Acolor             'assign color to arena
    realRow = Object(Row, Col).realRow           'Get real row of pixel
    TopPixel = Object(Row, Col).sister + 1 / 2    'Deduce whether pixel is
                                                 'top(ß), or bottom(Ü).
    SisterRow = Row + Object(Row, Col).sister    'Get arena row of sister
    SisterColor = Object(SisterRow, Col).Acolor  'Determine sister's color
    LOCATE realRow, Col
    IF Acolor = SisterColor THEN 'both points are same
       ForeColor = Acolor
       OutString = CHR$(219)
    ELSE
       IF TopPixel THEN
          IF Acolor > 7 THEN
             ForeColor = Acolor
             backColor = SisterColor
             OutString = CHR$(223)
          ELSE
             ForeColor = SisterColor
             backColor = Acolor
             OutString = CHR$(220)
          END IF
       ELSE 'Not top pixel
          IF Acolor > 7 THEN
             ForeColor = Acolor
             backColor = SisterColor         'determine best combo
             OutString = CHR$(220)
          ELSE
             ForeColor = SisterColor
             backColor = Acolor
             OutString = CHR$(223)
          END IF
       END IF
    END IF
    CALL Font.Regular2(OutString, Col, realRow, ForeColor, backColor)
END SUB 'Arena.Block.Set

SUB Arena.Init (Object() AS ArenaType)
    'Initialize arena array
    FOR Row = 1 TO 50
        FOR Col = 1 TO 80
            Object(Row, Col).realRow = INT((Row + 1) / 2)
            Object(Row, Col).sister = (Row MOD 2) * 2 - 1
        NEXT Col
    NEXT Row
END SUB

'PointIsThere:
'  Checks the global arena array to see if the boolean flag is set
FUNCTION PointIsThere (Object() AS ArenaType, Row, Col, Acolor)
    IF Row <> 0 THEN
        IF Object(Row, Col).Acolor <> Acolor THEN
            PointIsThere = True
        ELSE
            PointIsThere = False
        END IF
    END IF
END FUNCTION 'PointIsThere

