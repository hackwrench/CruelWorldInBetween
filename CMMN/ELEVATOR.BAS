'$DYNAMIC
DEFINT A-Z

DECLARE FUNCTION elevator% (PrevValue%, Max1%, Max2%)

'States of a Elevator using system
'LastWindowPos
'LastElevatorPos
'WhichChangeState
'WinPosMax... Could be total
'ElevPosMax

'Details:
'  The elevator bar in some manner usually deals with the cursor's movement
'through text and the text's movement through the window
'  Experiment with QB's Elevator by using th cursor keys, clicking on the
'elevator, clicking on the elevator bar and clicking on the arrows. Try this
'with documents less than a screen long and documents more than a screen long
'and you are bound to get a wide variety of results, including having the
'last line of the document being the only line in the window

REM $STATIC
FUNCTION elevator (PrevValue, Max1, Max2)
    tx1 = x1
    tx2 = x2
    xc = x
    yc = y
    e = 2 * (y2 - x2)
    FOR i = 1 TO x2
        WHILE e >= 0
            ty1 = ty1 + sy
            e = e - 2 * dx
        WEND
        x = x + sx
        e = e + 2 * dy
    NEXT i
END FUNCTION

