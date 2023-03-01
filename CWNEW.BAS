DECLARE SUB Races.Init ()
DECLARE SUB Castle.Init ()
DECLARE SUB Room.Empty.Find (Object() AS INTEGER, X%, Y%, Z%)
DECLARE SUB Bazaar.Clear ()
DECLARE SUB Screen.Clean ()
DECLARE SUB ScenicView (Direct%, X%, Y%)
DECLARE SUB Fountain.Drink.Get (Person AS ANY)
DECLARE SUB Potion.Dose.Display (Text$, Dosage%)
DECLARE FUNCTION ExitCastle% (Object AS ANY)
DECLARE SUB PersonShow (Display AS ANY, X%, Y%)
DECLARE SUB PersonMove (OBJImage AS ANY, Area%())
DECLARE FUNCTION Room.IsEmpty% (Object%(), X%, Y%, Z%)
DECLARE FUNCTION Spell.Cast.Menu$ ()
DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)
DECLARE SUB Font.System (Text$, X%, Y%, Colour%)
DECLARE SUB Intro.Game ()
DECLARE SUB Bar.Title (Text AS STRING, X%, Y%, Length%)
DECLARE SUB Block.PSET (BlockList() AS INTEGER, BlockNum%, X%, Y%)
DECLARE SUB Map.GlobalDisplay (Map%(), Thing() AS ANY, Object AS ANY)
DECLARE SUB System.Delay (T!)

DECLARE FUNCTION Value.ShiftDown% (Value%, Min%, Max%)
DECLARE FUNCTION Value.ShiftUp% (Value%, Min%, Max%)

DECLARE SUB System.Key.Get ()
DECLARE SUB Prompt.Stairs (Direction%, X%, Y%, ForeColor%)
DECLARE SUB Prompt.Drink (X%, Y%, ForeColor%)
DECLARE SUB Prompt.Gaze ()
DECLARE SUB ActionBox.Sell (Seller$, ItemType$, Item$(), Prices%(), Which%)
DECLARE SUB BuyItems.Intro (ItemType$)
DECLARE SUB Prompt.Spin (X%, Y%, col%)
DECLARE SUB MasterList ()
DECLARE SUB Teaser ()
'$DYNAMIC
DefInt A-Z

'$INCLUDE: 'LOCATE.INC'
'$INCLUDE: 'CMMN\ITEMS.INC'
'$INCLUDE: 'Declares.BAS'
'$INCLUDE: 'Constant.BAS'
'$INCLUDE: 'Dims.Bas'
'$INCLUDE: 'Inits.bas'

SCREEN 9, 0, 0, 0
CLS

CALL Teaser
CALL Intro.Game

'INITIALIZE ARRAYS
Entrance.X = 3
Entrance.Y = 0
Entrance.Z = 0

NewCastlePositions:
    CALL Castle.Init 'Note: Array Dynamically allocated
    
'Entrance
    Castle(ObjectCoOrdinates(Entrance)) = 2
'Stairs
    FOR Floor = 0 TO 6
        FOR StairsPerFloor = 1 TO 2
            CALL Room.Empty.Find(Castle(), X, Y, Floor)
            Castle(CoOrdinates(X, Y, Floor)) = StairsUp
            Castle(CoOrdinates(X, Y, Floor + 1)) = StairsDn
        NEXT StairsPerFloor
    NEXT Floor
    FOR Z = 0 TO 7
        FOR Q1 = 1 TO 3 'on each floor
            FOR Q = 5 TO 12
                CALL Room.Empty.Find(Castle(), X, Y, Z)
                Castle(CoOrdinates(X, Y, Z)) = Q
            NEXT Q
            Q = 25
            CALL Room.Empty.Find(Castle(), X, Y, Z)
            Castle(CoOrdinates(X, Y, Z)) = Q
        NEXT Q1

        FOR Monsters = 13 TO 24
            CALL Room.Empty.Find(Castle(), X, Y, Z)
            Castle(CoOrdinates(X, Y, Z)) = Monsters
        NEXT Monsters
     NEXT Z

     FOR Q = 26 TO 33
     Z = Rand(8)
     CALL Room.Empty.Find(Castle(), X, Y, Z)
     Castle(CoOrdinates(X, Y, Z)) = Q
     NEXT Q

'The Creature with the Rune staff
     Q = 12 + Rand(12)
     Z = Rand(8)
     CALL Room.Empty.Find(Castle(), X, Y, Z)
     Castle(CoOrdinates(X, Y, Z)) = Q
     FieldStaff.X = X
     FieldStaff.Y = Y
     FieldStaff.Z = Z
 
'The Warp with the Amulet
     Z = Rand(8)
     CALL Room.Empty.Find(Castle(), X, Y, Z)
     Castle(CoOrdinates(X, Y, Z)) = 9
     Amulet.X = X
     Amulet.Y = Y
     Amulet.Z = Z
         
     BookStuck = 0
     ArmorType = 0
     Turn = 1
     CanTrade = 0
     LampFound = 0
     TreasuresAccumulated = 0
     GoldPieces = 60
     RF = 0
     YouHaveAmulet = 0
     Blind = 0
     Intelligence = 8
     Gender = 0
'SetTreasuresPossessedToZero
     FOR Q = 1 TO 8
     Treasure(Q) = 0
     NEXT Q

     CLS

     'CALL Game.Start(Body())
'END
'RaceCurrent = 3
'CALL Id.RaceStats(RaceCurrent)
     ArmorType = 0
     WeaponsValue = 0
     Flares = 0
     Web.Strength = 0
     'CALL WeaponStock.Display

'CALL Character.Init(Body(DarkWarrior), "Dark Warrior", "M", 20, 20, 20)

Bazaar.ListItems:
     CALL BuyItems.Intro("Armor")
     CALL Font.Regular("Plate Mail: 30 Gold pieces", 1, 18, 3)
     CALL Font.Regular("Chainmail: 20 Gold pieces", 2, 19, 3)
     CALL Font.Regular("Leather: 10 Gold pieces", 4, 20, 3)
     CALL Font.Regular("Nothing:  0 Gold pieces", 4, 21, 3)
     CALL Font.Regular("What would you like to buy?", 1, 23, 3)
     DO
     System.Key.Get
     SELECT CASE Key$
        CASE "N"
         EXIT DO
        CASE "P"
         ArmorType = 3
         EXIT DO
        CASE "C"
         ArmorType = 2
         EXIT DO
        CASE "L"
         ArmorType = 1
         EXIT DO
        CASE ELSE
     END SELECT
    LOOP
Bazaar.BoughtArmor:
     ArmorHitPoints = ArmorType * 7
     GoldPieces = GoldPieces - ArmorType * 10
CALL Bazaar.Clear

Bazaar.ListWeaponItems:
     CALL BuyItems.Intro("Weapons")
     CALL Font.Regular("Sword: 30 Gold pieces", 3, 18, 3)
     CALL Font.Regular("Mace: 20 Gold pieces", 4, 19, 3)
     CALL Font.Regular("Dagger: 10 Gold pieces", 2, 20, 3)
     CALL Font.Regular("Nothing: 0 Gold pieces", 1, 21, 3)
     DO
         System.Key.Get
         WeaponsValue = -3 * (Key$ = "S") - 2 * (Key$ = "M") - (Key$ = "D")
         IF Key$ = "N" OR WeaponsValue <> 0 THEN GOTO Bazaar.EndWeaponsValue
     LOOP
