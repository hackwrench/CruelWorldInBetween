DEFINT A-Z
DECLARE FUNCTION Scroll.Pos.Calc% (ListSize%, PosTotal%, currentPos%)
DECLARE SUB MakeWindow (topRow%, leftCol%, botRow%, rightCol%, foreColor%, backColor%, windowType%, frameType%, shadowColor%, explodeType%, label$)
DECLARE SUB QBPrint (st$, row%, col%, fore%, back%)
DECLARE SUB Font.Regular (TEXT$, X%, Y%, Colour%)

DEFSNG A-Z
'This function accepts a list of string items and from it creates a
'scrolling list.
'
'Parameters:
'
'    list$() - an array containing the list of items to scroll through
'    listLen% - the number of items in the list
'    maxWidth% - the width of the widest entry in the list
'    topRow% - the top-most screen row of the list
'    botRow% - the bottom-most screen row of the list
'    leftCol% - the left-most screen column of the list
'    fg% - Foreground color of text in the list
'    bg% - Background color of text in the list
'    frameType% - Type of window frame to use.
'    explode% - Explode mode to use for window.
'    shadow% - Shadow type for main window.
'    label$ - Text label for window.
SUB List.Display (List$(), listLen%, maxWidth%, topRow%, botRow%, leftCol%, fg%, bg%, frameType%, explode%, shadow%, label$)
  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  ' Set up our top, bottom, and highlight pointers for the list, as well as
  ' the starting point for the scroll bar elevator.
  '
  '  - topPtr% will maintain the top of the screen position in the overall
  '    list.  Values will range from 1 to numItems%-numPerScreen%.
  '  - botPtr% will maintain the bottom of the screen position in the overall
  '    list.  Values will range from numPerScreen% to numItems%.
  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
    numPerScreen% = botRow% - topRow% + 1
    topPtr% = 1   'maintains the top screen position for the list
    botPtr% = numPerScreen%
    elevatorPos% = 1
 
  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  ' Calculate and display a box AROUND the list.
  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  MakeWindow topRow% - 1, leftCol% - 1, botRow% + 1, leftCol% + maxWidth% + 2, fg%, bg%, 0, frameType%, shadow%, explode%, label$

  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  ' Build a scroll bar for the window.  The variable 'ElevatorPosTotal%'
  ' stores the number of possible elevator positions on the scroll bar.
  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  COLOR fg%, bg%
  IF (botRow% - topRow%) + 1 >= 2 THEN
     ScrollBarFlag% = TRUE
     FOR i% = topRow% + 1 TO botRow% - 1
         LOCATE i%, leftCol% + maxWidth% + 2, 0
         PRINT CHR$(177);
     NEXT i%
     ElevatorPosTotal% = (botRow% - 1) - (topRow% + 1) + 1
     COLOR , bg%
     Font.Regular CHR$(30), leftCol% + maxWidth% + 2, topRow%, fg%
     Font.Regular CHR$(31), leftCol% + maxWidth% + 2, botRow%, fg%
     Font.Regular CHR$(219), leftCol% + maxWidth% + 2, topRow% + 1, fg%
  END IF

  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  ' Display first screen's worth of entries
  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
    COLOR fg%, bg%
    FOR i% = 1 TO (botRow% - topRow%) + 1
      LOCATE topRow% + i% - 1, leftCol% + 1, 0
      PRINT List$(i%);
    NEXT i%

  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
  ' Sit in a loop whle the user hits keys.  If the ESC key is hit, then set
  ' function to NULL string and exit.
  '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
    updateList% = FALSE
    done% = FALSE
    MouseButtonPressInfo RIGHTBUTTON, rmCnt%, mx%, my%
    MouseButtonPressInfo LEFTBUTTON, lmCnt%, mx%, my%
    DO

    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
    ' Get a key from the user
    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      k$ = ""
      lmCnt% = 0
      rmCnt% = 0
      IF useMouse% THEN

      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      ' Determine the status of the mouse buttons, as well as position, if
      ' a button was down.
      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
        MouseButtonStatus lmCnt%, rmCnt%, bc%
        IF lmCnt% OR rmCnt% THEN
          MousePosition mx%, my%
        END IF

      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      ' Did we have any left mouse button presses?  If not, check the
      ' keyboard for input.
      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
        IF lmCnt% = 0 THEN
          k$ = UCASE$(INKEY$)
        END IF
      ELSE

      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      ' No mouse available, so wait for keyboard input.
      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
        WHILE k$ = ""
          k$ = UCASE$(INKEY$)
        WEND
      END IF

    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
    ' If left mouse was clicked, then see if it was clicked on certain
    ' "hot spots" we understand.
    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      IF (lmCnt%) THEN

      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      ' Convert virtual screen mouse coordinates to real 80x25 coordinates.
      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
        mx% = (mx% / 8) + 1
        my% = (my% / 8) + 1

      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      ' Check to see if the left button was clicked on the up arrow part
      ' of the scroll bar.  Is so, decrement the pointers.
      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
        IF (my% = topRow%) AND (mx% = leftCol% + maxWidth% + 2) THEN
          k$ = UpArrowKey$
        END IF

      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      ' Now check to see if the left button was clicked on the down arrow part
      ' of the scroll bar.  Is so, increment the pointers.
      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
        IF (my% = botRow%) AND (mx% = leftCol% + maxWidth% + 2) THEN
          k$ = DownArrowKey$
        END IF

      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      ' If the left mouse button was clicked on the scroll bar itself, then
      ' execute a PgUp or PgDn, based on where the elevator is.
      '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
        IF (mx% = leftCol% + maxWidth% + 2) AND (my% < elevatorPos% + (topRow% - 1)) AND (my% >= topRow% + 1) THEN
          k$ = PgUpKey$
        END IF
        IF (mx% = leftCol% + maxWidth% + 2) AND (my% > elevatorPos% + (topRow% - 1)) AND (my% <= botRow% - 1) THEN
          k$ = PgDnKey$
        END IF
      END IF

    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
    ' If the right mouse button was pressed, then get outta here.  First,
    ' though, just to be tidy, we're going to drain that right button press
    ' from the mouse click buffer.
    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      IF (rmCnt%) THEN
        MouseButtonPressInfo RIGHTBUTTON, rmCnt%, mx%, my%
        done% = TRUE
      END IF

    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
    ' Decide what to do based on the user's keystroke
    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      SELECT CASE k$

      CASE UpArrowKey$             ' Move list up one
        IF (topPtr% > 1) THEN
          topPtr% = topPtr% - 1
          botPtr% = botPtr% - 1
          ' botPtr% = topPtr% + (botRow% - topRow%)
          updateList% = TRUE
        END IF

      CASE DownArrowKey$           ' Move list down one
        IF (botPtr% < listLen%) THEN
          botPtr% = botPtr% + 1
          topPtr% = topPtr% + 1
          updateList% = TRUE
        END IF

      CASE PgUpKey$                ' Move up one screen's worth
        IF topPtr% > (botRow% - topRow%) THEN         ' Got a whole screen's worth?
          topPtr% = topPtr% - (botRow% - topRow%)
          botPtr% = botPtr% - (botRow% - topRow%)
          updateList% = TRUE
        ELSE
          topPtr% = 1
          botPtr% = (botRow% - topRow%) + 1
          updateList% = TRUE
        END IF

      CASE PgDnKey$, enter$        ' Move down one screen's worth
        IF botPtr% <= listLen% - (botRow% - topRow%) THEN            ' Got a whole screen's worth?
          topPtr% = topPtr% + (botRow% - topRow%)
          botPtr% = botPtr% + (botRow% - topRow%)
          updateList% = TRUE
        ELSE    ' --- No
          topPtr% = listLen% - (botRow% - topRow%)
          botPtr% = listLen%
          updateList% = TRUE
        END IF

      CASE HomeKee$             ' Move to top of overall list
        IF (topPtr% > 1) THEN
          topPtr% = 1
          botPtr% = (botRow% - topRow%) + 1
          updateList% = TRUE
        END IF

      CASE EndKee$              ' Move to bottom of overall list
        IF (botPtr% < listLen%) THEN
          topPtr% = listLen% - (botRow% - topRow%)
          botPtr% = listLen%
          updateList% = TRUE
        END IF

      CASE esc$ ' User wants out
        done% = TRUE

      CASE ELSE ' Invalid key was hit
        IF k$ <> "" THEN
          PLAY errorTone$
        END IF

      END SELECT

    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
    ' If required, update the scroll bar display.
    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      IF (ScrollBarFlag%) AND (updateList%) THEN
        IF useMouse% THEN
          MouseHide
        END IF
        FOR i% = topRow% + 1 TO botRow% - 1
          LOCATE i%, leftCol% + maxWidth% + 2, 0
          PRINT CHR$(177);
        NEXT i%
        elevatorPos% = CalcScrollPos%(listLen% - (botPtr% - topPtr%), ElevatorPosTotal%, topPtr%)
        QBPrint CHR$(219), topRow% + elevatorPos%, leftCol% + maxWidth% + 2, fg%, bg%
      END IF

    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
    ' If required, update the display.
    '컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
      IF updateList% THEN
        IF useMouse% THEN
          MouseHide
        END IF
      ' Update the list
        COLOR fg%, bg%
        FOR i% = topPtr% TO botPtr%
          LOCATE topRow% + i% - topPtr%, leftCol%, 0
          PRINT LEFT$(" " + List$(i%) + SPACE$(maxWidth%), maxWidth% + 1) + " ";
        NEXT i%
        updateList% = FALSE
      END IF

    LOOP UNTIL done%

END SUB

