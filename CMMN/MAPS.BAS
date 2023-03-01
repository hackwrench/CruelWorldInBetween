DEFINT A-Z
'$INCLUDE: 'C:\HIQB\CMMN\LOCATE.INC'
'$INCLUDE: 'C:\HIQB\CMMN\ITEMS.INC'

DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)
DECLARE SUB Map.GlobalDisplay (Map%(), Thing() AS ANY, Object AS ANY)
DECLARE FUNCTION CoOrdinates% (X%, Y%, Z%)
DECLARE FUNCTION ObjectCoOrdinates% (Object AS ANY)
DECLARE FUNCTION WhereIAm$ (Object AS ANY)
DECLARE FUNCTION Player.At% (MapArray%(), PlayerChar%, CurXLoc%, CurYLoc%)
DECLARE FUNCTION Flags.Check% (FlagArray%())
DECLARE FUNCTION Map.Item% (MapArray%(), X%, Y%)

SUB Box.Map.Clear (MapArray%(), X%, Y%)
'This loop prints nothing but blank spaces in place of the map dimensions on
'the screen.  It has no effect on the array itself.
'This SUB clears the area where the map is displayed.
    FOR I% = LBOUND(MapArray%) TO UBOUND(MapArray%)
        FOR J% = LBOUND(MapArray%, 2) TO UBOUND(MapArray%, 2)
            LOCATE Y% + J%, X% + I%: PRINT CHR$(32);
            LOCATE Y% + J%, X% + I%: PRINT CHR$(32);
        NEXT J%
    NEXT I%
END SUB

FUNCTION CoOrdinates (X, Y, Z)
    CoOrdinates = 64 * Z + 8 * X + Y
END FUNCTION

FUNCTION Flags.Check% (FlagArray%())
'This function checks to see if any BOOLEANS in the FlagArray% are FALSE.
'If any ARE FALSE, then the function's value is set to FALSE, indicating that
'the user has not completed all the goals required of the the game/program.
'However, if the array contains all TRUEs, then the function's value is set
'to TRUE, and the game/program can trigger the ending sequence
'or whatever you decide to do.
'Parameters:
'-----------
'FlagArray%() -  The array containing nothing but boolean values which
'                indicated whether a user has completed a certain goal or
'                passed certain reqiurements.
'
'This FOR..NEXT loop goes from the lowest subscript of the FlagArray%()
'to the highest subscript of the FlagArray%(), checking to see if just
'one is false.  If one is false, the loop will stop.
    FOR X% = LBOUND(FlagArray%) TO UBOUND(FlagArray%)
        IF FlagArray%(X%) = FALSE THEN 'we find a FALSE in FlagArray
           Flags.Check = FALSE         'Set the function = FALSE (0)
           EXIT FUNCTION               'and return
        ELSE
           Flags.Check = TRUE          'If no FALSEs were found, return
        END IF                         'the value TRUE (-1).
    NEXT X%
END FUNCTION

SUB Flags.Game.Init (FlagArray%())
'This SUB Initializes a boolean flag array to all FALSE. A boolean flag array
'can be used to detemine when certain tasks are completed throughout a game.
'Parameters:
'-----------
'FlagArray%() -  The array that will contain BOOLEANS to check if any task
'                has NOT been completed before allowing you to complete
'                your mission and show the "YOU'VE WON" message.
'Cycle thru the FlagArray%()
   FOR X% = LBOUND(FlagArray%) TO UBOUND(FlagArray%)
       FlagArray%(X%) = FALSE       'Initial everything to FALSE
   NEXT X%
END SUB