CALL Bazaar.Clear

Bazaar.EndWeaponsValue:
     GoldPieces = GoldPieces - WeaponsValue * 10
     IF GoldPieces < 20 THEN GOTO Flares.Buy
     CALL Font.Regular("Would you like to buy a lamp for 20 Gold pieces", 1, CSRLIN, 3)
     IF YesNo = 1 THEN
    LampFound = 1
    GoldPieces = GoldPieces - 20
     END IF
Flares.Buy:
     IF GoldPieces > 0 THEN
    CALL Font.Regular("Flares give off light which allows you to see all the rooms around you.", 1, CSRLIN, 3)
    PRINT
    INPUT "At a cost of 1 Gold piece each, how many do you want to buy"; Order$
    IF Order$ = "" THEN GOTO EndInitialEquip
    Q = VAL(Order$)
    PRINT
    IF Q > 0 OR ASC(Order$) = 48 GOTO Flares.NoAfford
    COLOR 11
    PRINT "** If you don't want any, just type 0."
    COLOR 3
    PRINT
     END IF
GOTO EndInitialEquip


Flares.NoAfford:
    COLOR 11
    IF Q > GoldPieces THEN
         PRINT "You don't have enough Gold Pieces"
         PRINT "You can afford to buy"; GoldPieces; "flares."
         COLOR 3
         PRINT
    END IF
    Flares = Flares + Q
    GoldPieces = GoldPieces - Q
EndInitialEquip:

CALL Screen.Clean
     CALL Bar.Title("Cruel World", 0, 0, 639)

     Body(DarkWarrior).At = Entrance
     X = Body(DarkWarrior).At.X
     Y = Body(DarkWarrior).At.Y
     Z = Body(DarkWarrior).At.Z
     'COLOR 11
     'PRINT "OK, "; Race$(RaceCurrent); ", You are now entering the castle!";
     'COLOR 3

REM
REM   MAIN PROCESSING LOOP
REM

MainProc:
     Body(DarkWarrior).At.X = X
     Body(DarkWarrior).At.Y = Y
     Body(DarkWarrior).At.Z = Z
     
CheckCures:
    IF Blind + Treasure(4) = 2 THEN
         PRINT RTRIM$(Thing(29).Description); " cures your blindness!"
         Blind = 0
    END IF
    IF BookStuck + Treasure(6) = 2 THEN
         PRINT
         PRINT RTRIM$(Thing(31).Description); " dissolves the book!"
         BookStuck = 0
    END IF
    IF Blind = 0 THEN
         CALL Map.GlobalDisplay(Castle(), Thing(), Body(DarkWarrior).At)
         CALL ScenicView(0, 25, 13)
         SELECT CASE Castle(CoOrdinates(X, Y, Z))
                CASE 3
                     CALL Prompt.Stairs(1, 24, 6, 15)
                CASE 4
                     CALL Prompt.Stairs(2, 24, 6, 15)
                CASE 5
                     CALL Prompt.Drink(24, 15, 15)
                CASE 11
                     CALL Prompt.Gaze
                CASE ELSE
         END SELECT
    END IF
     
    DO
        System.Key.Get
        IF (Blind = 0) AND (NOT AlreadyInRoom) THEN
         SELECT CASE Castle(CoOrdinates(X, Y, Z))
                CASE 3
                     Z = Z - Parse.Stairs
                     IF Key$ = "S" THEN AlreadyInRoom = True
                CASE 4
                        Z = Z + Parse.Stairs
                CASE 5
                     GOSUB TakeDrink         'Needs to be replaced Eventually
                CASE 11
                     AlreadyInRoom = Parse.Gaze(Thing(), Castle())
                CASE ELSE
                     GOSUB DonePosition
         END SELECT
        ELSE
        GOSUB DonePosition
        END IF
    LOOP

DonePosition:
     CALL Font.Regular("Command:", 1, 22, 3)
     CALL Prompt.Spin(9, 22, 3)
     SELECT CASE Key$
            CASE "Þ": GOTO AmuletFound
            CASE "F": ON Blind + 1 GOTO Flare.Use, BlindRoutine
            CASE "L": ON Blind + 1 GOTO Lamp.Use, BlindRoutine
            'CASE "M": CALL MasterList
            CASE "O": GOTO Something.Open
            CASE "Q": GOTO QueryEndSession
            CASE ELSE
    END SELECT
     
NewCoordinateNotExit:
     SELECT CASE Key$
            CASE "N", "8"
                 IF ExitCastle(Body(DarkWarrior)) THEN GOTO LeaveCastle
                 Y = Value.ShiftDown(Y, 0, 7)
                 AlreadyInRoom = False
                 RETURN MainProc
            CASE "S", "2"
                 Y = Value.ShiftUp(Y, 0, 7)
                 AlreadyInRoom = False
                 RETURN MainProc
            CASE "E", "6"
                 X = Value.ShiftUp(X, 0, 7)
                 AlreadyInRoom = False
                 RETURN MainProc
            CASE "W", "4"
                 X = Value.ShiftDown(X, 0, 7)
                 AlreadyInRoom = False
                 RETURN MainProc
            CASE ELSE
     END SELECT
RETURN


BlindRoutine:
    PRINT
    COLOR 11
    PRINT "** You can't see anything "; Race$(RaceCurrent); "!"
    COLOR 3
GOTO MainProc

'   DISPLAY ADJACENT ROOM CONTENTS WITH FLARE

Flare.Use:
    IF Flares = 0 THEN
         COLOR 11
         PRINT "** You can't, you're out of flares!"
         COLOR 3
         GOTO MainProc
    END IF
    PRINT
    Flares = Flares - 1
    FOR Q1 = X - 1 TO X + 1
        A = WrapAround(Q1)
        FOR Q2 = Y - 1 TO Y + 1
        B = WrapAround(Q2)
        Q = Castle(CoOrdinates(A, B, Z))
        CALL Font.Regular(" " + Thing(Q).Icon + "   ", 1, CSRLIN, Thing(Q).Colour)
        COLOR 3
        NEXT Q2
    NEXT Q1
GOTO MainProc

REM
REM   DISPLAY CONTENTS OF ADJACENT ROOM WITH LAMP
REM

Lamp.Use:
     IF LampFound = 0 THEN
    CALL Font.Regular("** You don't have a lamp, " + Race$(RaceCurrent) + "!", 1, 24, 11)
    GOTO MainProc
     END IF
     PRINT
     PRINT "Where do you want to shine the lamp (N,S,E,W)";
     GOSUB InputGet
     A = WrapAround(X + (Order$ = "N") - (Order$ = "S"))
     B = WrapAround(Y + (Order$ = "W") - (Order$ = "E"))
     IF X - A + Y - B = 0 THEN
    CALL Font.Regular("** That's not a direction " + Race$(RaceCurrent) + "!", 1, 24, 11)
    GOTO MainProc
     END IF
     PRINT
     PRINT "The lamp shines into ("; A; ","; B; ") level"; Z; "."
     PRINT
     PRINT "There you will find " + RTRIM$(Thing(Castle(CoOrdinates(X, Y, Z))).Description) + "."
GOTO MainProc

REM
REM   TAKE A DRINK FROM A POOL
REM

TakeDrink:
    SELECT CASE Key$
             CASE "I"
                AlreadyInRoom = True
             CASE "D"
                CALL Fountain.Drink.Get(Stats(DarkWarrior))
             CASE ELSE
                RETURN
    END SELECT
