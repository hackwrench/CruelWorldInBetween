Randomize Timer

Screen 9, 0, 1, 0
DECLARE SUB Races.Init ()
Call Races.Init
CALL Item.Weapons.Init
CALL Item.Armor.Init

CALL Prompt.Spin.Init
CALL Prompt.Stairs.Init
Font.System.Init
System.Key.Clear


DIM ResDir$(0 TO 1)
ON ERROR GOTO Operation.Fail

Operation = 0

Operation.Start:
    Operation = Operation + 1
    ON Operation GOTO InitFileLoad, Load.Font, Load.Block
GOTO EndInitialization

InitFileLoad:
     TempFile = FREEFILE
     OPEN "I", TempFile, "CW.INI"
    CALL Stream.Text.List(ResDir$(), TempFile)
    CLOSE TempFile
RETURN
Load.Font:
    TempFile = FREEFILE
    OPEN "I", TempFile, ResDir$(1) + "INTRO.FON"
    CALL Stream.Text.List(Font$(), TempFile)
    CLOSE TempFile
GOTO Operation.Start

Load.Block:
     OPEN "I", 1, ResDir$(0) + "Chair.asc"
     CALL Block.Get
     GET (0, 0)-(15, 15), Block1%
EndInitialization:

ON ERROR GOTO Objects.FailInit
   CALL Variable.Load(Thing(), ResDir$(1) + "objects.dat")
ON ERROR GOTO 0

ERASE ResDir$