DEFSNG A-Z
SUB Item.Get (MapArray%(), InventArray%(), XLoc%, YLoc%)
'This SUB gets an item defined in MapArray%() and places it in the
'Inventory list array.
'
'Parameters:
'-----------
'
'MapArray%()    -  You should be familiar with what this is by now.
'InventArray%() -  The Inventory array that will contain all possible items
'                  you can obtain from the MapArray%() (Since we used ASCII
'                  values of certain characters in the MapArray%() to denote
'                  items (look at the DATA statements again!), these values
'                  will indicate exactly what item was picked up on the
'                  "map."
'XLoc%          - Current X-Axis location on map.
'YLoc%          -- Current Y-Axis location on map.
'This loop searches for an available slot in the InventArray%() (An available
'slot is indicated by a 0 value). If it finds an empty slot (a ZERO (0)),
'then it places the ASCII value of the item from the MapArray%() into the
'inventory at whatever Index% had the ZERO (0). This way, the inventory
'regulates itself, rather than you regulating the inventory.
'There is no checking to see if the inventory is full. If you wish, you can
'check by converting this into a function.  If there is space in your
'inventory, it will return TRUE, and place the item somewhere in the
'inventory array.  If there isn't any room, then it'll return FALSE.
    FOR I% = LBOUND(InventArray%) TO UBOUND(InventArray%)
        IF InventArray%(I%) = 0 THEN  'found an empty slot in inventory
           'Put the item at (XLoc%, YLoc%) in the MapArray%() into
           'our inventory
           InventArray%(I%) = MapArray%(XLoc%, YLoc%)
           'then exit the loop. We don't want to fill up EVERY
           'empty slot with one item do we?
           EXIT FOR
        END IF
    NEXT I%
    MapArray%(XLoc%, YLoc%) = 0 'Item is no longer on map
END SUB

DEFINT A-Z
SUB Map.GlobalDisplay (Map(), Thing() AS Dweller, Object AS Location3D)
    FOR I = 0 TO 7
        LOCATE I + 5, 25
        FOR J = 0 TO 7
            Q = Map(CoOrdinates(J, I, Object.Z))
            
            IF I = Object.Y AND ((J = Object.X) OR (J = Object.X + 1)) THEN
               CALL Font.Regular("|", POS(0), CSRLIN, 15)
            ELSE
               CALL Font.Regular("|", POS(0), CSRLIN, 7)
            END IF
            CALL Font.Regular(Thing(Q).Icon, POS(0), CSRLIN, Thing(Q).Colour)
        NEXT J
        IF I = Object.Y AND (Object.X = 7) THEN
           CALL Font.Regular("|", POS(0), CSRLIN, 15)
        ELSE
           CALL Font.Regular("|", POS(0), CSRLIN, 7)
        END IF

    NEXT I
    CALL Font.Regular(WhereIAm(Object), 25, 12, 2)
END SUB

FUNCTION Map.Item% (MapArray%(), X%, Y%)
'This FUNCTION detects what the present (X%,Y%) location has in it.
'It is used to detect walls, items, people, etc.
'Separate Arrays can be set up for items, monsters, walls, etc
'Parameters:
'-----------
'
'MapArray%() -- The array containing a map..
'
'X%, Y%      -- The X and Y coordinates of where the user is in respect to
'               the map dimensions.
Map.Item = MapArray%(X%, Y%)    'return whatever item is on this grid
END FUNCTION

FUNCTION ObjectCoOrdinates (Object AS Location3D)
    ObjectCoOrdinates = CoOrdinates(Object.X, Object.Y, Object.Z)
END FUNCTION

FUNCTION Player.At% (MapArray%(), PlayerChar%, CurXLoc%, CurYLoc%)
'This function detects the user's starting point in the array. In this
'example, it is (8,9).
'
'Parameters:
'-----------
'MapArray%()  - The 2-D Map being looked at.
'
'PlayerChar%  - ASCII character value used for player in grid.
'
'CurXLoc%     - Current X Location. Wherever player is on the X-Axis in the
'               grid.  This value is returned.
'
'CurYLoc%     - Current Y Location. Wherever you are on the Y-Axis in the
'               grid.  This value is returned.
'
'Player.At  - This function will return a TRUE (-1) if the player has been
'               found in the grid, and FALSE if it has not.
'This FOR loop loops until it reaches the Upper bound of the X-Axis.  It's
'looking for PlayerChar%. If it matches, it retrieves the X,Y location
'of where it was found.
    FOR X% = LBOUND(MapArray%) TO UBOUND(MapArray%)
        FOR Y% = LBOUND(MapArray%, 2) TO UBOUND(MapArray%, 2)
            IF MapArray%(X%, Y%) = PlayerChar% THEN
               CurXLoc% = X%
               CurYLoc% = Y%
               Player.At = TRUE
               EXIT FUNCTION
        END IF
   NEXT Y%
  NEXT X%
  Player.At = FALSE
'If here, then the FOR loop finished, and it could not find PlayerChar
'anywhere in the array.
END FUNCTION

FUNCTION WhereIAm$ (Object AS Location3D)
    WhereIAm = "You are at (" + STR$(Object.X) + "," + STR$(Object.Y) + ") level" + STR$(Object.Z + 1) + "."
END FUNCTION

