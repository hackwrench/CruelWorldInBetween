DEFINT A-Z

DECLARE FUNCTION Enough% (Q%)
DECLARE FUNCTION Factoral% (Factor%)
DECLARE FUNCTION RemainderDevision% (Intermediate%, Divider%)

FUNCTION Enough (Q)
    Enough = (Q > 0)
END FUNCTION

FUNCTION Factoral% (Factor%)
    IF Factor% = 0 THEN GOTO FactoralJump
    TFactoral = 1
    IF Factor% = 1 THEN GOTO FactoralJump
    FOR I = 2 TO Factor%
        TFactoral = TFactoral * I
    NEXT I
FactoralJump:
    Factoral = TFactoral
END FUNCTION

FUNCTION RemainderDevision (Intermediate, Divider)
    Temp = Intermediate
    Intermediate = Divider MOD Temp
    RemainderDevision = (Divider - Intermediate) / Temp
END FUNCTION

