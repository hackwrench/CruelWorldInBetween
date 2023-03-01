DEFINT A-Z
'$INCLUDE: 'C:\HIQB\CMMN\LOCATE.INC'

TYPE BarHeaderType
     At AS Location2D
     Text AS TextColorType
     Length AS INTEGER
END TYPE 'BarHeaderType

DECLARE SUB Button (Text1$, Text2$, Row!, Col!, Locd!)
DECLARE SUB TimeDisplay ()

COMMON SHARED Key$, StatusKey$

'Values for Date Handling
DIM SHARED Months(12) AS STRING * 3

'Values for menubar
DIM SHARED Apps, MenuBar(menus, 3), MenuBar.Item$(menus, 12), MenuBar.pos(menus, 12)

FOR I = 1 TO 12
    READ Months(I)
NEXT I
DATA Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec

DEFSNG A-Z
SUB Bar.Title0 (Text AS STRING, X, Y, Length) STATIC
    COLOR 14, 1
    FOR I = 1 TO 3
        LOCATE I, 1
        PRINT STRING$(80, 32)
    NEXT I
    RX1 = 1
    RX2 = 40
    'CALL Center(Title$, RX1, RX2)
    LOCATE 1, 1
    PRINT "Help F1";
    LOCATE 2, 2
    CALL TimeDisplay
END SUB

DEFINT A-Z
SUB Header.Bar.Draw (Object AS BarHeaderType, Text AS STRING)
    COLOR 14, 1
    LOCATE Object.At.Y, Object.At.X
    PRINT SPACE$(Object.Length + 1);
    LOCATE Object.At.Y, Object.At.X + (Object.Length - LEN(Text)) / 2
    PRINT Text;
    COLOR 15, 0
    LOCATE Object.At.Y + 1, Object.At.X
    PRINT STRING$(Object.Length, "Û");
    COLOR 8, 1
    PRINT "Ü";
    LOCATE Object.At.Y + 2, Object.At.X
    PRINT " " + STRING$(Object.Length, "ß");
END SUB

SUB Header.Bar.Init (Object AS BarHeaderType, NewX, NewY, NewLength) ', ColorList())
    Object.At.X = NewX
    Object.At.Y = NewY
    Object.Length = NewLength
    'Object.Text.Fore = ColorList(1)
    'Object.Text.Back = ColorList(2)
END SUB

DEFSNG A-Z
SUB Menu (Row, Col, Hotkey$, Last, Selection, Numops, FG, bg, HiFG, Hibg) STATIC
    LETTER = 0
    IF LEN(Hotkey$) THEN hot = true
    Hotkey$ = UCASE$(Hotkey$)
    LMAX = 0
    IF Selection = 0 OR Selection > Numops THEN Selection = 1
    FOR I = 1 TO Numops
        b = LEN(oPTION$(I))
        IF b > LMAX THEN LMAX = b
    NEXT I
    LMAX = LMAX + 2
    FOR I = 1 TO Numops
        COLOR FG, bg
        f = Row + I - 1
        LOCATE f, Col
        IF oPTION$(I) = "-" THEN
           PRINT STRING$(LMAX, 196)
        ELSE
           PRINT " "; oPTION$(I); TAB(Col + LMAX);
           IF hot THEN
              a$ = MID$(Hotkey$, I, 1)
              b = INSTR(UCASE$(oPTION$(I)), a$)
              IF b THEN
                 COLOR hotletter, bg
                 LOCATE f, Col + b
                 PRINT MID$(oPTION$(I), b, 1)
              END IF
           END IF
        END IF
    NEXT I

    DO
      COLOR HiFG, Hibg
      LOCATE Row + Selection - 1, Col
      PRINT " "; oPTION$(Selection); TAB(Col + LMAX);
      IF hot THEN
         a$ = MID$(Hotkey$, Selection, 1)
         b = INSTR(UCASE$(oPTION$(Selection)), a$)
         IF b THEN
            COLOR hotletter, Hibg
            LOCATE Row + Selection - 1, Col + b
            PRINT MID$(oPTION$(Selection), b, 1)
         END IF
       END IF
       IF LETTER THEN EXIT DO
          DO
            DO
              'Call GetKey
            T$ = INKEY$
            LOOP UNTIL LEN(T$)
            IF ASC(T$) = 0 THEN
               T = -ASC(RIGHT$(T$, 1))
            ELSE
              T = ASC(T$)
            END IF
            Last = T
            IF T = 13 OR T = 27 THEN EXIT SUB
            S = (T = 13) OR (T = 27)
            S = S OR (T = -72) OR (T = -80)
            S = S OR (T = -71) OR (T = -79)
            IF T > 0 AND T <> 45 AND T <> 43 THEN
               LETTER = INSTR(Hotkey$, UCASE$(T$))
            END IF
            IF hot THEN
               IF MID$(Hotkey$, Selection, 1) = "+" AND T = 13 THEN S = 0
            END IF
          LOOP UNTIL S OR LETTER
       COLOR FG, bg
       LOCATE Row + Selection - 1, Col
       PRINT " "; oPTION$(Selection); TAB(Col + LMAX);
       IF hot THEN
          a$ = MID$(Hotkey$, Selection, 1)
          b = INSTR(UCASE$(oPTION$(Selection)), a$)
          IF b THEN
             COLOR hotletter, bg
             LOCATE Row + Selection - 1, Col + b
             PRINT MID$(oPTION$(Selection), b, 1)
          END IF
       END IF

       SELECT CASE T
              CASE -71: Selection = 1
              CASE -79: Selection = Numops
              CASE -72: Selection = Selection - 1
                        IF Selection = 0 THEN Selection = Numops
                        IF oPTION$(Selection) = "-" THEN
                           Selection = Selection - 1
                        END IF
              CASE -80: Selection = Selection + 1
                        IF Selection > Numops THEN Selection = 1
                        IF oPTION$(Selection) = "-" THEN
                           Selection = Selection + 1
                        END IF
              CASE ELSE: Selection = LETTER

       END SELECT
    LOOP
