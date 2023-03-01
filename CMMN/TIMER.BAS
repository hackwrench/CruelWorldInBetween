DEFINT A-Z
'Hackwrench Industries
'Robert Claypool

DECLARE FUNCTION Distance% (Rate%, StartTime AS SINGLE)
DECLARE SUB System.Delay (T!)

FUNCTION Distance (Rate, StartTime AS SINGLE)
    Distance = CINT((TIMER - StartTime) * Rate)
END FUNCTION

SUB System.Delay (T!)
    Timeout! = TIMER
    WHILE ABS(TIMER - Timeout!) < T!
    WEND
END SUB

