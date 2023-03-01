DEFINT A-Z
'$DYNAMIC
'$INCLUDE: 'C:\HIQB\CMMN\LOCATE.INC'


DECLARE SUB ColorSet0 (Fore%, Back%)
DECLARE FUNCTION Key.Shifted% ()


DECLARE SUB System.Delay (t!)
DECLARE SUB System.Key.Get ()
DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)
DECLARE SUB Font.System (Text$, X%, Y%, col%)
DECLARE SUB Bar.Title (Text AS STRING, X%, Y%, Length%)
DECLARE SUB ShowDate (X%, Y%, Colour%)
DECLARE SUB ShowTime (X%, Y%, Colour%)

DECLARE FUNCTION DecToBin$ (n%)
DECLARE FUNCTION YesNo% ()
DECLARE FUNCTION Center% (Diameter%, X1%, X2%)
DECLARE FUNCTION System.Key.Pressed% ()
DECLARE FUNCTION Elevator.Value (CurrValue%, MaxValue%, MaxPos%)
DECLARE FUNCTION String.List.Compare% (Text$, TextList$())
DECLARE FUNCTION Map1D22DX% (Value1D%, TotalX%)
DECLARE FUNCTION Map1D22DY% (Value1D%, X%, TotalX%)
DECLARE FUNCTION YesNoRet% (PrevYesNo%)
DECLARE FUNCTION ObjectX.Total.Get% (Object AS ANY)

COMMON SHARED Key$, StatusKey$, KeyVal, KeyInfo
COMMON SHARED /DateTime/ Months() AS STRING * 3

REM $STATIC
SUB Bar.Elevator (Objects(), StartX, StartY, Length, Orientation)
END SUB

SUB Bar.Title (Text AS STRING, X, Y, Length) STATIC
    LINE (X, Y)-(X + Length, Y + 41), 1, BF
    LINE (X + 7, Y + 21)-(X + Length, Y + 34), 8, BF
    LINE (X, Y + 14)-(X + Length - 8, Y + 27), 15, BF
    CALL Font.System(Text, Center(LEN(Text) * 8, X, X + Length), Y + 4, 14)
END SUB

SUB Box.See (X, Y, Nam$, NList() AS STRING, SList() AS INTEGER)
    LINE (X, Y)-(X + 180, Y + 260), 7, BF
    CALL Font.System(LTRIM$(RTRIM$(Nam$)) + " Sees:", X + 2, Y + 2, 0)
    FOR i = LBOUND(SList) TO UBOUND(SList)
        IF SList(i) = 0 AND i <> LBOUND(SList) THEN EXIT FOR
        CALL Font.System(NList(SList(i)), X + 2, Y + 12 + 10 * (i - LBOUND(SList)), 0)
    NEXT i
    DO UNTIL INKEY$ = CHR$(13)
    LOOP
    LINE (X, Y)-(X + 180, Y + 260), 0, BF
END SUB

SUB Date.Init
    Months(1) = "Jan"
    Months(2) = "Feb"
    Months(3) = "Mar"
    Months(4) = "Apr"
    Months(5) = "May"
    Months(6) = "Jun"
    Months(7) = "Jul"
    Months(8) = "Aug"
    Months(9) = "Sep"
    Months(10) = "Oct"
    Months(11) = "Nov"
    Months(12) = "Dec"
END SUB

SUB Date.Show (X, Y, Colour)
    CALL Font.System(Months(VAL(LEFT$(DATE$, 2))) + STR$(VAL(MID$(DATE$, 4, 2))) + ", " + RIGHT$(DATE$, 4), X, Y, Colour)
END SUB

FUNCTION DecToBin$ (n%)
    SELECT CASE HEX$(n%)
           CASE "0": DecToBin$ = "0000"
           CASE "1": DecToBin$ = "0001"
           CASE "2": DecToBin$ = "0010"
           CASE "3": DecToBin$ = "0011"
           CASE "4": DecToBin$ = "0100"
           CASE "5": DecToBin$ = "0101"
           CASE "6": DecToBin$ = "0110"
           CASE "7": DecToBin$ = "0111"
           CASE "8": DecToBin$ = "1000"
           CASE "9": DecToBin$ = "1001"
           CASE "A": DecToBin$ = "1010"
           CASE "B": DecToBin$ = "1011"
           CASE "C": DecToBin$ = "1100"
           CASE "D": DecToBin$ = "1101"
           CASE "E": DecToBin$ = "1110"
           CASE "F": DecToBin$ = "1111"
           CASE ELSE
    END SELECT
END FUNCTION