RETURN

Something.Open:
     IF Castle(CoOrdinates(X, Y, Z)) = 6 THEN
    PRINT
    PRINT "You open the chest and"
    GOTO 5670
     END IF
     IF Castle(CoOrdinates(X, Y, Z)) = 12 THEN
    PRINT
    PRINT "You open the book and"
    ON Rand(5) GOTO Book.Blind, Book.Poetry, Book.Dexterity, Book.Strength, Book.Stick
Book.Blind:
    COLOR 15
    PRINT "Flash! Oh no! you are now a blind "; Race$(RaceCurrent); "!";
    Blind = 1
GOTO Area.Cleared

Book.Poetry:
    PRINT "It's another volume of Nur£cc's poetry! - YECH!!"
GOTO Area.Cleared

Book.Dexterity:
    PRINT "It's a manual of dexterity!"
    Dexterity = 18
GOTO Area.Cleared

Book.Strength:
    PRINT "It's a manual of strength!"
    Strength = 18
GOTO Area.Cleared

Book.Stick:
    COLOR 11
    PRINT "The book sticks to your hands -"
    PRINT "now you are unable to draw your weapon!"
    COLOR 3
    BookStuck = 1
END IF
 
    PRINT
    COLOR 11
    PRINT "** there is nothing to open here."
    COLOR 3
GOTO MainProc


Area.Cleared:
    Castle(CoOrdinates(X, Y, Z)) = 1
GOTO MainProc


5670 ON Rand(4) GOTO 5680, 5730, 5770, 5730

5680 PRINT
     COLOR 14
     PRINT "KABOOM!";
     COLOR 3
     PRINT " it explodes!!"
     Q = Rand(6)
     GOSUB CheckPlayerDamage
     IF Enough(Strength) THEN
    GOTO Area.Cleared
     ELSE
    GOTO DeathRoutine
     END IF

5730 Q = Rand(1000)
     PRINT "find"; Q; "gold pieces!"
     GoldPieces = GoldPieces + Q
GOTO Area.Cleared

5770 PRINT
     COLOR 5
     PRINT "GAS!!";
     COLOR 3
     PRINT "you stagger from the room!"
     Castle(CoOrdinates(X, Y, Z)) = 1
     Order$ = MID$("NSEW", Rand(4), 1)
     GOTO NewCoordinateNotExit


Teleport:
     IF YouHaveFieldStaff = 0 THEN
    PRINT
    COLOR 11
    PRINT "** You can't teleport without the FieldStaff!"
    COLOR 3
    GOTO MainProc
     END IF
     Z$ = "X-Coordinate"
     GOSUB GetTeleportCoordinates:
     X = Q

     Z$ = "Y-Coordinate"
     GOSUB GetTeleportCoordinates
     Y = Q

     Z$ = "Z-Coordinate"
     GOSUB GetTeleportCoordinates
     Z = Q
     Order$ = "T"
GOTO StatusInfo

REM
REM   DISPLAY STATUS INFORMATION
REM

StatusInfo:
     LOCATE 14, 1
     COLOR 3
     PRINT "Strength ="; Strength; " Intelligence ="; Intelligence; " Dexterity ="; Dexterity
     PRINT "Treasures ="; TreasuresAccumulated; " Flares ="; Flares; " Gold Pieces ="; GoldPieces
     PRINT "Weapon = "; Weapon$(WeaponsValue + 1); "  Armor = "; Armor$(ArmorType + 5);
     IF LampFound = 1 THEN PRINT "  and a lamp"
     PRINT "  Status = ";
     EQUZ = 0
     IF Blind = 1 THEN
    PRINT "Blinded"
    EQUZ = 1
     END IF
     IF BookStuck = 1 THEN
    PRINT "Unable to draw weapon"
    EQUZ = 1
     END IF
     IF EQUZ = 0 THEN PRINT "Normal"
     MAGICAL = 0
     PRINT "You are carrying ";
     IF YouHaveAmulet THEN
    COLOR 12
    PRINT "The Amulet of Chaos"
    COLOR 3
    MAGICAL = 1
     END IF
     IF YouHaveFieldStaff = 1 THEN
    PRINT "The FieldStaff"
    MAGICAL = 1
     END IF
     IF MAGICAL = 0 THEN PRINT "no magical items at the moment"
     QXYZ = 0
     PRINT "The treasures you carry are ";
     FOR Q = 1 TO 8
     IF Treasure(Q) = 1 THEN
        PRINT Thing(Q + 25).Description
        QXYZ = 1
     END IF
     NEXT Q
     IF QXYZ = 0 THEN PRINT "nothing"
     Q = Castle(CoOrdinates(X, Y, Z))
     Z$ = "You now have "
CheckRoom:
    PRINT
    PRINT "Here you find "; RTRIM$(Thing(Q).Description); "."
    IF (Q < 7) OR (Q = 11) OR (Q = 12) GOTO MainProc
    IF Q = 7 THEN
         GoldPieces = GoldPieces + Rand(10)
         PRINT Z$; GoldPieces; "."
         GOTO Area.Cleared
    END IF
    IF Q = 8 THEN
         Flares = Flares + Rand(5)
         PRINT Z$; Flares; "."
         GOTO Area.Cleared
    END IF
    IF Q = 9 THEN
         IF (Amulet.X = X) AND (Amulet.Y = Y) AND (Amulet.Z = Z) THEN
            IF Order$ = "T" THEN GOTO AmuletFound
         END IF
         X = Rand(8)
         Y = Rand(8)
         Z = Rand(8)
        'GOTO StatusInfo
    END IF
    IF Q = 10 THEN
         Z = WrapAround(Z + 1)
         GOTO StatusInfo
    END IF
    IF Q > 25 AND Q < 34 THEN
         PRINT
         PRINT "It's now yours!"
         Treasure(Q - 25) = 1
         TreasuresAccumulated = TreasuresAccumulated + 1
         GOTO Area.Cleared
    END IF
    A = Castle(CoOrdinates(X, Y, Z)) - 12
    Web.Strength = 0
    IF (A < 13) OR (CanTrade = 1) GOTO AttackRoutines

Merchant.Start:
     PRINT
     CALL Font.Regular("You may <T>rade with,", 1, 4, 3)
     CALL Font.Regular("        <A>ttack, or", 1, 5, 3)
     CALL Font.Regular("        <I>gnore the Drow Merchant.", 1, 6, 3)
     DO
         System.Key.Get
         SELECT CASE Key$
            CASE "I": GOTO MainProc
            CASE "A": GOTO Merchant.Attack
            CASE "T": GOTO Merchant.Trade
            CASE ELSE
         END SELECT
     LOOP

Merchant.Attack:
     CanTrade = 1
     PRINT
     CALL Font.Regular("You'll be sorry that you did that!", 1, CSRLIN, 3)
GOTO AttackRoutines

