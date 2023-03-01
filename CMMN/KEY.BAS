DEFINT A-Z

TYPE RegType
     ax    AS INTEGER
     bx    AS INTEGER
     cx    AS INTEGER
     dx    AS INTEGER
     bp    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     flags AS INTEGER
END TYPE

DECLARE SUB Interrupt (intnum AS INTEGER, inreg AS RegType, outreg AS RegType)

DECLARE SUB System.Key.Process ()
DECLARE FUNCTION Key.Shifted% ()
DECLARE SUB System.Key.Get ()
DECLARE FUNCTION System.Key.Pressed% ()

COMMON SHARED Key$, StatusKey$, KeyVal, KeyInfo

FUNCTION Key.Shifted
    Key.Shifted = -1 * ((INSTR(StatusKey$, "L") <> 0) + (INSTR(StatusKey$, "L") <> 0) * 2)
END FUNCTION

SUB System.Key.Clear
    DO
    LOOP UNTIL INKEY$ = ""
END SUB

SUB System.Key.Get
    CONST InsState = &H80
    CONST CapsState = &H40
    CONST NumState = &H20
    CONST ScrollState = &H10
    CONST AltState = &H8
    CONST CtrlState = &H4
    CONST LeftShift = &H2
    CONST RightShift = &H1

    Key$ = INKEY$
    StatusKey$ = ""
    DEF SEG = 0
    IF PEEK(&H417) AND InsState THEN StatusKey$ = "I"
    IF PEEK(&H417) AND CapsState THEN StatusKey$ = StatusKey$ + "C"
    IF PEEK(&H417) AND NumState THEN StatusKey$ = StatusKey$ + "N"
    IF PEEK(&H417) AND ScrollState THEN StatusKey$ = StatusKey$ + "S"
    IF PEEK(&H417) AND AltState THEN StatusKey$ = StatusKey$ + "A": KeyInfo = 3
    IF PEEK(&H417) AND CtrlState THEN StatusKey$ = StatusKey$ + "T": KeyInfo = 3
    IF PEEK(&H417) AND LeftShift THEN StatusKey$ = StatusKey$ + "L": KeyInfo = 3
    IF PEEK(&H417) AND RightShift THEN StatusKey$ = StatusKey$ + "R": KeyInfo = 3
    DEF SEG
    System.Key.Process
END SUB

SUB System.Key.Last.Get
    Key$ = ""
    DO
      Temp$ = INKEY$
      IF Temp$ = "" THEN
         EXIT DO
      ELSE
         Key$ = Temp$
      END IF
    LOOP
    System.Key.Process
END SUB

FUNCTION System.Key.Pressed
    DIM KeyTest AS RegType
    KeyTest.ax = &HB00
    CALL Interrupt(&H21, KeyTest, KeyTest)
    System.Key.Pressed = (KeyTest.ax = 3071)
END FUNCTION

SUB System.Key.Process
    IF Key$ = "" THEN EXIT SUB
    KeyVal = ASC(RIGHT$(Key$, 1))
    IF LEN(Key$) = 2 THEN GOTO nd
    IF KeyVal > 96 AND KeyVal < 123 THEN Key$ = CHR$(KeyVal AND &HDF): KeyInfo = 1
    IF KeyVal = 27 THEN Key$ = "ESC": KeyInfo = 2
    IF KeyVal = 13 THEN Key$ = "RET"
    IF KeyVal = 9 THEN Key$ = "TAB"
    IF KeyVal = 8 THEN Key$ = "BKS"
EXIT SUB

nd:
  IF KeyVal = 15 THEN Key$ = "TAB"
  IF KeyVal > 58 AND KeyVal < 69 THEN Key$ = "F" + RIGHT$(STR$(KeyVal - 58), 1): KeyInfo = 2
  IF KeyVal > 132 AND KeyVal < 135 THEN Key$ = "F" + RIGHT$(STR$(KeyVal - 132), 1): KeyInfo = 2

  IF KeyVal > 70 AND KeyVal < 74 THEN Key$ = CHR$(KeyVal - 16): KeyInfo = 4
  IF KeyVal > 74 AND KeyVal < 78 THEN Key$ = CHR$(KeyVal - 23): KeyInfo = 4
  IF KeyVal > 78 AND KeyVal < 82 THEN Key$ = CHR$(KeyVal - 30): KeyInfo = 4
  IF KeyVal = 82 THEN Key$ = "0": KeyInfo = 4
  IF KeyVal = 83 THEN Key$ = ".": KeyInfo = 4
END SUB