SUB DrawBox (X%, Y%, XX%, YY%, C%, BC%, Solid%, CharSet%)

IF CharSet% = 1 THEN
  Char1$ = "Ú"
  CharHoz$ = "Ä"
  Char2$ = "¿"
  CharVert$ = "³"
  Char3$ = "À"
  Char4$ = "Ù"
END IF

IF CharSet% = 2 THEN
  Char1$ = "É"
  CharHoz$ = "Í"
  Char2$ = "»"
  CharVert$ = "º"
  Char3$ = "È"
  Char4$ = "¼"
END IF

COLOR C%, BC%
A = (XX% - X%) - 1
LOCATE Y%, X%: PRINT Char1$; STRING$(A, CharHoz$); Char2$
FOR i = Y% + 1 TO YY% - 1
  LOCATE i, X%: PRINT CharVert$;
  IF Solid% = 1 THEN PRINT SPACE$(A);
  LOCATE i, XX%: PRINT CharVert$;
NEXT i
LOCATE YY%, X%: PRINT Char3$; STRING$(A, CharHoz$); Char4$;

END SUB

FUNCTION Elevator.Value (CurrValue, MaxValue, MaxPos)
       Elevator.Value = MaxPos / MaxValue * CurrValue
END FUNCTION

SUB Menu.Item (Text AS STRING, X, Y, Length, Fore, Back, Shadow)
    LINE (X + 7, Y + 7)-(X + Length + 7, Y + 20), Shadow, BF
    LINE (X, Y)-(X + Length, Y + 13), Back, BF
    CALL Font.System(Text, X + 7, Y + 4, Fore)
END SUB

SUB Menu.Item0 (Text AS STRING, X, Y, Length, TextColor, BackColor, ShadeColor)
    CALL ColorSet0(TextColor, BackColor)
    LOCATE Y, X
    PRINT SPACE$(Length)
    LOCATE Y, X
    PRINT Text
    CALL ColorSet0(ShadeColor, SCREEN(Y, X + Length, 1))
    FOR i = 1 TO Length
    NEXT i
END SUB

SUB Menu.Item13 (Text AS STRING, X, Y, Length, TextColor, BackColor, ShadeColor)
    LINE (X + 4, Y + 4)-(X + Length + 4, Y + 11), ShadeColor, BF'Shadow
    LINE (X, Y)-(X + Length, Y + 7), BackColor, BF'Box
    CALL Font.System(Text, X, Y, TextColor)'Text
END SUB

SUB PRINTFill (Txt AS STRING, Length AS INTEGER)
    PRINT Txt; SPACE$(Length - LEN(Txt))
END SUB

SUB Speech.Display (Text$, VoiceList() AS STRING, VoiceColor(), X, Y) STATIC
    TempText$ = MID$(Text$, INSTR(Text$, "-") + 1, LEN(Text$))
    SpeechColor = VoiceColor(String.List.Compare(TempText$, VoiceList()))
    CALL Font.System(LEFT$(Text$, A - 1), X, Y, SpeechColor)
END SUB