Merchant.Trade:
     FOR Q = 1 TO 8
     A = Rand(Q * 1500)
     IF Treasure(Q) = 1 THEN
        PRINT
        PRINT "Do you want to sell "; Thing(Q + 25).Description; " for "; A; "Gold piece";
        IF YesNo = 1 THEN
             TreasuresAccumulated = TreasuresAccumulated - 1
             Treasure(Q) = 0
             GoldPieces = GoldPieces + A
        END IF
     END IF
     NEXT Q
     PRINT
     CALL Font.Regular("Do you want to ... buy <A>rmor ", 1, CSRLIN, 3)
     IF GoldPieces < 1000 THEN
    PRINT
    PRINT "You're too poor to trade, "; Race$(RaceCurrent); "."
    GOTO MainProc
     END IF
     IF GoldPieces < 1250 GOTO Merchant.BuyStrengthPotion
     PRINT
     PRINT "OK "; Race$(RaceCurrent); ", you have "; GoldPieces; "Gold pieces and "; Armor$(ArmorType + 5); " armor."
7180 PRINT
     CALL BuyItems.Intro("Armor")
     PRINT "Nothing:0 Gold pieces Leather:1250 Gold pieces ";
     IF GoldPieces > 1499 THEN PRINT "Chainmail:1500 Gold pieces ";
     IF GoldPieces > 1999 THEN PRINT "Plate Mail:2000 Gold pieces ";
7240 PRINT
     GOSUB InputPrompt
     PRINT
     IF Order$ = "N" GOTO EndArmorTransaction
     IF Order$ = "L" THEN
    GoldPieces = GoldPieces - 1250
    ArmorType = 1
    ArmorHitPoints = 7
    GOTO EndArmorTransaction
     END IF
     IF Order$ <> "C" OR GoldPieces >= 1500 GOTO 7320
     COLOR 11
     CALL Font.Regular("** You haven't got that much gold on hand!", 1, 24, 11)
     COLOR 3
GOTO 7180

7320 IF Order$ = "C" THEN
    GoldPieces = GoldPieces - 1500
    ArmorType = 2
    ArmorHitPoints = 14
    GOTO EndArmorTransaction
     END IF
     IF Order$ = "P" THEN
    IF GoldPieces < 2000 THEN
         CALL Font.Regular("** You can't afford plate mail!", 1, 24, 11)
         GOTO 7180
    ELSE
         GoldPieces = GoldPieces - 2000
         ArmorType = 3
         ArmorHitPoints = 21
         GOTO EndArmorTransaction
    END IF
     END IF
     PRINT
     COLOR 11
     PRINT "** Choose a selection."
     COLOR 3
GOTO 7240

EndArmorTransaction:
     IF GoldPieces < 1250 GOTO Merchant.BuyStrengthPotion
     PRINT
     PRINT "You have"; GoldPieces; "Gold pieces left with "; Weapon$(WeaponsValue + 1); " in hand."
     PRINT
    
    CALL BuyItems.Intro("Weapons")
    PRINT "Nothing:0 Dagger:1250 Gold pieces";
    PRINT "Mace: 1500 Gold pieces";
    PRINT "Sword:2000 Gold pieces";
    PRINT
    GOSUB InputPrompt
    PRINT
    SELECT CASE Order$
         CASE "N"
         CASE "D"
        IF GoldPieces > 1249 THEN
             GoldPieces = GoldPieces - 1250
             WeaponsValue = 1
        ELSE
             GOTO 7550
        END IF
         CASE "M"
        IF GoldPieces > 1499 THEN
             GoldPieces = GoldPieces - 1500
             WeaponsValue = 2
        ELSE
             GOTO 7550
        END IF
         CASE "S"
        IF GoldPieces > 1999 THEN
             GoldPieces = GoldPieces - 2000
             WeaponsValue = 3
        ELSE
             GOTO 7580
        END IF
         CASE ELSE
        GOTO EndArmorTransaction
    END SELECT
GOTO Merchant.BuyStrengthPotion

7550
     COLOR 11
     PRINT "** Sorry sir, I'm afraid I don't give credit!"
     COLOR 3
GOTO EndArmorTransaction

7580
     COLOR 11
     PRINT "** Your Dungeon Express Card - ";
     PRINT "You left home without it!"
     COLOR 3
GOTO EndArmorTransaction

Merchant.BuyStrengthPotion:
     IF GoldPieces < 1000 GOTO MainProc
    GOSUB PotionTransaction
    IF YesNo = 1 THEN
         GoldPieces = GoldPieces - 1000
         Strength = Value.Limit.Max(Strength + Rand(6), 20)
         CALL Potion.Dose.Display("Strength", Strength)
    END IF

    IF GoldPieces < 1000 GOTO MainProc
    GOSUB PotionTransaction
    IF YesNo = 1 THEN
         GoldPieces = GoldPieces - 1000
         Intelligence = Value.Limit.Max(Intelligence + Rand(6), 20)
         CALL Potion.Dose.Display("Intelligence", Intelligence)
    END IF

    IF GoldPieces < 1000 GOTO MainProc
    GOSUB PotionTransaction
    IF YesNo = 1 THEN
         GoldPieces = GoldPieces - 1000
         Dexterity = Value.Limit.Max(Dexterity + Rand(6), 20)
         CALL Potion.Dose.Display("Dexterity", Dexterity)
    END IF
        
    IF (GoldPieces < 1000) OR (LampFound = 1) GOTO MainProc
    PRINT
    PRINT "Do you want to buy a lamp for 1000 Gold pieces";
    GOSUB InputGet
    IF YesNo = 1 THEN
         GoldPieces = GoldPieces - 1000
         LampFound = 1
         PRINT
         PRINT "It's guaranteed to outlast you!"
     END IF
GOTO MainProc

AttackRoutines:
     Q1 = 1 + INT(A / 2)
     Q2 = A + 2
     Q3 = 1
     IF (Blind = 1) OR (Dexterity < Rand(9) + Rand(9)) GOTO Attack.MonsterTurn
ReturnFromCheck:
     PRINT
     COLOR 3
     PRINT "You're confronting "; Thing(A + 12).Description; "!"
     PRINT
     PRINT "You may attack or retreat (strongly suggested!)."
     IF Q3 = 1 THEN
    PRINT "You can also attempt to bribe the creature."
     END IF
     IF Intelligence > 14 THEN
    PRINT "You can also cast a spell."
     END IF
     PRINT
     PRINT "Your strength is" + STR$(Strength) + " and your dexterity is" + STR$(Dexterity) + "."
     GOSUB InputPrompt
     IF Order$ = "A" THEN
    IF WeaponsValue = 0 THEN
         CALL Font.Regular("** Pounding on " + Thing(A + 12).Description + " won't hurt it!", 1, 24, 11)
         GOTO Attack.MonsterTurn
    END IF
    IF BookStuck = 1 THEN
         CALL Font.Regular("** You can't kill it with a book, so I suggest you either attack or retreat!", 1, 24, 11)
         GOTO Attack.MonsterTurn
    END IF
     END IF
     IF Dexterity < Rand(20) + (3 * Blind) THEN
    PRINT
    PRINT "You barely missed the " + Thing(A + 12).Description + "!"
    GOTO Attack.MonsterTurn
     END IF
     Z$ = RIGHT$(Thing(A + 12).Description, LEN(Thing(A + 12).Description) - 2)
     IF LEFT$(Z$, 1) = " " THEN Z$ = MID$(Z$, 2)
     PRINT
     PRINT "A valiant blow, you hit the " + Z$ + "!"
     Q2 = Q2 - WeaponsValue
     IF (A <> 9 AND A <> 12) THEN GOTO 8410
     IF Rand(8) <> 1 THEN GOTO 8410
     PRINT
     COLOR 11
     PRINT "OH NO! Your " + Weapon$(WeaponsValue + 1) + " broke!"
     COLOR 3
     WeaponsValue = 0
