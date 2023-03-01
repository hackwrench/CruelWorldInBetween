'$DYNAMIC
DEFINT A-Z

DECLARE FUNCTION Value.ShiftDown.Multi% (Value%, Min%, Max%, Change%)
DECLARE FUNCTION Value.ShiftUp.Multi% (Value%, Min%, Max%, Change%)
DECLARE FUNCTION Value.InRange% (Value%, Min%, Max%)
DECLARE FUNCTION Value.Limit.Max% (Value%, Max%)
DECLARE FUNCTION Value.Limit.Min% (Value%, Min%)
DECLARE FUNCTION Value.ShiftDown% (Value%, Min%, Max%)
DECLARE FUNCTION Value.ShiftUp% (Value%, Min%, Max%)

FUNCTION Value.InRange% (Value%, Min%, Max%)
    Value.InRange% = (Value% >= Min%) AND (Value% <= Max%)
END FUNCTION

FUNCTION Value.Limit.Max% (Value%, Max%)
    IF Value% = Max% THEN
       Value.Limit.Max% = Value%
    ELSE
       Value.Limit.Max% = Value% + 1
    END IF
END FUNCTION

'Value.Limit.Min%
FUNCTION Value.Limit.Min% (Value%, Min%)
    IF Value% = Min% THEN
       Value.Limit.Min% = Value%
    ELSE
        Value.Limit.Min% = Value% - 1
    END IF
END FUNCTION

FUNCTION Value.ShiftDown% (Value%, Min%, Max%)
    IF Value% = Min% THEN
       Value.ShiftDown% = Max%
    ELSE
       Value.ShiftDown% = Value% - 1
    END IF
END FUNCTION

REM $STATIC
FUNCTION Value.ShiftDown.Multi (Value%, Min%, Max%, Change%)
    Temp1% = Max% - Min%
    Temp% = Change%
Start1:
    IF Temp% = 0 THEN
       Value.ShiftDown.Multi = Value%
       EXIT FUNCTION
    END IF
    IF Temp% - 1 >= Temp1% THEN
       Temp% = Temp% - Temp1% - 1
       GOTO Start1
    END IF

    Temp1% = Value% - Min%
    IF Temp% > Temp1% THEN
       Value.ShiftDown.Multi = Max% - (Temp% - Temp1%) + 1
    ELSE
       Value.ShiftDown.Multi = Value% - Temp%
    END IF
    'Here is the infuriating Piece of code:  Change% MOD Max% - Min% + 1
    'Just try using MOD with Min, 0 AND Max 32767
END FUNCTION

REM $DYNAMIC
FUNCTION Value.ShiftUp% (Value%, Min%, Max%)
    IF Value% = Max% THEN
       Value.ShiftUp% = Min%
    ELSE
       Value.ShiftUp% = Value% + 1
    END IF
END FUNCTION

REM $STATIC
'Value.ShiftUp.Multi
'  The value of any of the Variables can never be greater than Max%
'  Value% can take on all values between and including Min% and Max%
'  Problem I coded around:
'    Change Greater than Range
FUNCTION Value.ShiftUp.Multi (Value%, Min%, Max%, Change%)
    Temp% = Change%
    Temp1% = Max% - Min%
Start2:
    IF Temp% = 0 THEN
       Value.ShiftUp.Multi = Value%
       EXIT FUNCTION
    END IF
    
    IF Temp% - 1 >= Temp1% THEN
       Temp% = Temp% - Temp1% - 1
       GOTO Start2
    END IF
   
    Temp1% = Max% - Value%
    IF Temp% > Temp1% THEN
       Value.ShiftUp.Multi = Min% + (Temp% - Temp1) - 1
    ELSE
       Value.ShiftUp.Multi = Value% + Temp%
    END IF
    'ChangeLo%=Max%-Value%-Min%
    'Max%-(Max%-Value%)
    'Max%-Min is replacable with total - 1
    'Here is the infuriating Piece of code:  Change% MOD Max% - Min% + 1
    'Just try using MOD with Min, 0 AND Max 32767
END FUNCTION