'Text.Edit
'This subroutine handles a user-entered string.  You can limit the length of
'the string entered as it is typed, a capability not possible with the INPUT
'statement.
'With minor modification of the SELECT CASE statements, you can also allow
'only certain characters to be entered.
'Parameters are as follows:
'    st$ -  the string to edit
'    leftCol% - This is the column of the screen to allow the user to
'               start typing on.  Valid range is 1 through 79.
'    row% - This is the row of the screen on which the user will type
'           Allowable range is 1 through 25.
'    foreColor% - The foreground color to display the user's entry
'                 in.  Alowable range is 0 through 15.
'    backColor% - The background color to display the user's entry
'                 in.  Allowable range is 0 through 7.
'
SUB Text.Edit (Text$, leftCol%, row%, foreColor%, BackColor%)
    ' Save the string passed in just in case ESC is hit
    oldText$ = Text$
    ' Clear keystroke variable
    Key$ = ""
    ' Set cursor position to first char in string
    charPos% = 1
    ' Set colors and locate the cursor
    COLOR foreColor%, BackColor%
    LOCATE row%, leftCol%, 1
    ' Display the passed in string and relocate the cursor to beginning
    PRINT st$;
    LOCATE row%, leftCol%, 1, topScan%, botScan%
    ' Read keystrokes until ENTER or ESC is pressed
    done% = FALSE
    DO
      Key$ = ""
      WHILE Key$ = ""
          Key$ = INKEY$
      WEND
      'Decide what to do with the returned key
      SELECT CASE Key$
            CASE EndKee$              ' Move to last non-space char, plus one
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move cursor to last NON-SPACE character of string
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                charPos% = LEN(st$)
                WHILE MID$(st$, charPos%, 1) = " " AND charPos% > 1
                    charPos% = charPos% - 1
                WEND
                IF charPos% > 1 THEN
                    charPos% = charPos% + 1
                END IF
         
            CASE HomeKee$             ' Move to first char position
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move cursor to first char position
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                charPos% = 1
         
            CASE LeftArrowKey$           ' Cursor left one position
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' If charPos not already at first pos, move it left 1
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF charPos% > 1 THEN
                    charPos% = charPos% - 1
                END IF
         
            CASE RightArrowKey$          ' Cursor right one position
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' If not already at end of string, move charPos right 1
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF charPos% < LEN(st$) THEN
                    charPos% = charPos% + 1
                END IF
         
            CASE del$ ' Delete char at cursor
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move all characters to left of cursor left 1
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                FOR i% = charPos% TO LEN(st$) - 1
                    MID$(st$, i%, 1) = MID$(st$, i% + 1, 1)
                NEXT i%
                MID$(st$, LEN(st$), 1) = " "
         
            CASE ins$ ' Change from insert mode to overtype and back
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Toggle ins mode
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF insON% THEN
                    insON% = FALSE
                ELSE
                    insON% = TRUE
                END IF
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Change cursor scan lines so it's BIG for overtype mode,
            ' small for insert mode
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF insON% THEN          ' Make cursor small - insert mode
                    IF ColorChk THEN
                        topScan% = 6
                        botScan% = 7
                    ELSE
                        topScan% = 11
                        botScan% = 12
                    END IF
                ELSE    ' Make cursor BIG - overtype mode
                    IF ColorChk THEN
                        topScan% = 1
                        botScan% = 7
                    ELSE
                        topScan% = 1
                        botScan% = 12
                    END IF
                END IF
         
            CASE backspace$           ' Delete char left of cursor and move left one
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move cursor left 1 if not already at beginning of string,
            ' and then shift all chars right of cursor left 1.
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF charPos% > 1 THEN
                    charPos% = charPos% - 1
                    FOR i% = charPos% TO LEN(st$) - 1
                        MID$(st$, i%, 1) = MID$(st$, i% + 1, 1)
                    NEXT i%
                    MID$(st$, LEN(st$), 1) = " "
                END IF
         
            CASE ctrlY$               ' Erase entire entry field
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Delete the entire line - reset string to spaces and move cursor
            ' to beginning of field
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                st$ = SPACE$(LEN(st$))
                charPos% = 1
         
            CASE ctrlT$  ' Erase the word to the right of the cursor
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Remove characters from right of string until a space is
            ' found, or we have removed the whole line from the cursor.
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                charsLeft% = LEN(st$) - charPos%
                count% = charPos%
                WHILE MID$(st$, charPos%, 1) <> " " AND count% < charsLeft%
                    FOR X% = charPos% TO LEN(st$) - 1
                        MID$(st$, X%, 1) = MID$(st$, X% + 1)
                    NEXT X%
                    MID$(st$, LEN(st$), 1) = " "
                    count% = count% + 1
                WEND
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Remove any spaces until a char is found.  DO NOT delete the
            ' char!
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                WHILE MID$(st$, charPos%, 1) = " " AND count% < charsLeft%
                    FOR X% = charPos% TO LEN(st$) - 1
                        MID$(st$, X%, 1) = MID$(st$, X% + 1)
                    NEXT X%
                    MID$(st$, LEN(st$), 1) = " "
                    count% = count% + 1
                WEND
         
            CASE ctrlLeftArrow$       ' Find next word left
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move to either the next non-space or position 1, whichever
            ' is first
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF charPos% > 1 THEN
                    DO
                        charPos% = charPos% - 1
                    LOOP UNTIL (MID$(st$, charPos%, 1) <> " ") OR charPos% = 1
                END IF
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move left until space or pos 1 is found, whichever is first
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF charPos% > 1 THEN
                    DO
                        charPos% = charPos% - 1
                    LOOP UNTIL (MID$(st$, charPos%, 1) = " ") OR charPos% = 1
                END IF
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move forward one if at a space
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF MID$(st$, charPos%, 1) = " " THEN
                    charPos% = charPos% + 1
                END IF
         
            CASE ctrlRightArrow$      ' Find next word right
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move right until space or last pos is found, whichever is
            ' first
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF charPos% <= LEN(st$) THEN
                    DO
                        charPos% = charPos% + 1
                    LOOP UNTIL (MID$(st$, charPos%, 1) = " ") OR charPos% = LEN(st$) + 1
                END IF
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move to either the next non-space or last position, which-
            ' ever is first
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF charPos% <= LEN(st$) THEN
                    DO
                        charPos% = charPos% + 1
                    LOOP UNTIL (MID$(st$, charPos%, 1) <> " ") OR charPos% = LEN(st$) + 1
                END IF
         
            CASE esc$ ' Exit the operation
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Restore original value of string and exit
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                st$ = oldSt$
                done% = TRUE
         
            CASE enter$               ' Accept entry and exit operation
         
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Edit finished - exit subroutine
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                done% = TRUE
         
            CASE ELSE ' Valid text goes here
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Place new character in the string.  If in INS mode, then
            ' move all chars to right 1 first.
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                IF charPos% <= LEN(st$) THEN
                    IF insON% THEN
                        FOR X% = LEN(st$) - 1 TO charPos% STEP -1
                            MID$(st$, X% + 1, 1) = MID$(st$, X%, 1)
                        NEXT X%
                    END IF
                    MID$(st$, charPos%, 1) = Key$
                END IF
        
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            ' Move character position right 1 if not at max pos already
            'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                charPos% = charPos% + 1
                IF charPos% > LEN(st$) + 1 THEN
                    charPos% = charPos% - 1
                END IF
        
        
         
            END SELECT                ' CASE Key$
     
        'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        ' Redisplay string after edits
        'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            LOCATE row%, leftCol%, 0
            PRINT st$;
     
        'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        ' Make sure cursor is at the right spot
        'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
            LOCATE row%, leftCol% + charPos% - 1, 1, topScan%, botScan%
     
        LOOP UNTIL done%
 