8410 IF Q2 > 0 GOTO Attack.MonsterTurn

MonsterDead:
     PRINT
     PRINT "You kill " + Thing(A + 12).Description + "."
     MonstersKilled = MonstersKilled + 1
     IF X <> FieldStaff.X OR Y <> FieldStaff.Y OR Z <> FieldStaff.Z THEN
    ON (1 - (A = 13)) GOTO Win.Regular, Win.Merchant
     END IF
     PRINT
     COLOR 11
     PRINT "You've found the FieldStaff!";
     COLOR 3
     FieldStaff.X = 0
     YouHaveFieldStaff = 1

Win.Regular:
     Q = Rand(1000)
     PRINT
     PRINT "You now get his hoard of"; Q; "Gold pieces!"
     GoldPieces = GoldPieces + Q
GOTO Area.Cleared

     IF Order$ = "R" GOTO Attack.MonsterTurn
     IF Order$ = "C" THEN
    IF Intelligence < 15 OR Q3 > 1 THEN 'GOTO 8650
         PRINT
         COLOR 11
         PRINT "** You can't cast a spell now!"
         COLOR 3
         GOTO ReturnFromCheck
    ELSE
         Order$ = Spell.Cast.Menu
         GOSUB InputGet
         PRINT
         IF Order$ = "W" THEN
            Strength = Strength - 1
            Web.Strength = Rand(8) + 1
            IF Enough(Strength) THEN
         GOTO Attack.MonsterTurn
            ELSE
         GOTO DeathRoutine
            END IF
         END IF
         IF Order$ = "F" THEN
            Q = Rand(7) + Rand(7)
            Strength = Strength - 1
            Intelligence = Intelligence - 1
            IF (Intelligence < 1) OR (Strength < 1) GOTO DeathRoutine
            PRINT "It does"; Q; "points worth of damage."
            PRINT
            Q2 = Q2 - Q
            GOTO 8410
         END IF
         IF Order$ = "D" THEN
            PRINT "Death is. . . ";
            IF Intelligence < Rand(4) + 15 THEN
         PRINT "yours!"
         Intelligence = 0
         GOTO DeathRoutine
            END IF
            PRINT "his!"
            Q2 = 0
            GOTO MonsterDead
         END IF
         PRINT
         COLOR 11
         PRINT "** Try one of the options given."
         COLOR 3
         GOTO ReturnFromCheck
    END IF
     END IF
     IF Order$ = "B" AND Q3 <= 1 THEN GOTO 8930
     PRINT
     COLOR 11
     PRINT "** Choose one of the options listed."
     COLOR 3
     GOTO ReturnFromCheck
8930 IF TreasuresAccumulated = 0 THEN
    PRINT
    PRINT "All I want is your life!"
    GOTO Attack.MonsterTurn
     END IF

     Q = Rand(8)
     IF Treasure(Q) > 0 THEN
    PRINT
    PRINT "I want " + Thing(Q + 25).Description + ". Will you give it to me?";
    IF YesNo = 1 THEN
         Treasure(Q) = 0
         TreasuresAccumulated = TreasuresAccumulated - 1
         PRINT
         PRINT "OK, just don't tell anyone else."
         CanTrade = CanTrade + (Castle(CoOrdinates(X, Y, Z)) = 25)'IF Merchant Then reactivate trade
         GOTO MainProc
    END IF
     END IF

Attack.MonsterTurn:
    Q3 = 2
    IF Web.Strength > 0 THEN
     Web.Strength = Web.Strength - 1
     IF Web.Strength = 0 THEN
    PRINT
    PRINT "The web just broke!"
     END IF
    END IF
'takes care of two characters
    Z$ = RIGHT$(Thing(A + 12).Description, LEN(Thing(A + 12).Description) - 2)
    'if an takes care of space
    IF LEFT$(Z$, 1) = " " THEN Z$ = MID$(Z$, 2)
    IF Web.Strength > 0 THEN
         PRINT
         PRINT "The "; Z$; " is stuck and can't attack now!"
         GOTO Battle.CheckRun
    END IF
    PRINT
    PRINT "The "; Z$; " attacks!"

     IF Dexterity > Rand(7) + Rand(7) + Rand(7) + 3 * Blind THEN
    PRINT
    HIT = INT(RND(0) * 2 + 1)
    ON HIT GOTO Miss1, Miss2, Miss3
Miss1:
    PRINT "The blow barely misses your left leg making sparks a huge dent in the floor!"
    GOTO Battle.CheckRun
Miss2:
    PRINT "The "; Z$; " charges at you but you dodge out of the way just in time!"
    GOTO Battle.CheckRun
Miss3:
    PRINT "The "; Z$; " just  barely misses your ear!"
    GOTO Battle.CheckRun
     END IF
    PRINT
    COLOR 12
    PRINT "Thud! The "; Z$; " hit you!"
    COLOR 3
    Q = Q1
    GOSUB CheckPlayerDamage
    IF Strength < 1 THEN
         GOTO DeathRoutine
    END IF

Battle.CheckRun:
    IF Order$ <> "R" THEN
         GOTO ReturnFromCheck
    END IF
    PRINT
    PRINT "You have escaped!"
    PRINT
        
Battle.CheckDirection:
    PRINT "Do you want to go North, south, east, or west?";
    GOSUB InputGet
    IF INSTR("NSEW", Order$) = 0 THEN
         COLOR 11
         PRINT "** Don't press your luck, "; Race$(RaceCurrent); "!"
         COLOR 3
         PRINT
         GOTO Battle.CheckDirection
    END IF
GOTO NewCoordinateNotExit

CheckPlayerDamage:
    IF ArmorType = 0 THEN
         Strength = Strength - Q
    ELSE
         Q = Q - ArmorType
         ArmorHitPoints = ArmorHitPoints - ArmorType
         IF Q < 0 THEN
            ArmorHitPoints = ArmorHitPoints - Q
            Q = 0
         END IF
         IF ArmourHitPoints < 1 THEN
            ArmorHitPoints = 0
            ArmorType = 0
            PRINT
            PRINT "Your armor is damaged beyond use . . . good luck!"
         END IF
    END IF
RETURN

QueryEndSession:
        LOCATE 20, 1
        PRINT "Do you really want to quit now?";
        PRINT
        IF YesNo THEN
         'CLS
         'SCREEN 0
         END
        END IF
        COLOR 11
        PRINT "** Then don't say that you do!"
        COLOR 3
GOTO MainProc


DeathRoutine:
    COLOR 3
    PRINT "A noble effort, oh formerly living "; Race$(RaceCurrent); "!"
    PRINT
    PRINT "You died due to lack of ";
    IF Strength < 1 THEN PRINT "Strength."
    IF Intelligence < 1 THEN PRINT "Intelligence."
    IF Dexterity < 1 THEN PRINT "Dexterity."
    PRINT
    Q3 = 1
    PRINT "At the time you died, you had :"
GOTO FinalTotal

