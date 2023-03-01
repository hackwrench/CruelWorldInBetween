DEFINT A-Z

DECLARE FUNCTION Value.ShiftDown.Multi% (Value%, Min%, Max%, Change%)
DECLARE FUNCTION Value.ShiftUp.Multi% (Value%, Min%, Max%, Change%)
FOR i = 0 TO 32767
    PRINT Value.ShiftDown.Multi%(10, 0, 20, i),
    DO
    LOOP UNTIL INKEY$ <> ""
NEXT i

