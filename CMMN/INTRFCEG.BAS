DEFINT A-Z
'$INCLUDE: 'C:\HIQB\CMMN\ITEMS.INC'

DECLARE SUB Activate.Gaze (Thing() AS ANY, Building() AS INTEGER)

DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)
DECLARE FUNCTION Value.ShiftDown (Current%, Min%, Max%)
DECLARE FUNCTION Value.ShiftUp (Current%, Min%, Max%)
DECLARE SUB System.Key.Get ()
DECLARE FUNCTION Parse.Gaze% (Thing() AS ANY, Building() AS INTEGER)
DECLARE SUB Prompt.Gaze ()
DECLARE FUNCTION Command.Stairs% (Direction%)

DECLARE FUNCTION Rand% (Value%)

DECLARE FUNCTION CoOrdinates% (X%, Y%, Z%)
DECLARE FUNCTION Prompt.Stairs1% (Direction%)
DECLARE FUNCTION Parse.Stairs% ()
DECLARE SUB Prompt.Stairs (Direction, X, Y, ForeColor)

COMMON SHARED Key$, StatusKey$, KeyVal, KeyInfo

DIM SHARED StairDirect(1 TO 2, 1 TO 2) AS STRING * 6

SUB ActionBox.Sell (Seller$, ItemType$, Item$(), Prices%(), Which%)
    Text.Y = 5
    CALL Font.Regular("Which " + ItemType$ + "...", 25, Text.Y + 0, 3)
    CALL Font.Regular("Item:", 25, Text.Y + 2, 3)
    CALL Font.Regular("GP's", 40, Text.Y + 2, 3)
    
    Max = UBOUND(Item$)
    Min = 0
    FOR I = Max TO 1 STEP -1
    CALL Font.Regular(Item$(I), 25, Text.Y + 3 + (Max - I), 3)
    CALL Font.Regular(STR$(Prices%(I)), 40, Text.Y + 3 + (Max - I), 3)
    NEXT I
    CALL Font.Regular(Item$(0), 25, Text.Y + 3 + Max, 3)
    CALL Font.Regular(STR$(Prices%(0)), 41, Text.Y + 3 + Max, 3)

StartSelection:
    CALL Font.Regular(">", 24, Text.Y + 3 + (Max - Which%), 15)
    CALL System.Key.Get
    SELECT CASE Key$
       CASE "8": GOTO Add1
       CASE "2": GOTO Subtract1
       CASE "RET": EXIT SUB
       CASE "ESC": EXIT SUB
       CASE ELSE: GOTO StartSelection
    END SELECT

Add1:
    CALL Font.Regular(" ", 24, Text.Y + 3 + (Max - Which%), 15)
    Which% = Value.ShiftUp(Which%, Max, Min)
GOTO StartSelection

Subtract1:
    CALL Font.Regular(" ", 24, Text.Y + 3 + (Max - Which%), 15)
    Which% = Value.ShiftDown(Which%, Max, Min)
GOTO StartSelection
END SUB

SUB Activate.Gaze (Thing() AS Dweller, Building() AS INTEGER)
    PRINT
    PRINT "You see ";
    ON Rand(6) GOTO 5900, 5920, 5940, 5960, 6030, 6070

5900
    PRINT "yourself in a bloody mess!"
EXIT SUB

5920
    PRINT "yourself drinking from a pool and becoming "; Thing(12 + Rand(13)).Description; "!"
EXIT SUB

5940
    PRINT Thing(12 + Rand(13)).Description + " gazing back at you!"
EXIT SUB

5960 A = Rand(8)
     B = Rand(8)
     C = Rand(8)
     Q = Building(CoOrdinates(A, B, C))
     PRINT Thing(Q).Description + " at (" + STR$(A) + "," + STR$(B) + ") level" + STR$(C) + "."
EXIT SUB

6030 A = Rand(8)
     B = Rand(8)
     C = Rand(8)
     IF Rand(8) < 4 THEN
    A = Amulet.X
    B = Amulet.Y
    C = Amulet.Z
     END IF
      COLOR 12
      PRINT "The Amulet of Chaos at ("; A; ","; B; ") level"; C; "!"
      COLOR 3
EXIT SUB

6070 PRINT "a soap opera rerun!"

END SUB

SUB Command.Gaze (Thing() AS Dweller, Building() AS INTEGER)
    CALL Prompt.Gaze
    DO
      System.Key.Get
    LOOP UNTIL Parse.Gaze(Thing(), Building())
END SUB

FUNCTION Command.Stairs (Direction)
    CALL Prompt.Stairs(Direction, 24, 6, 15)
    DO
      System.Key.Get
      Command.Stairs = Parse.Stairs
      IF Key$ = "S" THEN EXIT FUNCTION
    LOOP
END FUNCTION

FUNCTION Parse.Gaze (Thing() AS Dweller, Building() AS INTEGER)
      SELECT CASE Key$
         CASE "I"
              Parse.Gaze = True
         CASE "G"
              CALL Activate.Gaze(Thing(), Building())
         CASE ELSE
      END SELECT
END FUNCTION

FUNCTION Parse.Stairs
    IF Key$ = "S" THEN
       EXIT FUNCTION
    END IF
    IF (Key$ = "D" AND (Direction = 1)) OR (Key$ = "U" AND (Direction = 2)) THEN
       Parse.Stairs = 1
       EXIT FUNCTION
    END IF
END FUNCTION

SUB Prompt.Drink (X, Y, ForeColor)
    CALL Font.Regular("Here you discover a fountain,", X, Y, ForeColor)
    CALL Font.Regular("Do you wish to:", X, Y + 1, ForeColor)
    CALL Font.Regular("<D>rink the water, or", X, Y + 2, ForeColor)
    CALL Font.Regular("<I>gnore it.", X, Y + 3, ForeColor)
END SUB

SUB Prompt.Gaze
    CALL Font.Regular("Here you discover an Orb,", 24, 6, 15)
    CALL Font.Regular("Do you wish to:", 24, 7, 15)
    CALL Font.Regular("<G>aze upon it, or", 24, 8, 15)
    CALL Font.Regular("<I>gnore it.", 24, 9, 15)
END SUB

SUB Prompt.Stairs (Direction, X, Y, ForeColor)
    CALL Font.Regular("Here you see stairs going " + StairDirect(Direction, 1) + ",", X, Y, ForeColor)
    CALL Font.Regular("Do you wish to:", X, Y + 1, ForeColor)
    CALL Font.Regular("Go" + StairDirect(Direction, 2) + ", or", X, Y + 2, ForeColor)
    CALL Font.Regular("<S>tay here.", 24, 9, ForeColor)
END SUB

SUB Prompt.Stairs.Init
    StairDirect(1, 1) = "up"
    StairDirect(2, 2) = "<U>p"
    StairDirect(1, 1) = "down"
    StairDirect(2, 2) = "<D>own"
END SUB