LeaveCastle:
    Q3 = 0
    PRINT
    PRINT "You left the castle with";
    IF YouHaveAmulet = 0 THEN PRINT "out";
     PRINT " the Amulet of Chaos."
     PRINT
     IF YouHaveAmulet = 0 THEN
    PRINT
    PRINT "A less than awe-inspiring defeat."
    PRINT
    PRINT "When you left the castle, you had:"
    GOTO FinalTotal
    END IF
    CLS
    COLOR 11
    PRINT "       Ü   Ü  ÜÜÜ   Ü   Ü       Ü   Ü  Ü  Ü   Ü    Ü  Ü"
    PRINT "       ßÜÜÜß Û   Û  Û   Û       Û Ü Û  Û  ÛßÜ Û    Û  Û"
    PRINT "         Û   ßÜÜÜß  ßÜÜÜß        Û Û   Û  Û  ßÛ    Ü  Ü"
    PRINT
    PRINT "An incredibly glorious victory!!!!"
    COLOR 3
    PRINT
    PRINT "In addition, you got out with the following:"

FinalTotal:
    IF Q3 = 0 THEN PRINT "Your miserable life!"
     FOR Q = 1 TO 8
     IF Treasure(Q) = 1 THEN CALL Font.Regular(Thing(Q + 25).Description, 1, CSRLIN, 3)
     NEXT Q
     PRINT Weapon$(WeaponsValue + 1); " and "; Armor$(ArmorType + 5);
     IF LampFound = 1 THEN PRINT " and a lamp";
     PRINT
     PRINT "You also had"; Flares; "flares and"; GoldPieces; "gold pieces"
     IF YouHaveFieldStaff = 1 THEN PRINT "and the FieldStaff"

PlayAgain:
    PRINT
    PRINT " Are you foolish enough to want to play again?";
    PRINT
    IF YesNo = 1 THEN
     PRINT
     PRINT "Some "; Race$(RaceCurrent); "s never learn!"
     PRINT
     PRINT "Please be patient while the castle is restocked."
     PRINT
     GOTO NewCastlePositions
    ELSE
     PRINT
     PRINT "Maybe dumb "; Race$(RaceCurrent); " is not so dumb after all!"
     PRINT
     GOTO EndSession
    END IF


AmuletFound:
    PRINT
    PRINT "Great unmitigated Nur£cc!"
    PRINT
    COLOR 12
    PRINT "You just found The Amulet of Chaos!"
    COLOR 3
    Strength = 18
    Intelligence = 18
    Dexterity = 18
    Chaos = 20000
    BookStuck = 0
    Blind = 0
    YouHaveAmulet = 1
    Amulet.X = 0
GOTO Area.Cleared

Win.Merchant:
    PRINT
    PRINT "You get all his wares :"
    PRINT "Plate mail"
    ArmorType = 3
    ArmorHitPoints = 21
    PRINT "A sword"
    WeaponsValue = 3
    PRINT "A strength potion"
    Strength = Value.Limit.Max(Strength + Rand(6), 20)
    PRINT "An intelligence potion"
    Intelligence = Value.Limit.Max(Intelligence + Rand(6), 20)
    PRINT "A dexterity potion"
    Dexterity = Value.Limit.Max(Dexterity + Rand(6), 20)
    IF LampFound = 0 THEN
     PRINT "A lamp"
     LampFound = 1
    END IF
GOTO Win.Regular

InputPrompt:
    PRINT
    PRINT "Your choice";
InputGet:
    INPUT Order$
    Order$ = UCASE$(Order$)
    Order$ = LEFT$(Order$, 1)
RETURN

GetTeleportCoordinates:
    PRINT Z$;
    INPUT Order$
    Q = INT(VAL(Order$))
    IF Q < 0 AND Q > 9 THEN
     CALL Font.Regular("** Try a number from 1 to 8.", 1, 24, 11)
     GOTO GetTeleportCoordinates
    END IF
RETURN

PotionTransaction:
    PRINT
    PRINT "Do you want to buy a potion of "; Z$; " for 1000 Gold pieces";
GOTO InputGet




EndSession:
END

Complete:
        LOCATE 25, 1
        INPUT "Press return to continue."; QWERTYU$
        CLS
        COLOR 26
        PRINT "  ÜÜ   ÜÜ  Ü   Ü  ÜÜ  ÜÜÜ   ÜÜ  ÜÜÜ  Ü  Ü Ü    ÜÜ  ÜÜÜÜÜ Ü  ÜÜ  Ü   Ü  ÜÜ    Ü"
        PRINT " Û  ß Û  Û ÛÛ  Û Û  ß Û  Û Û  Û Û  Û Û  Û Û   Û  Û   Û   Û Û  Û ÛÛ  Û Û  ß  Û Û"
        PRINT " Û    Û  Û Û Û Û Û    ÛÜÜß ÛÜÜÛ Û  Û Û  Û Û   ÛÜÜÛ   Û   Û Û  Û Û Û Û  ßßÜ  Û Û"
        PRINT " Û  Ü Û  Û Û  ÛÛ Û ßÛ Û ßÜ Û  Û Û  Û Û  Û Û   Û  Û   Û   Û Û  Û Û  ÛÛ Ü  Û   ß"
        PRINT "  ßß   ßß  ß   ß  ßß  ß  ß ß  ß ßßß   ßß  ßßß ß  ß   ß   ß  ßß  ß   ß  ßß    ß"
        COLOR 3
        PRINT
GOTO PlayAgain


Operation.Fail:
    Failed(Operation) = True
RESUME Operation.Start

Objects.FailInit:
    PRINT "Object File OBJECTS.DAT Bad or Missing"
    PRINT "Vital File, Unable to Continue Program"
    PRINT "Press Any Key to Return to Operating System"
    Key$ = ""
    WHILE Key$ = ""
    System.Key.Get
    WEND

REM $STATIC
SUB Bazaar.Clear
    FOR I = 17 TO 21
    LOCATE I, 1
    PRINT SPACE$(30)
    NEXT I
END SUB

SUB Castle.Init
    FOR I = 0 TO 511
        Castle(I) = 0
    NEXT I
END SUB

SUB Character.Init (Object AS Character, Text AS STRING, Gender AS STRING, Ins, Strn, Dex)
    Object.NameIs = Text
    Object.Gender = Gender
    Object.Status.Intelligence = Ins
    Object.Status.Strength = Strn
    Object.Status.Dexterity = Dex
END SUB

FUNCTION ExitCastle (Object AS Appearance)
    SHARED Entrance AS Location3D
    IF Object.At.X = Entrance.X AND Object.At.Y = Entrance.Y AND Object.At.Z = Entrance.Z THEN
         ExitCastle = True
    END IF
END FUNCTION

SUB Fountain.Drink.Get (Person AS Character) STATIC
    PRINT
    PRINT "You take a drink and ";
    Q = Rand(5)
    ON Q + 1 GOTO NothingHappened, ChangeStrength, ChangeIntelligence, ChangeDexterity, ChangeRace, ChangeDevelopment
NothingHappened:
        Q = Rand(2)
        SELECT CASE Q
         CASE 0: PRINT "you gained naught from your drought."
         CASE 1: PRINT "it's only water."
         CASE 2: PRINT "nothing happened."
         CASE ELSE
        END SELECT
EXIT SUB

ChangeStrength:
        Q = Rand(1)
        SELECT CASE Q
         CASE 0
            GOTO MakeStronger
         CASE 1
            GOTO MakeWeaker
         CASE ELSE
        END SELECT

MakeStronger:
     Person.Status.Strength = Value.Limit.Max(Person.Status.Strength + Rand(3), 20)
     PRINT "you feel stronger.";
EXIT SUB

MakeWeaker:
     Person.Status.Strength = Person.Status.Strength - Rand(3)
     PRINT "weaker."
EXIT SUB

