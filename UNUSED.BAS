DECLARE SUB System.Key.Get ()
DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)

DEFINT A-Z
SUB Battle (Party())
    Q1 = 1 + INT(A / 2)
    Q2 = A + 2
    BarterAvailable = True
    IF (Blind = 1) OR (Dexterity < Rand(9) + Rand(9)) GOTO Battle.MonsterAttack
Battle.ReturnFromCheck:
    PRINT
    COLOR 3
    PRINT "You're confronting "; Thing(A + 12).Description; "!"
    PRINT
    PRINT "<A>ttack"
    PRINT "<R>etreat (strongly suggested!)"
    PRINT "Offer <B>ribe"
    PRINT "Cast <S>pell"
    PRINT
    PRINT "Your strength is" + STR$(Strength) + " and your dexterity is" + STR$(Dexterity) + "."
    DO
      System.Key.Get
      SELECT CASE INSTR("ARBS", Key$)
             CASE 1: GOTO Battle.Attack
             CASE 2: GOTO Battle.Retreat
             CASE 3: GOTO Battle.Bribe
             CASE 4: GOTO Battle.Spell
             CASE ELSE
      END SELECT
    LOOP
Battle.Attack:
    IF WeaponsValue = 0 THEN
       CALL Font.Regular("** Pounding on " + Thing(A + 12).Description + " won't hurt it!", 1, 24, 11)
       GOTO Battle.MonsterAttack
    END IF
    IF BookStuck = 1 THEN
       CALL Font.Regular("** You can't kill it with a book, so I suggest you either attack or retreat!", 1, 24, 11)
       GOTO Battle.MonsterAttack
    END IF
    IF Dexterity < Rand(20) + (3 * Blind) THEN
       PRINT
       PRINT "You barely missed the " + Thing(A + 12).Description + "!"
       GOTO Battle.MonsterAttack
    END IF
    Z$ = RIGHT$(Thing(A + 12).Description, LEN(Thing(A + 12).Description) - 2)
    IF LEFT$(Z$, 1) = " " THEN Z$ = MID$(Z$, 2)
       PRINT
       PRINT "A valiant blow, you hit the " + Z$ + "!"
       Q2 = Q2 - WeaponsValue
       IF (A <> 9 AND A <> 12) GOTO Battle.KillMonster
       IF Rand(8) <> 1 GOTO Battle.KillMonster
       PRINT
       COLOR 11
       PRINT "OH NO! Your " + Weapon$(WeaponsValue + 1) + " broke!"
       COLOR 3
       WeaponsValue = 0
Battle.KillMonster:
       IF Q2 > 0 GOTO Battle.MonsterAttack

' IF Order$ = "R" GOTO Attack.MonsterTurn
Battle.Spell:
  IF Intellegence < 15 OR BarterAvailable > 1 THEN
     PRINT
     COLOR 11
     PRINT "** You can't cast a spell now!"
     COLOR 3
     GOTO Battle.ReturnFromCheck
  ELSE
     PRINT
     PRINT "Which spell do you want to cast, W/eb, F/ireball, or D/eathspell?";
     'GOSUB InputGet
     PRINT
     IF Order$ = "W" THEN
        Strength = Strength - 1
        Web.Strength = Rand(8) + 1
        IF Enough(Strength) THEN
           GOTO Battle.MonsterAttack
        ELSE
          'GOTO DeathRoutine
        END IF
     END IF
     IF Order$ = "F" THEN
        q = Rand(7) + Rand(7)
        Strength = Strength - 1
        Intellegence = Intellegence - 1
        'IF (Intellegence < 1) OR (Strength < 1) GOTO DeathRoutine
        PRINT "It does"; q; "points worth of damage."
        PRINT
        Q2 = Q2 - q
        GOTO Battle.KillMonster
     END IF
                 IF Order$ = "D" THEN
                                PRINT "Death is. . . ";
                                IF Intellegence < Rand(4) + 15 THEN
                 PRINT "yours!"
                 Intellegence = 0
                 'GOTO DeathRoutine
                                END IF
                                PRINT "his!"
                                Q2 = 0
                                'GOTO Battle.MonsterDead
                 END IF
                 PRINT
                 COLOR 11
                 PRINT "** Try one of the options given."
                 COLOR 3
                 GOTO Battle.ReturnFromCheck
        END IF

