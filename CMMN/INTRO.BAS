'$DYNAMIC
DEFINT A-Z
'$INCLUDE: 'C:\HIQB\CMMN\LOCATE.INC'

DECLARE SUB Way1 ()
DECLARE SUB Font.PutChar (Text$, X%, Y%, Colour%)
DECLARE SUB Screen.Flash ()
DECLARE SUB Screen.Main (X%, Y%)
DECLARE SUB System.Key.Get ()
DECLARE SUB System.Key.Clear ()
DECLARE SUB System.Delay (T!)
DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)
DECLARE SUB Font.System (Text$, X%, Y%, Colour%)
DECLARE SUB Intro.Credits (ToGame, AreaObject AS Object2D)

DECLARE FUNCTION Distance% (Rate%, StartTime AS SINGLE)
DECLARE FUNCTION System.Key.Pressed% ()

COMMON SHARED /Fonts/ Scale%
COMMON SHARED Key$, StatusKey$

CONST True = -1
CONST False = NOT True

SUB Intro.Credits (ToGame, AreaObject AS Object2D) STATIC
    SHARED Scale%
    IF Failed(1) = True THEN
       EXIT SUB
    END IF
    CALL Way1
    CALL Font.System("ACKWRENCH", 178, 140, 6)
    CALL Font.System("NDUSTRIES", 190, 190, 14)
   
    CALL Font.System("- Presents -", 192, 240, 8)
    CALL System.Delay(.5)
    CALL Font.System("- Presents -", 192, 240, 7)
    CALL System.Delay(.5)
    CALL Font.System("- Presents -", 192, 240, 15)
    IF ToGame = True THEN
       EXIT SUB
    END IF
    TIM! = TIMER + .5
    DO WHILE TIM! > TIMER
       CALL System.Key.Get
       IF Key$ <> "" THEN
          ToGame = True
          EXIT DO
       END IF
    LOOP
END SUB

SUB Intro.Game
    DIM AreaObject AS Object2D
    CALL Intro.Credits(ToGame, AreaObject)
    CALL Screen.Flash
    CALL Screen.Main(80, 80)
     K$ = ""
    WHILE K$ = ""
      K$ = INKEY$
    WEND
END SUB

REM $STATIC
SUB Way1
    Scale% = 5
    TimIntro! = TIMER
    DO
      OldMark = Mark
      Mark = Distance(10, TimIntro!)
      IF OldMark <> Mark THEN
         CALL Font.PutChar("I", 175, OldMark, 0)
         CALL Font.PutChar("H", 155, 320 - OldMark, 0)
      END IF
      CALL Font.PutChar("I", 175, Mark, 14)
      CALL Font.PutChar("H", 155, 320 - Mark, 6)
      IF TimIntro! < TIMER - 5 THEN
         EXIT DO
      END IF
      IF System.Key.Pressed THEN
         ToGame = True
         System.Key.Clear
         EXIT SUB
      END IF
    LOOP

END SUB