ChangeIntelligence:
MakeSmarter:
     Person.Status.Intelligence = Value.Limit.Max(Person.Status.Intelligence + Rand(3), 20)
     PRINT "smarter.";
EXIT SUB

MakeStupider:
     Person.Status.Intelligence = Person.Status.Intelligence - Rand(3)
     PRINT "dumber.";
EXIT SUB

ChangeDexterity:
MakeFaster:
     Person.Status.Dexterity = Value.Limit.Max(Person.Status.Dexterity + Rand(3), 20)
     PRINT "swifter.";
EXIT SUB

MakeClumsier:
     Person.Status.Dexterity = Person.Status.Dexterity - Rand(3)
     PRINT "clumsier."
EXIT SUB

ChangeRace:
     Q = Rand(4)
     IF Q = Person.Status.Race GOTO ChangeRace
     Person.Status.Race = Q
     PRINT "become a "; Race$(Person.Status.Race); "."
EXIT SUB

ChangeDevelopment:
    Q = Rand(2) - 3
    R = Rand(20)
    S = Q * R
    IF S = 0 THEN
         PRINT "you are fortunate to be stiil alive."
    END IF
END SUB

SUB Game.Start (Body() AS Appearance)
    DIM TopX.Window, TopY.Window
    DIM ThroneRoom(8, 8)

    PersonShown = DarkWarrior
    CALL Bar.Title("Cruel World", 0, 0, 639)
    ThroneRoom(3, 4) = 1
    ThroneRoom(5, 4) = 1
    ThroneRoom(3, 5) = 1
    ThroneRoom(4, 5) = 1
    ThroneRoom(5, 5) = 1
    'CALL ScreenAreas.Init
    TopX.Window = 0
    TopY.Window = 48
    'CALL Map.RoomDisplay(ThroneRoom(), TopX.Window, TopY.Window)
    CALL PersonShow(Body(PersonShown), X, Y)
    CALL PersonMove(Body(PersonShown), ThroneRoom())
    Product = 1
    CALL ActionBox.Sell("Bazaar", "Weapons", Weapon$(), BWPrices%(), Product)
END SUB

SUB Id.AspectTotals
END SUB

SUB Id.RaceStats (Q)
    STR = INT(RND * 10 + 2)
    Dex = INT(RND * 10 + 2)
    Strength = STR * Q
    Dexterity = Dex * Q
    IF Strength > 18 THEN Strength = 18
    IF Dexterity > 18 THEN Dexterity = 18
END SUB

SUB Item.Armor.Init
    Armor$(0) = "None"
    Armor$(1) = "Leather"
    Armor$(2) = "Chainmail"
    Armor$(3) = "Plate mail"
END SUB

SUB Item.Weapons.Init
    Weapon$(0) = "Fist"
    Weapon$(1) = "Dagger"
    Weapon$(2) = "Foil"
    Weapon$(3) = "Cutlass"
    Weapon$(4) = "Shortsword"
    Weapon$(5) = "Sai"
    Weapon$(6) = "Masamune"
    Weapon$(7) = "Katana Blade"
    Weapon$(8) = "Chamfer"
END SUB

SUB Map.RoomDisplay (Map%(), PositionX%, PositionY%)
    FOR I = LBOUND(Map%, 1) TO UBOUND(Map%, 1)
    FOR J = LBOUND(Map%, 2) TO UBOUND(Map%, 2)
        ON Map%(I, J) GOSUB ChairBlockD: ', FatherOfJeanny
    NEXT J
    NEXT I
EXIT SUB
ChairBlockD:
     PUT (PositionX% + Mapx16(I), PositionY% + Mapx16(J)), Block1%, PSET
RETURN
END SUB

SUB PersonMove (OBJImage AS Appearance, Area())
    System.Key.Get
    IF INSTR("789", Key$) > 0 THEN
         IF Y = 0 THEN
        Y = 15
         ELSE
        Y = Y - 1
         END IF
    END IF
    IF INSTR("741", Key$) > 0 THEN
         IF X = 0 THEN
        X = 15
         ELSE
        X = X - 1
         END IF
    END IF
    IF INSTR("123", Key$) > 0 THEN Y = (Y + 1) MOD 16
    IF INSTR("963", Key$) > 0 THEN X = (X + 1) MOD 16
END SUB

SUB PersonShow (Display AS Appearance, X, Y)
    ON Display.Identifies GOTO DarkWarrior.Show, Arlyn.Show, SimonExpo.Show, CrystaJet.Show

DarkWarrior.Show:
     SELECT CASE Display.Direction
        CASE 1:
         PUT (Mapx16(Display.At.X), Mapx16(Display.At.Y)), DarkWarriorEast%
        CASE 2:
        CASE 3:
        CASE 4:
        CASE ELSE
     END SELECT
Arlyn.Show:
SimonExpo.Show:
CrystaJet.Show:
END SUB

SUB Potion.Dose.Display (Text$, Dosage)
    PRINT "Your "; Text$; " is now"; Dosage; "."
END SUB

SUB Races.Init
    Race$(1) = "Hobbit"
    Race$(2) = "Elf"
    Race$(3) = "Human"
    Race$(4) = "Dwarf"
END SUB

SUB Room.Display (Object() AS INTEGER, BitmapGroup() AS INTEGER, X, Y)
    TempX = LBOUND(Object, 1)
    TempY = LBOUND(Object, 2)
    FOR I = TempX TO UBOUND(Object, 1)
        FOR J = TempY TO UBOUND(Object, 2)
            CALL Block.PSET(BitmapGroup(), Object(I, J), X + (I - TempX) * 8, Y + (J - TempY) * 8)
        NEXT J
    NEXT I
END SUB

SUB Room.Empty.Find (Object() AS INTEGER, X, Y, Z)
    DO
        X = Rand(8)
        Y = Rand(8)
    LOOP WHILE NOT Room.IsEmpty(Object(), X, Y, Z)
END SUB

FUNCTION Room.IsEmpty (Object(), X, Y, Z)
    Room.IsEmpty = (Object(CoOrdinates(X, Y, Z)) = 0)
END FUNCTION

SUB ScenicView (Direct, X, Y) STATIC
    LOCATE Y, X
    IF Direct <> 0 THEN Q = Direct: GOTO Directed
     
    IF Rand(4) > 1 THEN
         EXIT SUB
    END IF
    Q = Rand(7) + Blind + 1
    IF Q > 7 THEN Q = 4
Directed:
    SceneTxt$ = "You "
    ON Q GOSUB SightBat, HearNoise, Sneeze, StepOnDragon, HearMonster, BeingWatched, HearRustling
EXIT SUB

StepOnDragon:
     SceneTxt$ = SceneTxt$ + "stepped on dragon @#*%!"
     PRINT SceneTxt$
RETURN

HearNoise:
     SceneTxt$ = SceneTxt$ + "hear "
     ON Rand(4) GOTO Noise.Scream, Noise.Footsteps, Noise.Wumpus, Noise.Groans
            
Noise.Scream:
     SceneTxt$ = SceneTxt$ + "a scream!"
     PRINT SceneTxt$
     FOR I = 2075 TO 1800 STEP -1
     SOUND I, .001
     NEXT I
     SOUND 32729, 1
RETURN

Noise.Footsteps:
     SceneTxt$ = SceneTxt$ + "footsteps!"
     PRINT SceneTxt$
     FOR I = 40 TO 37 STEP -1
    SOUND J, 1
    SOUND 32729, 10
     NEXT I