END SUB

SUB Text.Layout (Array() AS TextObject)
    FOR i = LBOUND(Array) TO UBOUND(Array)
        CALL Font.System(Array(i).Text, Array(i).At.X, Array(i).At.Y, Array(i).Colour)
    NEXT i
END SUB

SUB Text.Layout0 (Array() AS TextObject)
    FOR i = LBOUND(Array) TO UBOUND(Array)
        CALL Font.Regular(Array(i).Text, Array(i).At.X, Array(i).At.Y, Array(i).Colour)
    NEXT i
END SUB

SUB Time.Show (X, Y, Colour)
    Hour = VAL(LEFT$(TIME$, 2))
    IF Hour > 12 THEN
       MER$ = "pm"
    ELSE
       MER$ = "am"
    END IF
    IF Hour > 12 THEN
       Hour = Hour - 12
    ELSE
       IF Hour = 0 THEN
          Hour = 12
       END IF
    END IF
    CALL Font.System(STR$(Hour) + MID$(TIME$, 3, 3) + " " + MER$, X, Y, Colour)
END SUB

SUB Title.Bar13 (Text AS STRING, X, Y, Length) STATIC
    LINE (X, Y)-(X + Length, Y + 24), 1, BF
  
    LINE (X + 8, Y + 12)-(X + Length, Y + 19), 7, BF
    LINE (X, Y + 8)-(X + Length - 4, Y + 15), 15, BF
    CALL Font.System(Text, Center(LEN(Text) * 8, X, X + Length), Y, 14)
END SUB

'WordWrap0
'For this SUB, Text$ passed to it should be dealt with as a buffer
'Position is a changeable next position marker
SUB WordWrap0 (Text$, Position AS Location2D, TextColor, TextField AS Object2D)
    Total1 = ObjectX.Total.Get(TextField) - Position.X
    IF Total1 >= LEN(Text$) THEN
       'You can insert YOUR favorite text delivery system below
       CALL Font.Regular(Text$, TextField.X1 + Position.X, TextField.Y1 + Position.Y, TextColor)
       Position.X = Position.X + LEN(Text$) 'Important this appears before Text$ is Nulled
       Text$ = ""
    ELSE
       FOR i = 0 TO Total1
           IF MID$(Text$, LEN(Text$) - i, 1) = CHR$(32) THEN
              Total2 = Total1 - i
              EXIT FOR
           END IF
       NEXT i
       'You can insert YOUR favorite text delivery system below
       CALL Font.Regular(MID$(Text$, Total2), TextField.X1 + Position.X, TextField.Y1 + Position.Y, TextColor)
       Text$ = MID$(Text$, Total1 + 1)
       Position.X = 0
       IF Y = TextField.Y2 THEN
          Position.Y = 0
       END IF
    END IF
END SUB