'Note: Treasures Accumulated, Gold possessed, and Charisma
'      all have an effect here
Battle.Bribe:

IF BarterAvailable = False THEN
   PRINT
   COLOR 11
   PRINT "The monster isn't interested."
   COLOR 3
GOTO Battle.ReturnFromCheck

Barter.Option:
  IF TreasuresAccumulated = 0 THEN
     PRINT
     PRINT "All the monster wants is your life!"
     GOTO Battle.MonsterAttack
  END IF

  q = Rand(8)
  IF Treasure(q) > 0 THEN
     PRINT
     PRINT "The monster is interested,"
     PRINT "It wants " + Thing(q + 25).Description + ". Will you give it to him?";
         IF YesNo = 1 THEN
                        Treasure(q) = 0
                        TreasuresAccumulated = TreasuresAccumulated - 1
                        PRINT
                        PRINT "OK, just don't tell anyone else."
                        CanTrade = CanTrade + (Land(CoOrdinates(X, Y, Z)) = 25)
                        'GOTO MainProc
         END IF
                 END IF
END IF

Battle.MonsterAttack:
        BarterAvailable = 2
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
                 GOTO Battle.Retreat
        END IF
        PRINT
        PRINT "The "; Z$; " attacks!"

        IF Dexterity > Rand(7) + Rand(7) + Rand(7) + 3 * Blind THEN
        PRINT
        HIT = INT(RND(0) * 2 + 1)
        ON HIT GOTO B.Miss1, B.Miss2, B.Miss3
B.Miss1:
                 PRINT "The blow barely misses your left leg making sparks a huge dent in the floor!"
        GOTO Battle.Retreat
B.Miss2:
                 PRINT "The "; Z$; " charges at you but you dodge out of the way just in time!"
        GOTO Battle.Retreat
B.Miss3:
                 PRINT "The "; Z$; " just  barely misses your ear!"
        GOTO Battle.Retreat
        END IF

        PRINT
        COLOR 12
        PRINT "Thud! The "; Z$; " hit you!"
        COLOR 3
        q = Q1
        GOSUB Battle.CheckPlayerDamage
        IF Strength < 1 THEN
                 'GOTO DeathRoutine
        END IF

Battle.Retreat:
        PRINT
        PRINT "You have escaped!"
        PRINT
        
Battle.CheckDirectionOfRun:
                 PRINT "Do you want to go North, south, east, or west?";
                 'GOSUB InputGet
                 IF INSTR("NSEW", Order$) = 0 THEN
                 COLOR 11
                 PRINT "** Don't press your luck, "; Race$(RaceCurrent); "!"
                 COLOR 3
                 PRINT
        GOTO Battle.CheckDirectionOfRun
                 END IF
                 'GOTO NewCoordinateNotExit


Battle.CheckPlayerDamage:
        IF ArmorType = 0 THEN
                 'GOTO DecreaseStrength
        END IF
        q = q - ArmorType
        ArmorHitPoints = ArmorHitPoints - ArmorType
        IF q < 0 THEN
                 ArmorHitPoints = ArmorHitPoints - q
                 q = 0
        END IF
        IF ArmourHitPoints < 1 THEN
                 ArmorHitPoints = 0
                 ArmorType = 0
                 PRINT
                 PRINT "Your armor is damaged beyond use . . . good luck!"
        END IF
Battle.DecreaseStrength:
        Strength = Strength - q
RETURN



END SUB

SUB Disease.Blind
    PRINT
    COLOR 11
    PRINT "** You can't see anything "; Race$(RaceCurrent); "!"
    COLOR 3
END SUB