RETURN

Noise.Wumpus:
     SceneTxt$ = SceneTxt$ + "a Wumpus!"
     PRINT SceneTxt$
     PLAY "O0MST255L4AGP5AGP5AGP5AG"
RETURN

HearMonster:
     SceneTxt$ = SceneTxt$ + "hear " + RTRIM$(Thing(12 + Rand(13)).Description) + " growling!"
     GOTO Noise.Monster
Noise.Groans:
     SceneTxt$ = SceneTxt$ + "groans!"
Noise.Monster:
     PRINT SceneTxt$
     FOR I = 300 TO 37 STEP -1
         SOUND I, .1
     NEXT I
RETURN

Sneeze:
     SceneTxt$ = SceneTxt$ + "sneezed!"
     PRINT SceneTxt$
RETURN

SightBat:
     SceneTxt$ = SceneTxt$ + "see a bat fly by!"
     PRINT SceneTxt$
     FOR I = 12000 TO 1400 STEP -100
     SOUND I, .1
     NEXT I
RETURN


BeingWatched:
     SceneTxt$ = SceneTxt$ + "feel like you're being watched!"
     PRINT SceneTxt$
RETURN

HearRustling:
     SceneTxt$ = SceneTxt$ + "hear faint rustling noises!"
     PRINT SceneTxt$
     FOR Q = 1 TO 200
     A = INT(RND * 50 + 37)
     SOUND A, .001
     NEXT Q
     SOUND 32729, 1
RETURN
END SUB

SUB Screen.Clean
    LINE (0, 42)-(639, 349), 0, BF
END SUB

SUB Screen.Flash STATIC
    LINE (0, 0)-(639, 349), 8, BF
    LINE (0, 0)-(639, 349), 7, BF
    LINE (0, 0)-(639, 349), 0, BF
END SUB

SUB Screen.Main (X, Y) STATIC
'C
    CIRCLE (100 + X, 32 + Y), 32, 14, 1.4, 5, .8
    CIRCLE (100 + X, 32 + Y), 26, 8, 3, 5, .8

'r
    LINE (120 + X, 60 + Y)-(120 + X, 30 + Y), 15
    LINE (127 + X, 60 + Y)-(127 + X, 39 + Y), 8
    CIRCLE (135 + X, 45 + Y), 20, 14, 1, 2

'u
    CIRCLE (175 + X, 28 + Y), 32, 14, 4, 5.4, 1.4
    CIRCLE (175 + X, 28 + Y), 26, 8, 4.2, 5.2, 1.4
    LINE (160 + X, 30 + Y)-(160 + X, 52 + Y), 14
    LINE (190 + X, 30 + Y)-(190 + X, 52 + Y), 14
    LINE (165 + X, 30 + Y)-(165 + X, 50 + Y), 8

'e
    LINE (210 + X, 45 + Y)-(230 + X, 45 + Y), 15
    LINE (215 + X, 40 + Y)-(232 + X, 40 + Y), 8
    LINE -(238 + X, 40 + Y), 14
    CIRCLE (220 + X, 45 + Y), 20, 14, .4, 5.2
    CIRCLE (220 + X, 45 + Y), 15, 8, .7, 5.2

'l
    LINE (260 + X, 60 + Y)-(260 + X, 10 + Y), 15
    LINE (267 + X, 60 + Y)-(267 + X, 19 + Y), 8

'W
    LINE (100 + X, 100 + Y)-(120 + X, 160 + Y), 15
    LINE -(140 + X, 100 + Y), 15
    LINE -(160 + X, 160 + Y), 15
    LINE -(180 + X, 100 + Y), 15
    LINE (90 + X, 100 + Y)-(110 + X, 160 + Y), 14
    LINE (120 + X, 130 + Y)-(130 + X, 100 + Y), 8
    LINE (160 + X, 130 + Y)-(170 + X, 100 + Y), 8
    
'o
    CIRCLE (195 + X, 145 + Y), 16, 14, , , 1
    CIRCLE (195 + X, 145 + Y), 10, 8, 5, 1.8, 1

'r
    LINE (220 + X, 160 + Y)-(220 + X, 130 + Y), 15
    LINE (227 + X, 160 + Y)-(227 + X, 139 + Y), 8
    CIRCLE (235 + X, 145 + Y), 20, 14, 1, 2

'l
    LINE (260 + X, 160 + Y)-(260 + X, 110 + Y), 15
    LINE (267 + X, 160 + Y)-(267 + X, 119 + Y), 8
    
'd
    CIRCLE (295 + X, 145 + Y), 16, 14, 1.1, 5.2, 1
    CIRCLE (295 + X, 145 + Y), 10, 8, 5, 1.8, 1
    LINE (310 + X, 160 + Y)-(310 + X, 110 + Y), 15
    LINE (317 + X, 160 + Y)-(317 + X, 119 + Y), 8
END SUB

SUB ScreenAreas.Init
    'CALL Map.RoomClear(0, 48)
    'CALL ActionBox.Clear
END SUB

FUNCTION Spell.Cast.Menu$
    PRINT "Which spell do you wish to cast, W/eb, F/ireball, or D/eathspell?";
    DO
        System.Key.Get
        SELECT CASE Key$
         CASE "W", "F", "D", "ESC"
            Spell.Cast.Menu = Key$
            EXIT FUNCTION
         CASE ELSE
        END SELECT
    LOOP
END FUNCTION

SUB Status.Show (Person AS Character)
    LOCATE 14, 1
    COLOR 15, 0
    PRINT Person.NameIs
    PRINT "Strength: "; Person.Status.Strength; " Intelligence:"; Person.Status.Intelligence; " Dexterity:"; Person.Status.Dexterity
    PRINT " Weapon: "; Weapon$(WeaponType); "  Armor: "; Armor$(ArmorType);
    PRINT "  Status: ";
    EQUZ = 0
    IF Blind = 1 THEN
         PRINT "Blinded"
         EQUZ = 1
    END IF

    IF BookStuck = 1 THEN
         PRINT "Unable to draw weapon"
         EQUZ = 1
    END IF
    IF EQUZ = 0 THEN PRINT "Normal"
END SUB

SUB Teaser
    Temp$ = "Stay with me..."
    CALL Font.System(Temp$, 0, 342, 8)
    CALL System.Delay(.2)
    CALL Font.System(Temp$, 0, 342, 0)
    Temp$ = ""
END SUB

SUB WeaponStock.Display
    Text.Y = 5
    CALL Font.Regular("Weapons for Sale", 25, Text.Y + 0, 3)
    CALL Font.Regular("Item", 25, Text.Y + 2, 3)
    CALL Font.Regular("GP's", 40, Text.Y + 2, 3)
    CALL Font.Regular("Plate Mail", 25, Text.Y + 3, 3)
    CALL Font.Regular("30", 40, Text.Y + 3, 3)
    CALL Font.Regular("Chain Mail", 25, Text.Y + 4, 3)
    CALL Font.Regular("20", 40, Text.Y + 4, 3)
    CALL Font.Regular("Leather", 25, Text.Y + 5, 3)
    CALL Font.Regular("10", 40, Text.Y + 5, 3)
    CALL Font.Regular("Nothing", 25, Text.Y + 6, 3)
    CALL Font.Regular("0", 41, Text.Y + 6, 3)
END SUB
'$INCLUDE: 'CMMN\SPNPRMPT.BAS'

