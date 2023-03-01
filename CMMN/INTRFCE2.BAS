DEFINT A-Z

DECLARE SUB System.Key.Get ()
DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)
DECLARE FUNCTION YesNo% ()
DECLARE FUNCTION YesNoRet% (PrevYesNo%)
DECLARE FUNCTION YesNoG% ()
DECLARE SUB Font.System (Text$, X%, Y%, Colour%)

COMMON SHARED Key$, StatusKey$, KeyVal, KeyInfo
DECLARE FUNCTION Center% (Diameter%, X1%, X2%)

REM $DYNAMIC
SUB Font.Center (Text$, Y, Colour)
    CALL Font.Regular(Text$, Center(LEN(Text$), 1, 80), Y, Colour)
END SUB

REM $STATIC
SUB Grid.Show
    COLOR 8
    FOR K = 2 TO 79
        FOR L = 2 TO 22
            LOCATE L, K
            PRINT CHR$(197)
        NEXT L
    NEXT K
END SUB

FUNCTION YesNo
    YesNo.X = POS(0)
    YesNo.Y = CSRLIN
    Yes.Colour = 3
    No.Colour = 15
    DO
      CALL Font.Regular("Yes", YesNo.X, YesNo.Y, Yes.Colour)
      CALL Font.Regular("No", YesNo.X + 5, YesNo.Y, No.Colour)
      CALL System.Key.Get
           SELECT CASE Key$
                  CASE "TAB"
                       SWAP Yes.Colour, No.Colour
                  CASE "RET"
                       EXIT DO
                  CASE "4"
                       IF Yes.Colour = 3 THEN SWAP Yes.Colour, No.Colour
                  CASE "6"
                       IF Yes.Colour = 15 THEN SWAP Yes.Colour, No.Colour
           CASE ELSE
      END SELECT
    LOOP
    IF Yes.Colour = 15 THEN YesNo = -1
END FUNCTION

FUNCTION YesNoG
    YesNo.X = POS(0)
    YesNo.Y = CSRLIN
    Yes.Colour = 3
    No.Colour = 15
    DO
      CALL Font.System("Yes", YesNo.X, YesNo.Y, Yes.Colour)
      CALL Font.System("No", YesNo.X + 5, YesNo.Y, No.Colour)
      CALL System.Key.Get
           SELECT CASE Key$
                  CASE "TAB"
                       SWAP Yes.Colour, No.Colour
                  CASE "RET"
                       EXIT DO
                  CASE "4"
                       IF Yes.Colour = 3 THEN SWAP Yes.Colour, No.Colour
                  CASE "6"
                       IF Yes.Colour = 15 THEN SWAP Yes.Colour, No.Colour
           CASE ELSE
      END SELECT
    LOOP
    IF Yes.Colour = 15 THEN YesNoG = -1
END FUNCTION

FUNCTION YesNoRet (PrevYesNo%)
    YesNo.X = POS(0)
    YesNo.Y = CSRLIN
    IF PrevYesNo THEN
       Yes.Colour = 15
       No.Colour = 3
    ELSE
       Yes.Colour = 3
       No.Colour = 15
    END IF
    SELECT CASE Key$
           CASE "TAB"
                SWAP Yes.Colour, No.Colour
           CASE "4"
                IF Yes.Colour = 3 THEN SWAP Yes.Colour, No.Colour
           CASE "6"
                IF Yes.Colour = 15 THEN SWAP Yes.Colour, No.Colour
           CASE ELSE
    END SELECT
    CALL Font.Regular("Yes", YesNo.X, YesNo.Y, Yes.Colour)
    CALL Font.Regular("No", YesNo.X + 5, YesNo.Y, No.Colour)
    IF Yes.Colour = 15 THEN YesNoRet = -1
END FUNCTION