END SUB

DEFINT A-Z
SUB Menu.Bar.Draw (Object AS BarHeaderType, Objects() AS STRING, PObjects() AS INTEGER)
    FOR I = LBOUND(PObjects) TO UBOUND(PObjects)
        LOCATE Object.At.Y + 1, Object.At.X + PObjects(I)
        COLOR 4, 3
        PRINT Objects(I);
        COLOR 15, 0
        PRINT "ß";
        COLOR 0, 1
        LOCATE Object.At.Y + 2, Object.At.X + PObjects(I) + 1
        PRINT STRING$(LEN(Objects(I)), "ß");
    NEXT I
END SUB

DEFSNG A-Z
SUB Menu.Bar.Init (Apps) STATIC
    COLOR 15, 0
    LOCATE MenuBar(Apps, 1), MenuBar(Apps, 2)
    PRINT STRING$(MenuBar(Apps, 3), "Û");
    COLOR 8, 1
    PRINT "Ü";
    LOCATE MenuBar(Apps, 1) + 1, MenuBar(Apps, 2)
    PRINT " " + STRING$(MenuBar(Apps, 3), "ß");
    COLOR 0, 7
    FOR I = 1 TO 12
    IF MenuBar.Item$(Apps, I) = "" THEN EXIT FOR
    LOCATE MenuBar(Apps, 1), MenuBar(Apps, 2) + MenuBar.pos(Apps, I)
    PRINT MenuBar.Item$(Apps, I);
    COLOR 15, 0
    PRINT "ß";
    COLOR 0, 1
    LOCATE MenuBar(Apps, 1) + 1, MenuBar(Apps, 2) + MenuBar.pos(Apps, I) + 1
    PRINT STRING$(LEN(MenuBar.Item$(Apps, I)), 223)
    NEXT I
END SUB

SUB QueryEndSession (Title$) STATIC
    COLOR 14, 1
    LOCATE 10, 30
    PRINT SPACE$(20)
    'CALL Center(Title$, RX1, RX2)
    COLOR 7, 0
    FOR I = 1 TO 10
        LOCATE 10 + I, 30
        PRINT SPACE$(20)
    NEXT I
    LOCATE 14, 32
    PRINT "Exit Program"
    'CALL Button("Yes", "No", 40, 15, ButtonLock)
END SUB

DEFINT A-Z
SUB TimeDate.Init
FOR I = 1 TO 12
    READ Months(I)
NEXT I
END SUB

DEFSNG A-Z
SUB TimeDisplay STATIC
    HOUR = VAL(LEFT$(TIME$, 2)): IF HOUR > 12 THEN MER$ = "pm" ELSE MER$ = "am"
    IF HOUR > 12 THEN HOUR = HOUR - 12 ELSE IF HOUR = 0 THEN HOUR = 12
    COLOR 14, 1
    LOCATE 1, 71
    PRINT STR$(HOUR); MID$(TIME$, 3, 3); " "; MER$;
    LOCATE 1, 10
    PRINT Months(VAL(LEFT$(DATE$, 2))); STR$(VAL(MID$(DATE$, 4, 2))); ", "; RIGHT$(DATE$, 4);
END SUB

