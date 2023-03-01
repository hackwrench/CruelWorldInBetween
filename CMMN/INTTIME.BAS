DEFINT A-Z

DECLARE FUNCTION IntTimer% ()
DECLARE FUNCTION IntDistance% (StartTime AS INTEGER, Rate%)
DECLARE FUNCTION IntElapsedEvents% (LastEvent AS INTEGER, Rate%)
DECLARE SUB IntDelay (T AS INTEGER)

SUB IntDelay (T AS INTEGER)
    Temp = IntTimer
    DO
      IF IntTimer < Temp THEN
         IF T < 32767 - Temp + IntTimer + 1 THEN EXIT DO
      ELSE
         IF Temp < IntTimer - T THEN EXIT DO
      END IF
    LOOP
END SUB

FUNCTION IntDistance (StartTime AS INTEGER, Rate)
    IF IntTimer < Temp THEN
       IntDistance = (32767 - Temp + IntTimer + 1) * Rate
    ELSE
       IntDistance = (IntTimer - StartTime) * Rate
    END IF
END FUNCTION

FUNCTION IntElapsedEvents (LastEvent AS INTEGER, Rate)
    IntElapsedEvents = (IntTimer - LastEvent / Rate)
END FUNCTION

