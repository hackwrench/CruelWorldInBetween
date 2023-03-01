'ArenaType:
'This type is used to simulate graphics in text mode.
'Instead of the normal 80x25 text graphics using chr$(219) "Û", we will be
'using chr$(220)"Ü" and chr$(223) "ß" and chr$(219) "Û" to mimic an 80x50
'pixel screen.
'Examine sub-programs Arena.Block.Set and PointIsThere to see how this is
'implemented
TYPE ArenaType
    realRow     AS INTEGER        'Maps the 80x50 point into the real 80x25
    Acolor      AS INTEGER        'Stores the current color of the point
    sister      AS INTEGER        'Each char has 2 points in it.  .sister is
END TYPE                          '-1 if sister point is above, +1 if below

DECLARE SUB Arena.Block.Set (Object() AS ArenaType, Row%, Col%, Acolor%)
DECLARE FUNCTION PointIsThere (Object() AS ArenaType, Row, Col, backColor)

