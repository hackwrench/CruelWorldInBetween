DEFINT A-Z

DECLARE SUB Show ()
DECLARE SUB TemplePicture ()
DECLARE SUB Stars ()
DECLARE SUB System.Delay (T!)
DECLARE SUB Help ()
DECLARE SUB Info.1 ()
DECLARE SUB Font.Regular (TEXT$, X%, Y%, Colour%)
DECLARE SUB System.Key.Get ()
DECLARE SUB System.Key.Clear ()

DECLARE FUNCTION Center% (Diameter%, X1%, X2%)
DECLARE FUNCTION CoOrdinates% (X%, Y%, Z%)
DECLARE FUNCTION YesNo% ()
DECLARE FUNCTION Rand% (Value%)

COMMON SHARED Key$, StatusKey$, KeyVal
   
    DIM C$(34), I$(34), R$(4), W$(8), e$(8)
    DIM L(0 TO 511), C(3, 4), T(8), O(3), R(3)
 
    RANDOMIZE TIMER

    DEF FNB (Q) = Q + 8 * ((Q = 9) - (Q = 0))
    DEF FNC (Q) = -Q * (Q < 19) - 18 * (Q > 18)
    DEF FNE (Q) = Q + 100 * (Q > 99)
  
    SCREEN 0
    WIDTH 80
    COLOR 7, 0
    CLS
    CALL Show
    PRINT
    PRINT "     Make sure that all commands are done in capitals.  For help type `H'."
    PRINT "Do you want instructions (Y/N)"
    IF YesNo THEN CALL Help

1400
    COLOR 3, 0, 1

REM
REM   INITIALIZE ARRAYS
REM

    Y$ = "** Please answer yes or no"

1610
    RESTORE
    FOR Q = 1 TO 34
        READ C$(Q), I$(Q)
    NEXT Q
   
    FOR Q = 0 TO 511
        L(Q) = 101
    NEXT Q
   
    FOR Q = 1 TO 8
        READ W$(Q), e$(Q)
    NEXT Q
    FOR Q = 1 TO 4
        READ R$(Q)
    NEXT Q
    CALL Info.1
    CLS
    PRINT "Wait one moment please while I stock the temple..."
2080
    X = 1
    Y = 4
    L(CoOrdinates(X, Y, 1)) = 2
'Stairs  
    FOR Z = 0 TO 6
        FOR Q1 = 1 TO 2
            Q = 104
            GOSUB 11350
            L(CoOrdinates(X, Y, Z + 1)) = 103
        NEXT Q1
    NEXT Z
    FOR Z = 0 TO 7
        FOR Q = 113 TO 124
            GOSUB 11350
        NEXT Q
        FOR Q1 = 1 TO 3
            FOR Q = 105 TO 112
                GOSUB 11350
            NEXT Q
            Q = 125
            GOSUB 11350
        NEXT Q1
    NEXT Z
    FOR Q = 126 TO 133
        Z = Rand(8)
        GOSUB 11350
    NEXT Q
    Q = 101
    FOR a = 1 TO 3
        Z = Rand(8)
        GOSUB 11350
        C(a, 1) = X
        C(a, 3) = Z
        C(a, 2) = Y
        C(a, 4) = 0
    NEXT a
    RC = 0
    ST = 2
    DX = 8
    R$(3) = "Man"
    Q = 112 + Rand(12)
    Z = Rand(8)
    GOSUB 11350
    R(1) = X
    R(2) = Y
    R(3) = Z
    Q = 109
    Z = Rand(8)
    GOSUB 11350
    O(1) = X
    O(2) = Y
    O(3) = Z
    BF = 0
    OT = 8
    AV = 0
    T = 1
    VF = 0
    LF = 0
    TC = 0
    GoldPieces& = 60
    RF = 0
    OF = 0
    BL = 0
    IQ = 8
    SX = 0
    FOR Q = 1 TO 8
        T(Q) = 0
    NEXT Q
REM CHOOSE CHARACTER
    PRINT CHR$(7);
    CLS
    PRINT
    COLOR 11, 0, 1
    PRINT "  You are in large room blinded by a very bright light.  All of the sudden you "
    PRINT "hear a booming voice which says, `You have been chosen bold one to be a valiant"
    PRINT "and brave  warrior of any race you desire.  You can choose to be an Elf, a Man,"
    PRINT "a Dwarf or a Hobbit.' Remember though, you only have 500 turns."
    COLOR 3, 0, 1
2720 GOSUB 11590
     FOR Q = 1 TO 4
     STR = INT(RND * 10 + 2)
     DEX = INT(RND * 10 + 2)
     IF LEFT$(R$(Q), 1) = O$ THEN RC = Q: ST = STR * Q: DX = DEX * Q
     IF ST > 18 THEN ST = 18
     IF DX > 18 THEN DX = 18
     NEXT Q
     PRINT
     OT = OT + 4 * (RC = 1)
     IF RC > 0 THEN R$(3) = "Human": GOTO 2850
     COLOR 11, 0, 15: PRINT "** That was incorrect. Please type E, D, M, OR H.": COLOR 3, 0, 1
     GOTO 2720
2850 PRINT "Which sex do you prefer";
     GOSUB 11610
     IF O$ = "M" THEN SX = 1: GOTO 2910
     IF O$ = "F" GOTO 2910
     COLOR 11, 0, 15: PRINT "** Cute "; R$(RC); ", Real cute. Try M OR F.": COLOR 3, 0, 1
     GOTO 2850
2910 PRINT
     PRINT "OK, "; R$(RC); ", you have the following attributes :"
     PRINT "Strength ="; ST
     PRINT "Intelligence ="; IQ
     PRINT "Dexterity ="; DX
     PRINT "and"; OT; "other points you allocate as you wish."
     PRINT
     Z$ = "Strength"
     GOSUB 11640
     ST = ST + Q
     IF OT = 0 GOTO 3100
     Z$ = "Intelligence"
     GOSUB 11640
     IQ = IQ + Q
     IF OT = 0 GOTO 3100
     Z$ = "Dexterity"
     GOSUB 11640
     DX = DX + Q
     'KEY 1,"Plate   "+CHR$(13):KEY 2,"Chain   "+CHR$(13):KEY 3,"Leather   "+CHR$(13):KEY 4,"Sword   "+CHR$(13):KEY 5,"Mace    "+CHR$(13):KEY 6,"Dagger    "+CHR$(13):KEY 7,"Nothing "+CHR$(13):KEY 8,"No      "+CHR$(13):KEY 9,"Yes       "+CHR$(13)
3100 PRINT "OK, "; R$(RC); ", you find your self at a bazaar in a small village built in the "
     PRINT "shadow of a large and crumbling castle.  You have nothing save the clothes on "
     PRINT "your back and a purse containing 60gp's to buy your equipments with."
3130 Z$ = "Armor"
     GOSUB 11890
     AV = 0: WV = 0: FL = 0: WC = 0
     PRINT "Plate Mail:30gp's Chainmail:20gp's Leather:10gp's Nothing:-"
     GOSUB 11590
     IF O$ = "N" GOTO 3240
     AV = -3 * (O$ = "P") - 2 * (O$ = "C") - (O$ = "L")
     IF AV > 0 GOTO 3240
     PRINT
     COLOR 11, 0, 15: PRINT "** Are you a "; R$(RC); " or "; C$(Rand(12) + 12); "?": COLOR 3, 0, 1
     GOTO 3130
3240 AH = AV * 7: GoldPieces& = GoldPieces& - AV * 10
     PRINT
     PRINT "OK, bold "; R$(RC); ", you have"; GoldPieces&; "gp's left."
     PRINT
3280 Z$ = "Weapons"
     GOSUB 11890
     PRINT "Sword:30gp's Mace:20gp's Dagger:10gp's Nothing:-"
     GOSUB 11590
     IF O$ = "N" GOTO 3380
     WV = -3 * (O$ = "S") - 2 * (O$ = "M") - (O$ = "D")
     IF WV > 0 GOTO 3380
     PRINT
     COLOR 11, 0, 15: PRINT "** Is your IQ really"; IQ; "?": COLOR 3, 0, 1
     GOTO 3280
3380 GoldPieces& = GoldPieces& - WV * 10
     IF GoldPieces& < 20 GOTO 3450
     PRINT
3410 PRINT "Do you want to buy a lamp for 20gp's";
     IF YesNo THEN
        LF = 1
        GoldPieces& = GoldPieces& - 20
        GOTO 3450
     END IF
3450
    PRINT
    IF GoldPieces& < 1 THEN Q = 0: GOTO 3570
    PRINT "OK, "; R$(RC); ", you have"; GoldPieces&; "gold pieces left."
    PRINT
3490
    INPUT "Flares give off light which allows you to see all the rooms around you.  At a   cost of 1gp each how many do you want to buy?"; O$
    Q = VAL(O$)
    PRINT
    IF Q < 1 AND O$ <> "0" THEN
       COLOR 11, 0
       PRINT "** If you don't want any, just type 0."
       COLOR 3, 0, 1
       PRINT
       GOTO 3490
    END IF
    COLOR 11, 0, 15
    IF Q > GoldPieces& THEN
       PRINT "** You can only afford"; GoldPieces&; "."
       COLOR 3, 0, 1
       PRINT
       GOTO 3490
    END IF
3570
    FL = FL + Q
    GoldPieces& = GoldPieces& - Q
    X = 1
    Y = 4
    Z = 1
    COLOR 27, 0, 15
    PRINT "OK, "; R$(RC); ", You are now entering the castle!"
    COLOR 3, 0, 1
GOTO 7090
    
     REM
     REM   MAIN PROCESSING LOOP
     REM
3640 T = T + 1
     IF RF + OF > 0 GOTO 3780
     IF C(1, 4) > T(1) THEN T = T + 1
     IF C(2, 4) > T(3) THEN GoldPieces& = GoldPieces& - Rand(5)
     IF GoldPieces& < 0 THEN GoldPieces& = 0
     IF C(3, 4) <= T(5) GOTO 3780
     a = X
     B = Y
     C = Z
     X = Rand(8)
     Y = Rand(8)
     Z = Rand(8)
     L(CoOrdinates(X, Y, Z)) = FNE(L(CoOrdinates(X, Y, Z))) + 100
     X = a: Y = B: Z = C
     IF L(CoOrdinates(X, Y, Z)) <> 1 GOTO 3780
     FOR Q = 1 TO 3
     C(Q, 4) = -(C(Q, 1) = X) * (C(Q, 2) = Y) * (C(Q, 3) = Z)
     NEXT Q
3780 IF Rand(5) > 1 GOTO 4280
     PRINT
     PRINT "You ";
     Q = Rand(7) + BL
     IF Q > 7 THEN Q = 4
     ON Q GOSUB 4130, 3870, 4110, 3850, 4150, 4180, 4200
     GOTO 4280
3850 PRINT "stepped on dragon @#*%!"
     RETURN
3870 PRINT "hear ";
     ON Rand(4) GOTO 3890, 3950, 4030, 4060
3890 PRINT "a scream!"
     FOR I = 2075 TO 1800 STEP -1
     SOUND I, .1
     NEXT
     SOUND 32729, 1
     RETURN
3950 PRINT "footsteps!"
     'FOR I=1 TO 5
     FOR J = 40 TO 37 STEP -1
     SOUND J, 1
     SOUND 32729, 10
     'NEXT
     NEXT
     RETURN
4030 PRINT "a Wumpus!"
     PLAY "O0MST255L4AGP5AGP5AGP5AG"
     RETURN
4060 PRINT "groans!"
4070 FOR I = 300 TO 37 STEP -1
     SOUND I, .1
     NEXT
RETURN

4110 PRINT "sneezed!"
RETURN
4130 PRINT "see a bat fly by!"
RETURN
4150 PRINT "hear a "; C$(12 + Rand(13)); " growling!"
     GOTO 4070
     RETURN
4180 PRINT "feel like you're being watched!"
     RETURN
4200 PRINT "hear faint rustling noises!"
     FOR Q = 1 TO 200
     a = INT(RND * 50 + 37)
     SOUND a, .001
     'SOUND 32729,1
     NEXT
     SOUND 32729, 1
RETURN

4280 REM CURE BLINDNESS
    IF BL + T(4) = 2 THEN
       PRINT
       PRINT C$(29); " cures your blindness!"
       BL = 0
    END IF
4320 REM REMOVE STUCK BOOK
    IF BF + T(6) = 2 THEN
       PRINT
       PRINT C$(31); " dissolves the book!"
       BF = 0
    END IF
4380 REM GET COMMAND
     LOCATE 23, 1
     COLOR 3, 0, 1
     PRINT "Enter your command:"
     FOR ASD = 1 TO 2
     LOCATE 23, 20: PRINT "-": SOUND 32767, 1
     LOCATE 23, 20: PRINT "\": SOUND 32767, 1
     LOCATE 23, 20: PRINT "ณ": SOUND 32767, 1
     LOCATE 23, 20: PRINT "/": SOUND 32767, 1
     LOCATE 23, 20: PRINT "-": SOUND 32767, 1
     LOCATE 23, 20: PRINT "\": SOUND 32767, 1
     LOCATE 23, 20: PRINT "ณ": SOUND 32767, 1
     LOCATE 23, 20: PRINT "/": SOUND 32767, 1
     LOCATE 23, 20: PRINT "-"; : SOUND 32767, 1
     NEXT ASD
     LINE INPUT O$
     IF LEFT$(O$, 2) = "DR" GOTO 5900
     O$ = LEFT$(O$, 1)
     IF O$ = "N" GOTO 5020
     IF (O$ = "S") OR (O$ = "W") OR (O$ = "E") GOTO 5030
     IF O$ = "U" GOTO 5080
     IF O$ = "D" GOTO 5110
     IF O$ = "Þ" GOTO 11070
     IF O$ = "M" GOTO 5160
     IF O$ = "F" THEN ON BL + 1 GOTO 5400, 5160
     IF O$ = "L" THEN ON BL + 1 GOTO 5660, 5160
     IF O$ = "O" GOTO 6090
     IF O$ = "Q" GOTO 6960
     IF O$ = "G" THEN ON BL + 1 GOTO 6550, 5160
     IF O$ = "T" THEN PRINT : ON RF + 1 GOTO 6810, 6850
     IF O$ = "#" GOTO 11950
     IF O$ = "H" GOTO 4690
GOTO 5000

4690
    INPUT "Do you want a hard copy (Y/N)"; HARD$
    IF HARD$ = "Y" GOTO 12000
    PRINT "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
    PRINT "บ";
    COLOR 27, 0
    PRINT "   *** TEMPLE OF LOTH'S COMMAND AND INFORMATION SUMMARY ***";
    COLOR 3, 0
    PRINT "   บ"
    PRINT "ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน"
    PRINT "บ The following commands available are:                        บ"
    PRINT "บ                                                              บ"
    PRINT "บ H/elp     N/orth    S/outh    E/ast     W/est     U/p        บ"
    PRINT "บ D/own     D/rink    M/ap      F/lare    L/amp     O/pen      บ"
    PRINT "บ G/aze     T/eleport Q/uit     #/Score                        บ"
    PRINT "ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน"
    PRINT "บ The contents of the rooms are as follows:                    บ"
    PRINT "บ                                                              บ"
    PRINT "บ ฮ = empty room      B = book            C = chest            บ"
    PRINT "บ D = stairs down     ๏ = entrance/exit    = flares           บ"
    PRINT "บ G = gold pieces      = monster         ่ = crystal orb      บ"
    PRINT "บ P = magic pool      S = sinkhole        T = treasure         บ"
    PRINT "บ U = stairs up       * = Drow            Û = warp/amulet      บ"
    PRINT "ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน"
    PRINT "บ The benefits of having treasures are:                        บ"
    PRINT "บ                                                              บ"
    PRINT "บ RUBY RED - avoid lethargy    PALE PEARL - avoid leech        บ"
    PRINT "บ GREEN GEM - avoid forgetting  OPAL EYE - cure blindness      บ"
    PRINT "บ BLUE FLAME - dissolves books  NORN STONE - no benefit        บ"
    PRINT "บ PALANTIR - no benefit         SILMARIL - no benefit          บ"
    PRINT "ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน"
    PRINT
    PRINT "Press return when ready to resume, "; R$(RC); ".";
    LINE INPUT ""; O$
GOTO 3640

5000 COLOR 11, 0, 15: PRINT "** Bold "; R$(RC); ", that wasn't a valid command!": COLOR 3, 0, 1
     GOTO 3640
5020 IF L(CoOrdinates(X, Y, Z)) = 2 GOTO 10460
5030 X = X + (O$ = "N") - (O$ = "S")
     Y = Y + (O$ = "W") - (O$ = "E")
     X = FNB(X)
     Y = FNB(Y)
GOTO 7090

5080 IF L(CoOrdinates(X, Y, Z)) = 3 THEN Z = Z - 1: GOTO 7090
     Z$ = "Up"
GOTO 5130

5110 Z$ = "Down"
     IF L(CoOrdinates(X, Y, Z)) = 4 THEN Z = Z + 1: GOTO 7090
5130 PRINT
     COLOR 11, 0, 15: PRINT "** There are no stairs going "; Z$; " from here!": COLOR 3, 0, 1
     GOTO 3640
5160 IF BL <> 1 GOTO 5240
     PRINT
     COLOR 11, 0, 15: PRINT "** You can't see anything "; R$(RC); "!": COLOR 3, 0, 1
     GOTO 3640
     REM
     REM   DISPLAY MAP OF CURRENT CASTLE LEVEL
     REM
     COLOR 6, 0, 1
5240 PRINT
     a = X: B = Y
     FOR X = 1 TO 8
     FOR Y = 1 TO 8
     Q = L(CoOrdinates(X, Y, Z))
     IF Q > 99 THEN Q = Q - 100: LET Q = 34: REM TO HIDE ROOMS
     COLOR 6, 0, 1: IF X = a AND Y = B THEN PRINT "<"; I$(Q); ">  "; : GOTO 5320: COLOR 3, 0, 1
     COLOR 6, 0, 1: PRINT " "; I$(Q); "   "; : COLOR 3, 0, 1
5320 NEXT Y
     COLOR 3, 0, 1: PRINT
     PRINT
     NEXT X
     X = a: Y = B
     GOTO 5610
     COLOR 12, 0, 1: PRINT ") level"; Z: COLOR 3, 0, 1
     GOTO 3640
5400 IF FL <> 0 GOTO 5460
     COLOR 11, 0, 15: PRINT "** You can't, your out of flares!": COLOR 3, 0, 1
     GOTO 3640
     REM
     REM   DISPLAY ADJACENT ROOM CONTENTS WITH FLARE
     REM
5460 PRINT
     FL = FL - 1
     a = X: B = Y
     FOR Q1 = a - 1 TO a + 1
     X = FNB(Q1)
     FOR Q2 = B - 1 TO B + 1
     Y = FNB(Q2)
     Q = FNE(L(CoOrdinates(X, Y, Z)))
     L(CoOrdinates(X, Y, Z)) = Q
     COLOR 12, 0, 1: PRINT " "; I$(Q); "   "; : COLOR 3, 0, 1
     NEXT Q2
     PRINT
     PRINT
     NEXT Q1
     X = a: Y = B
5610 GOSUB 11920
     GOTO 3640
     REM
     REM   DISPLAY CONTENTS OF ADJACENT ROOM WITH LAMP
     REM
5660 IF LF <> 0 GOTO 5700
     PRINT
     COLOR 11, 0, 15: PRINT "** You don't have a lamp, "; R$(RC); "!": COLOR 3, 0, 1
     GOTO 3640
5700 PRINT
     PRINT "Where do you want to shine the lamp (N,S,E,W)";
     GOSUB 11610
     a = X: B = Y
     X = FNB(X + (O$ = "N") - (O$ = "S"))
     Y = FNB(Y + (O$ = "W") - (O$ = "E"))
     IF a - X + B - Y <> 0 GOTO 5800
     PRINT
     COLOR 11, 0, 15: PRINT "** That's not a direction "; R$(RC); "!": COLOR 3, 0, 1
     GOTO 3640
5800 PRINT
     PRINT "The lamp shines into ("; X; ","; Y; ") level"; Z; "."
     PRINT
     L(CoOrdinates(X, Y, Z)) = FNE(L(CoOrdinates(X, Y, Z)))
     PRINT "There you will find "; C$(L(CoOrdinates(X, Y, Z))); "."
     X = a: Y = B
     GOTO 3640
     REM
     REM   TAKE A DRINK FROM A POOL
     REM
5900 IF L(CoOrdinates(X, Y, Z)) = 5 GOTO 5940
     PRINT
     COLOR 11, 0, 15: PRINT "** There is no pool to drink from here!": COLOR 3, 0, 1
     GOTO 3640
5940 Q = Rand(8)
     PRINT
     PRINT "You take a drink and ";
     IF Q < 7 THEN PRINT "feel ";
     ON Q GOTO 5990, 6000, 6010, 6020, 6030, 6040, 6050, 6070
5990 ST = FNC(ST + Rand(3)): PRINT "stronger.": GOTO 3640
6000 ST = ST - Rand(3): COLOR 15, 0, 1: PRINT "weaker.": COLOR 7, 0, 1: ON (1 - (ST < 1)) GOTO 3640, 10340
6010 IQ = FNC(IQ + Rand(3)): PRINT "smarter.": GOTO 3640
6020 IQ = IQ - Rand(3): COLOR 15, 0, 1: PRINT "dumber.": COLOR 3, 0, 1: ON (1 - (IQ < 1)) GOTO 3640, 10340
6030 DX = FNC(DX + Rand(3)): PRINT "faster.": GOTO 3640
6040 DX = DX - Rand(3): COLOR 15, 0, 1: PRINT "clumsier.": COLOR 3, 0, 1: ON (1 - (DX < 1)) GOTO 3640, 10340
6050 Q = Rand(4): IF Q = RC GOTO 6050
     RC = Q: PRINT "become a "; R$(RC); ".": GOTO 3640
6070 SX = 1 - SX: PRINT "turn into a "; : IF SX = 0 THEN PRINT "fe";
     PRINT "male "; R$(RC); "!": GOTO 3640
6090 IF L(CoOrdinates(X, Y, Z)) <> 6 GOTO 6130
     PRINT
     PRINT "You open the chest and"
     GOTO 6390
6130 IF L(CoOrdinates(X, Y, Z)) <> 12 GOTO 6170
     PRINT
     PRINT "You open the book and"
     GOTO 6200
6170 PRINT
     COLOR 11, 0, 15: PRINT "** there is nothing to open here.": COLOR 3, 0, 1
     GOTO 3640
6200 ON Rand(6) GOTO 6210, 6240, 6260, 6280, 6310, 6340
6210 COLOR 0, 15, 15: CLS : PRINT "Flash! Oh no! you are now a blind "; R$(RC); "!"
     BL = 1
     GOTO 6370
6240 PRINT "It's another volume of Nurฃcc's poetry! - YECH!!"
     GOTO 6370
6260 PRINT "It's an old copy of Play"; R$(Rand(4)); "!"
     GOTO 6370
6280 PRINT "It's a manual of dexterity!"
     DX = 18
     GOTO 6370
6310 PRINT "It's a manual of strength!"
     ST = 18
     GOTO 6370
6340 COLOR 11, 0, 15: PRINT "The book sticks to your hands -"
     PRINT "now you are unable to draw your weapon!": COLOR 3, 0, 1
     BF = 1
6370 L(CoOrdinates(X, Y, Z)) = 1
     GOTO 3640
6390 ON Rand(4) GOTO 6400, 6450, 6490, 6450
6400 PRINT
     COLOR 14, 0, 15: PRINT "KABOOM!"; : COLOR 3, 0, 1: PRINT " it explodes!!"
     Q = Rand(6)
     GOSUB 10240
     ON (1 - (ST < 1)) GOTO 6370, 10340
6450 Q = Rand(1000)
     PRINT "find"; Q; "gold pieces!"
     GoldPieces& = GoldPieces& + Q
     GOTO 6370
6490 PRINT
     COLOR 5, 0, 15: PRINT "GAS!!"; : COLOR 3, 0, 1: PRINT "you stagger from the room!"
     L(CoOrdinates(X, Y, Z)) = 1
     T = T + 20
     O$ = MID$("NSEW", Rand(4), 1)
     GOTO 5030
6550 IF L(CoOrdinates(X, Y, Z)) = 11 GOTO 6590
     PRINT
     COLOR 11, 0, 15: PRINT "**You need an orb to use the gaze command!": COLOR 3, 0, 1
     GOTO 3640
6590 PRINT
     PRINT "You see ";
     ON Rand(6) GOTO 6620, 6640, 6660, 6680, 6750, 6790
6620 PRINT "Yourself in a bloody mess!"
     ST = ST - Rand(2): ON (1 - (ST < 1)) GOTO 3640, 10340
6640 PRINT "Yourself drinking from a pool and becoming "; C$(12 + Rand(13)); "!"
     GOTO 3640
6660 PRINT C$(12 + Rand(13)); " gazing back at you!"
     GOTO 3640
6680 a = X: B = Y: C = Z
     X = Rand(8): Y = Rand(8): Z = Rand(8)
     Q = FNE(L(CoOrdinates(X, Y, Z)))
     L(CoOrdinates(X, Y, Z)) = Q
     PRINT C$(Q); " at ("; X; ","; Y; ") level"; Z; "."
     X = a: Y = B: Z = C
     GOTO 3640
6750 a = Rand(8): B = Rand(8): C = Rand(8)
     IF Rand(8) < 4 THEN a = O(1): B = O(2): C = O(3)
     BEEP: COLOR 12, 0, 15: PRINT "The Amulet of Chaos at ("; a; ","; B; ") level"; C; "!": COLOR 3, 0, 1
     GOTO 3640
6790 PRINT "a soap opera rerun!"
     GOTO 3640
6810 IF RF <> 0 GOTO 6850
     PRINT
     COLOR 11, 0, 15: PRINT "** You can't teleport without the Runestaff!": COLOR 3, 0, 1
     GOTO 3640
6850 Z$ = "X-Coordinate"
     GOSUB 11750
     X = Q
     Z$ = "Y-Coordinate"
     GOSUB 11750
     Y = Q
     Z$ = "Z-Coordinate"
     GOSUB 11750
     Z = Q
     O$ = "T"
GOTO 7090

6960 PRINT
     PRINT "Do you really want to quit now?";
     GOSUB 11610
     PRINT
     IF O$ = "Y" GOTO 7030
     COLOR 11, 0, 15: PRINT "** Then don't say that you do!": COLOR 3, 0, 1
     GOTO 3640
7030 PRINT
     GOTO 10630
     REM
     REM   DISPLAY STATUS INFORMATION
     REM
     CLS

7090
    COLOR 3, 0, 1
    PRINT
    IF BL = 0 THEN GOSUB 11920: PRINT
    LOCATE 24, 1: COLOR 3, 0, 1
     PRINT "Strength ="; ST; " Intelligence ="; IQ; " Dexterity ="; DX
     PRINT "Treasures ="; TC; " Flares ="; FL; " Gold Pieces ="; GoldPieces&
     PRINT "Turns ="; T; "  Weapon = "; W$(WV + 1); "  Armor = "; W$(AV + 5);
     IF LF = 1 THEN PRINT "  and a lamp"
     IF LF = 0 THEN PRINT "   "
     JOHN! = IQ * 100 + ST * 100 + DX * 100 + KM! + FTRS + REQ + GoldPieces& - T * 5
     ' IF JOHN! > 30000 THEN JOHN!=30000
     ' IF GoldPieces& > 30000 THEN GoldPieces&=30000
     PRINT "Score ="; JOHN!; : COLOR 3, 0, 1:
     PRINT "  Status = ";
     EQUZ = 0
     IF BL = 1 THEN PRINT "-Blinded": EQUZ = 1
     IF BF = 1 THEN PRINT "-Unable to draw weapon": EQUZ = 1
     IF EQUZ = 0 THEN PRINT "-Normal"
     COLOR 3, 0, 1
     '60:PRINT "Time = ";TIME$:COLOR 3,0,1:MAGICAL=0
     PRINT "Your are carrying ";
     IF OF = 1 THEN COLOR 12, 0, 1: PRINT "The Amulet of Chaos": COLOR 3, 0, 1: MAGICAL = 1
     IF RF = 1 THEN PRINT "The Runestaff": MAGICAL = 1
     IF MAGICAL = 0 THEN PRINT "no magical items at the moment"
     QXYZ = 0
     PRINT "The treasures you carry are ";
     FOR Q = 1 TO 8
     IF T(Q) = 1 THEN PRINT C$(Q + 25): QXYZ = 1
     NEXT Q
     IF QXYZ = 0 THEN PRINT "nothing"
     IF COME = 1 THEN GOTO 7400
     IF T > 500 THEN GOTO 12280
7400 WC = 0
     Q = FNE(L(CoOrdinates(X, Y, Z)))
     L(CoOrdinates(X, Y, Z)) = Q
     Z$ = "You now have "
     PRINT
     PRINT "Here you find "; C$(Q); "."
     IF (Q < 7) OR (Q = 11) OR (Q = 12) GOTO 3640
     IF Q = 7 THEN GoldPieces& = GoldPieces& + Rand(10): PRINT Z$; GoldPieces&; ".": GOTO 6370
     IF Q = 8 THEN FL = FL + Rand(5): PRINT Z$; FL; ".": GOTO 6370
     IF Q > 9 GOTO 7520
     IF (O(1) = X) AND (O(2) = Y) AND (O(3) = Z) THEN ON (1 - (O$ = "T")) GOTO 5030, 11070
     X = Rand(8): Y = Rand(8): Z = Rand(8): GOTO 7090
7520 IF Q = 10 THEN Z = FNB(Z + 1): GOTO 7090
     IF Q <= 25 OR Q >= 34 GOTO 7590
     PRINT
     PRINT "It's now yours!"
     T(Q - 25) = 1
     TC = TC + 1
     GOTO 6370
7590 a = L(CoOrdinates(X, Y, Z)) - 12
     WC = 0
     IF (a < 13) OR (VF = 1) GOTO 8800
7620 PRINT
     PRINT "You may trade with, attack, or ignore the Drow Merchant."
     GOSUB 11590
     IF O$ = "I" GOTO 3640
     IF O$ <> "A" GOTO 7710
     VF = 1
     PRINT
     COLOR 3, 0, 12: PRINT "You'll be sorry that you did that!"
     GOTO 8800
7710 IF O$ = "T" GOTO 7750
     PRINT
     COLOR 11, 0, 15: PRINT "** Nice shot "; R$(RC); "!": COLOR 3, 0, 1
     GOTO 7620
7750 FOR Q = 1 TO 8
     a = Rand(Q * 1500)
     IF T(Q) = 0 GOTO 7830
7780 PRINT
     PRINT "Do you want to sell "; C$(Q + 25); " for "; a; "gp's";
     GOSUB 11610
     IF O$ = "Y" THEN TC = TC - 1: T(Q) = 0: GoldPieces& = GoldPieces& + a: GOTO 7830
     IF O$ <> "N" THEN PRINT Y$: GOTO 7780
7830 NEXT Q
     IF GoldPieces& >= 1000 GOTO 7880
     PRINT
     PRINT "You're too poor to trade, "; R$(RC); "."
     GOTO 3640
7880 IF GoldPieces& < 1250 GOTO 8380
     PRINT
     PRINT "OK "; R$(RC); ", you have "; GoldPieces&; "gp's and "; W$(AV + 5); " armor."
7910 PRINT
     Z$ = "Armor"
     GOSUB 11890
     PRINT "Nothing:0gp's Leather:1250gp's ";
     IF GoldPieces& > 1499 THEN PRINT "Chainmail:1500:gp's ";
     IF GoldPieces& > 1999 THEN PRINT "Plate Mail:2000gp's ";
7970 PRINT
     GOSUB 11590
     PRINT
     IF O$ = "N" GOTO 8130
     IF O$ = "L" THEN GoldPieces& = GoldPieces& - 1250: AV = 1: AH = 7: GOTO 8130
     IF O$ <> "C" OR GoldPieces& >= 1500 GOTO 8050
     COLOR 11, 0, 15: PRINT "** You haven't got that much gold on hand!": COLOR 3, 0, 1
     GOTO 7910
8050 IF O$ = "C" THEN GoldPieces& = GoldPieces& - 1500: AV = 2: AH = 14: GOTO 8130
     IF O$ <> "P" OR GoldPieces& >= 2000 GOTO 8090
     COLOR 11, 0, 15: PRINT "** You can't afford plate mail!": COLOR 3, 0, 1
     GOTO 7910
8090 IF O$ = "P" THEN GoldPieces& = GoldPieces& - 2000: AV = 3: AH = 21: GOTO 8130
     PRINT
     COLOR 11, 0, 15: PRINT "** Choose a selection.": COLOR 3, 0, 1
     GOTO 7970
8130 IF GoldPieces& < 1250 GOTO 8380
     PRINT
     PRINT "You have"; GoldPieces&; "gp's left with "; W$(WV + 1); " in hand."
8160 PRINT
     Z$ = "Weapon"
     GOSUB 11890
     PRINT "Nothing:- Dagger:1250gp's";
     IF GoldPieces& > 1499 THEN PRINT "Mace:1500gp's";
     IF GoldPieces& > 1999 THEN PRINT "Sword:2000gp's";
8220 PRINT
     GOSUB 11590
     PRINT
     IF O$ = "N" GOTO 8380
     IF O$ = "D" THEN GoldPieces& = GoldPieces& - 1250: WV = 1: GOTO 8380
     IF O$ <> "M" OR GoldPieces& >= 1500 GOTO 8300
     COLOR 11, 0, 15: PRINT "** Sorry sir, I'm afraid I don't give credit!": COLOR 3, 0, 1
     GOTO 8160
8300 IF O$ = "M" THEN GoldPieces& = GoldPieces& - 1500: WV = 2: GOTO 8380
     IF O$ <> "S" OR GoldPieces& >= 2000 GOTO 8350
     COLOR 11, 0, 15: PRINT "** Your Dungeon Express Card - ";
     PRINT "You left home without it!": COLOR 3, 0, 1
     GOTO 8160
8350 IF O$ = "S" THEN GoldPieces& = GoldPieces& - 2000: WV = 3: GOTO 8380
     COLOR 11, 0, 15: PRINT "** Try choosing a selection!": COLOR 3, 0, 1
     GOTO 8220
8380 IF GoldPieces& < 1000 GOTO 3640
8390 Z$ = "Strength"
     GOSUB 11830
     IF O$ <> "Y" GOTO 8470
     GoldPieces& = GoldPieces& - 1000
     ST = FNC(ST + Rand(6))
     Q = ST
     GOSUB 11860
     GOTO 8380
8470 IF O$ <> "N" THEN PRINT Y$: GOTO 8390
8480 IF GoldPieces& < 1000 GOTO 3640
8490 Z$ = "Intelligence"
     GOSUB 11830
     IF O$ <> "Y" GOTO 8570
     GoldPieces& = GoldPieces& - 1000
     IQ = FNC(IQ + Rand(6))
     Q = IQ
     GOSUB 11860
     GOTO 8480
8570 IF O$ <> "N" THEN PRINT Y$: GOTO 8490
8580 IF GoldPieces& < 1000 GOTO 3640
8590 Z$ = "Dexterity"
     GOSUB 11830
     IF O$ <> "Y" GOTO 8670
     GoldPieces& = GoldPieces& - 1000
     DX = FNC(DX + Rand(6))
     Q = DX
     GOSUB 11860
     GOTO 8580
8670 IF O$ <> "N" THEN PRINT Y$: GOTO 8590
     IF (GoldPieces& < 1000) OR (LF = 1) GOTO 3640
8690 PRINT
     PRINT "Do you want to buy a lamp for 1000 gp's";
     GOSUB 11610
     IF O$ <> "Y" GOTO 8780
     GoldPieces& = GoldPieces& - 1000
     LF = 1
     PRINT
     PRINT "It's guaranteed to outlive you!"
     GOTO 3640
8780 IF O$ <> "N" THEN PRINT Y$: GOTO 8690
     GOTO 3640
8800 Q1 = 1 + INT(a / 2): Q2 = a + 2: Q3 = 1
     IF (C(1, 4) > T(1)) OR (BL = 1) OR (DX < Rand(9) + Rand(9)) GOTO 9850
8820 PRINT
     COLOR 3, 0, 12: PRINT "You're confronting "; C$(a + 12); "!"
     PRINT
     PRINT "You may attack or retreat (strongly suggested!)."
     IF Q3 = 1 THEN PRINT "You can also attempt to bribe the creature."
     IF IQ > 14 THEN PRINT "You can also cast a spell."
     PRINT
     PRINT "Your strength is"; ST; "and your dexterity is"; DX; "."
     GOSUB 11590
     IF O$ <> "A" GOTO 9340
     IF WV <> 0 GOTO 8960
     PRINT
     COLOR 11, 0, 15: PRINT "** Pounding on "; C$(a + 12); " won't hurt it!": COLOR 3, 0, 12
     GOTO 9850
8960 IF BF <> 1 GOTO 9000
     PRINT
     COLOR 11, 0, 15: PRINT "** You can't kill it with a book, so I suggest you either attack or retreat!": COLOR 3, 0, 12
     GOTO 9850
9000 IF DX >= Rand(20) + (3 * BL) GOTO 9040
     PRINT
     PRINT "You barley missed the "; C$(a + 12); "!"
9030 GOTO 9850
9040 Z$ = RIGHT$(C$(a + 12), LEN(C$(a + 12)) - 2)
     IF LEFT$(Z$, 1) = " " THEN Z$ = MID$(Z$, 2)
     PRINT
     PRINT "A valent blow, you hit the "; Z$; "!"
     Q2 = Q2 - WV
     IF (a <> 9 AND a <> 12) GOTO 9140
     IF Rand(8) <> 1 GOTO 9140
     PRINT
     COLOR 11, 0, 15: BEEP: BEEP: PRINT "OH NO! Your "; W$(WV + 1); " broke!": BEEP: BEEP: COLOR 3, 0, 12
     WV = 0
9140 IF Q2 > 0 GOTO 9850
9150 PRINT
     MC = MC - 1
     PRINT "You kill "; C$(a + 12); "."
     KM! = KM! + 1000
     IF H > T - 60 GOTO 9230
     PRINT
     PRINT "You spend an hour eating "; C$(a + 12); e$(Rand(8)); "."
     H = T
9230 IF X <> R(1) OR Y <> R(2) OR Z <> R(3) THEN ON (1 - (a = 13)) GOTO 9290, 11390
     PRINT
     COLOR 11, 0, 15: BEEP: PRINT "You've found the Runestaff!"; CHR$(7): COLOR 3, 0, 12
     FTRS = 10000
     R(1) = 0
     RF = 1
9290 Q = Rand(1000)
     PRINT
     PRINT "You now get his hoard of"; Q; "gp's!"
     GoldPieces& = GoldPieces& + Q
     GOTO 6370
9340 IF O$ = "R" GOTO 9850
     IF O$ <> "C" GOTO 9640
     IF IQ >= 15 OR Q3 <= 1 GOTO 9400
     PRINT
     COLOR 11, 0, 15: PRINT "** You can't cast a spell now!": COLOR 3, 0, 12
     GOTO 8820
9400 PRINT
     PRINT "Which spell do you wish to cast, W/eb, F/ireball, or D/eathspell?";
     GOSUB 11610
     PRINT
     IF O$ <> "W" GOTO 9480
     ST = ST - 1
     WC = Rand(8) + 1
     ON (1 - (ST < 1)) GOTO 9850, 10340
9480 IF O$ <> "F" GOTO 9570
     Q = Rand(7) + Rand(7)
     ST = ST - 1
     IQ = IQ - 1
     IF (IQ < 1) OR (ST < 1) GOTO 10340
     PRINT "It does"; Q; "points worth of damage."
     PRINT
     Q2 = Q2 - Q
     GOTO 9140
9570 IF O$ = "D" GOTO 9610
     PRINT
     COLOR 11, 0, 15: PRINT "** Try one of the options given.": COLOR 3, 0, 12
     GOTO 8820
9610 PRINT "Death is. . . ";
     IF IQ < Rand(4) + 15 THEN PRINT "yours!": IQ = 0: GOTO 10340
     PRINT "his!": Q2 = 0: GOTO 9150
9640 IF O$ = "B" AND Q3 <= 1 GOTO 9680
     PRINT
     COLOR 11, 0, 15: PRINT "** Choose one of the options listed.": COLOR 3, 0, 12
     GOTO 8820
9680 IF TC <> 0 GOTO 9720
     PRINT
     PRINT "All I want is your life!"
     GOTO 9850
9720 Q = Rand(8)
     IF T(Q) = 0 GOTO 9720
9740 PRINT
     PRINT "I want "; C$(Q + 25); ". Will you give it to me?";
     GOSUB 11610
     IF O$ = "N" GOTO 9850
     IF O$ <> "Y" THEN PRINT Y$: GOTO 9740
     T(Q) = 0
     TC = TC - 1
     PRINT
     PRINT "OK, just don't tell anyone else."
     VF = VF + (L(CoOrdinates(X, Y, Z)) = 25)
     GOTO 3640
9850 Q3 = 2
     IF WC <= 0 GOTO 9890
     WC = WC - 1
     IF WC = 0 THEN PRINT : PRINT "The web just broke!"
9890 Z$ = RIGHT$(C$(a + 12), LEN(C$(a + 12)) - 2)
     IF LEFT$(Z$, 1) = " " THEN Z$ = MID$(Z$, 2)
     IF WC <= 0 GOTO 9950
     PRINT
     PRINT "The "; Z$; " is stuck and can't attack now!"
     GOTO 10130
9950 PRINT
     PRINT "The "; Z$; " attacks!"
     IF DX < Rand(7) + Rand(7) + Rand(7) + 3 * BL GOTO 10080
     PRINT
     HIT = INT(RND(0) * 3)
      ON HIT GOTO 10010, 10030, 10050
10010 PRINT "The blow barely misses your left leg making sparks a huge dent in the floor!"
      GOTO 10130
10030 PRINT "The "; Z$; " charges at you but you dodge out of the way just in time!"
10040 GOTO 10130
10050 PRINT "The "; Z$; " just  barely misses your ear!"
      GOTO 10130
      GOTO 10130
10080 PRINT
      COLOR 12, 0, 4
      BEEP
      PRINT "Thud! The "; Z$; " hit you!"
      BEEP
      COLOR 3, 0, 12
      Q = Q1
      GOSUB 10240
      IF ST < 1 GOTO 10340
10130
    IF O$ <> "R" GOTO 8820
    PRINT
    PRINT "You have escaped!"
    PRINT
10170
    PRINT "Do you want to go North, south, east, or west?";
    GOSUB 11610
    IF O$ = "N" OR O$ = "S" OR O$ = "E" OR O$ = "W" GOTO 5030
    PRINT
    COLOR 11, 0, 15: PRINT "** Don't press your luck, "; R$(RC); "!": COLOR 3, 0, 12
      PRINT
      GOTO 10170
10240 IF AV = 0 GOTO 10320
      Q = Q - AV
      AH = AH - AV
      IF Q < 0 THEN AH = AH - Q: Q = 0
      IF AH >= 0 GOTO 10320
    AH = 0
    AV = 0
    PRINT
    PRINT "Your armor is damaged beyond use . . . good luck!"
10320 ST = ST - Q
RETURN

10340 PRINT CHR$(7)
10350 GOSUB 11530
      COLOR 3, 0, 7: PRINT "A noble effort, oh formerly living "; R$(RC); "!"
      PRINT
      PRINT "You died due to lack of ";
      IF ST < 1 THEN PRINT "Strength."
      IF IQ < 1 THEN PRINT "Intelligence."
      IF DX < 1 THEN PRINT "Dexterity."
      PRINT
      Q3 = 1
      PRINT "At the time you died, you had :": PRINT
      GOTO 10680
10460 Q3 = 0
      PRINT
      PRINT "You left the castle with";
      IF OF = 0 THEN PRINT "out";
      PRINT " the Amulet of Chaos."
10510 PRINT
      IF OF = 0 GOTO 10630
      CLS
      SCREEN 1: CLS
    CALL TemplePicture
    CALL Stars
    LOCATE 22, 11
    PRINT "Congratulations!"
    LOCATE 22, 11
    BEEP
    FOR X = 200 TO 0 STEP -4
        CIRCLE (160, 100), X, , , , 1
    NEXT X
    SCREEN 0

10540 CLS
      COLOR 11, 0, 15:
      PRINT "                   Ü฿ Û   Û Ü฿฿Ü Û  Û   Û     Û ฿Û฿ ÛÜ   Û  ÜÛÜ ฿Ü"
      PRINT "          ÜÜÜ ฿฿฿ Û    ฿Ü฿  Û  Û Û  Û   Û  Ü  Û  Û  Û ฿Ü Û  ฿Û฿   Û ฿฿฿ ÜÜÜ"
      PRINT "              ฿฿฿  ฿Ü   Û   ฿ÜÜ฿ ฿ÜÜ฿    ฿Ü฿Ü฿  ÜÛÜ Û   ฿Û   Ü  Ü฿  ฿฿฿"
      PRINT ""
      PRINT "                         An incredibly glorious victory!!!!"
      COLOR 3, 0, 1
      PRINT
      PRINT "In addition, you got out with the following:"
GOTO 10670

10630 PRINT
      PRINT "A less than awe-inspiring defeat."
      PRINT
      PRINT "When you left the castle, you had:"
10670 IF Q3 = 0 THEN PRINT "Your miserable life!"
10680 FOR Q = 1 TO 8
      IF T(Q) = 1 THEN PRINT C$(Q + 25)
      NEXT Q
      PRINT W$(WV + 1); " and "; W$(AV + 5);
      IF LF = 1 THEN PRINT " and a lamp";
      PRINT
      PRINT "You also had"; FL; "flares and"; GoldPieces&; "gold pieces"
      IF RF = 1 THEN PRINT "and the Runestaff"
      PRINT "Your score was "; JOHN!
      PRINT "And it took you"; T; "turns!"
      IF JOHN! < 20000 THEN RANK$ = "a Whimp"
      IF JOHN! > 35000! THEN RANK$ = "a Peasent"
      IF JOHN! > 50000! THEN RANK$ = "an Ametuer"
      IF JOHN! > 75000! THEN RANK$ = "a Scout"
      IF JOHN! > 90000! THEN RANK$ = "an Adventurer"
      IF JOHN! > 110000! THEN RANK$ = "a Hero"
      IF JOHN! > 125000! THEN RANK$ = "a Wizard"
      IF JOHN! > 140000! THEN GOTO 12470
      'GOTO 11290
10870 PRINT : PRINT "You are ranked as "; RANK$
      FOR a = 2000 TO 800 STEP -2: SOUND a, .1: NEXT
10880 PLAY "MS T225 O2 P4 L8 ggg L4 g P8 L8 ggg L4 g P8 L8 gggggg L2 a# P5"
      PLAY "MS T225 O2 L8 ggg L4 g P8 L8 ggg L4 g P8 L8 gggggg L2 a# P5"
      PLAY "MS T225 O3 L8 ddd L4 d P8 L8 ddd L4 d P8 L8 dddddd L2 f P5"
      PLAY "MS T225 O3 L8 ddd L4 d P8 L8 ddd L4 d P8 L8 dddddd L2 f P5"
      PLAY "MS T210 O3 L3 d O2 a# L2 g P8 L2 a# L2 g P4"
      PLAY "MS T225 O2 L8 gggggg L2 a# P8 L8 gggggg L2 a# P8 L8 gggggg L2 a# P5 L4 fg P1 g"
      PRINT : PRINT " Are you foolish enough to want to play again?";
      GOSUB 11610
      PRINT
      IF O$ <> "Y" GOTO 11030
      PRINT "Some "; R$(RC); "s never learn!"
      PRINT
      PRINT "Please be patient while the castle is restocked."
      PRINT
      GOTO 1610
11030 IF O$ <> "N" THEN PRINT Y$: GOTO 10870
      PRINT "Maybe dumb "; R$(RC); " is not so dumb after all!"
      PRINT
END

11070 PRINT
      PRINT "Great unmitigated Nurฃcc!"
      PRINT
      COLOR 28, 0, 15
      PRINT "You just found The Amulet of Chaos!"
      COLOR 3, 0, 1
      ST = 18
      IQ = 18
      DX = 18
      REQ = 20000
      BF = 0
      BL = 0
      PRINT
      PRINT "The Runestaff has just disappeared!"
      RF = 0
      OF = 1
      O(1) = 0
GOTO 6370

11350 X = Rand(8)
      Y = Rand(8)
      IF L(CoOrdinates(X, Y, Z)) <> 101 GOTO 11350
      L(CoOrdinates(X, Y, Z)) = Q
RETURN

11390
    PRINT
    PRINT "You get all his wares :"
    PRINT "Plate mail"
    AV = 3
    AH = 21
    PRINT "A sword"
    WV = 3
    PRINT "A strength potion"
    ST = FNC(ST + Rand(6))
    PRINT "An intelligence potion"
    IQ = FNC(IQ + Rand(6))
    PRINT "A dexterity potion"
    DX = FNC(DX + Rand(6))
    IF LF = 0 THEN PRINT "A lamp": LF = 1
GOTO 9290

11530 FOR Q = 1 TO 64
      PRINT "*";
      NEXT Q
      PRINT
      PRINT
      RETURN
11590 PRINT
      PRINT "Your choice";
11610
    INPUT O$
    O$ = LEFT$(O$, 1)
RETURN

11640
    PRINT "How many points do you wish to add to your "; Z$;
    INPUT O$
    PRINT
    Q = VAL(O$)
    IF Q = 0 AND ASC(O$) <> 48 THEN Q = -1
    IF Q < 0 OR Q > OT OR Q <> INT(Q) THEN PRINT "** "; : GOTO 11640
    OT = OT - Q
RETURN

11750
    PRINT
    PRINT Z$;
    INPUT O$
    Q = INT(VAL(O$))
    IF Q > 0 AND Q < 9 THEN RETURN
    PRINT
    COLOR 11, 0, 15
    PRINT "** Try a number from 1 to 8."
    COLOR 3, 0, 1
GOTO 11750

11830
    PRINT
    PRINT "Do you want to buy a potion of "; Z$; " for 1000 gp's";
GOTO 11610

11860
    PRINT
    PRINT "Your "; Z$; " is now"; Q; "."
RETURN

11890
    PRINT
    PRINT "These are the types of "; Z$; " you can buy :"
RETURN

11920
    COLOR 2, 0
    PRINT "You are at ("; X; ","; Y; ") level"; Z; "."
    COLOR 3, 0
RETURN

11950
    LET JOHN! = ST + IQ + DX + GoldPieces& - T
    PRINT
    PRINT "Your score at this time is "; JOHN!
    PRINT
GOTO 4380

12000
    LPRINT "*** TEMPLE OF LOTH'S COMMAND AND INFORMATION SUMMARY ***"
    LPRINT
    LPRINT "The following commands available are:"
    LPRINT
    LPRINT "H/elp     N/orth    S/outh    E/ast     W/est     U/p"
    LPRINT "D/own     DR/ink    M/ap      F/lare    L/amp     O/pen"
    LPRINT "G/aze     T/eleport Q/uit     #/Score"
    LPRINT
    LPRINT "The contents of the rooms are as follows:"
    LPRINT
    LPRINT "ฮ = empty room      B = book            C = chest"
    LPRINT "D = stairs down     ๏ = entrance/exit    = flares"
    LPRINT "G = gold pieces      = monster         ่ = crystal orb"
    LPRINT "P = magic pool      S = sinkhole        T = treasure"
    LPRINT "U = stairs up       * = Drow            Û = warp/amulet"
    LPRINT
    LPRINT
    LPRINT "The benefits of having treasures are:"
    LPRINT
    LPRINT "RUBY RED - avoid lethargy    PALE PEARL - avoid leech"
    LPRINT "GREEN GEM - avoid forgetting  OPAL EYE - cure blindness"
    LPRINT "BLUE FLAME - dissolves books  NORN STONE - no benefit"
    LPRINT "PALANTIR - no benefit         SILMARIL - no benefit"
    LPRINT
GOTO 4380
     
12280
    PRINT
    COME = 1
    PRINT "You hear footsteps...";
    SOUND 32767, 28
    PRINT "The footsteps get louder!"
    SOUND 32767, 28
    PRINT "You hear people talking in a strange language."
    SOUND 32767, 28
    PRINT "Oh, No!! the Drow have returned!!!"
    DROW = INT(RND * 100)
    IF DROW < 10 THEN GOTO 12430
    ST = 0
    IQ = 0
    DX = 0
GOTO 10350

12430
    PRINT
    PRINT "You escaped just in time!"
    PRINT
GOTO 10510

12470
    LOCATE 25, 1
    INPUT "Press return to continue."; QWERTYU$
    CLS
    COLOR 26, 0, 1
    PRINT "  ÜÜ   ÜÜ  Ü   Ü  ÜÜ  ÜÜÜ   ÜÜ  ÜÜÜ  Ü  Ü Ü    ÜÜ  ÜÜÜÜÜ Ü  ÜÜ  Ü   Ü  ÜÜ    Ü"
    PRINT " Û  ฿ Û  Û ÛÛ  Û Û  ฿ Û  Û Û  Û Û  Û Û  Û Û   Û  Û   Û   Û Û  Û ÛÛ  Û Û  ฿  Û Û"
    PRINT " Û    Û  Û Û Û Û Û    ÛÜÜ฿ ÛÜÜÛ Û  Û Û  Û Û   ÛÜÜÛ   Û   Û Û  Û Û Û Û  ฿฿Ü  Û Û"
    PRINT " Û  Ü Û  Û Û  ÛÛ Û ฿Û Û ฿Ü Û  Û Û  Û Û  Û Û   Û  Û   Û   Û Û  Û Û  ÛÛ Ü  Û   ฿"
    PRINT "  ฿฿   ฿฿  ฿   ฿  ฿฿  ฿  ฿ ฿  ฿ ฿฿฿   ฿฿  ฿฿฿ ฿  ฿   ฿   ฿  ฿฿  ฿   ฿  ฿฿    ฿"
    COLOR 3, 0, 1
    PRINT
    PRINT
    PRINT " You have been ranked as a Lord with a score of "; JOHN!
GOTO 10880

DATA An empty room,ฮ,the entrance,๏,stairs going up,U
DATA stairs going down,D,a pool,P,a chest,C,gold pieces,G
DATA flares,,a warp,Û,a sinkhole,S,a Crystal Orb,่
DATA a book,B,a Green Slime,ฒ,an Orc,,an Evil Dwarf,,a Goblin,,a Mind Flayer,
DATA a Troll,,a Giant spider,,a Minotar,,a Drow,*,a Drider,
DATA a Balor Demon,,a Red Dragon,๋,a Drow Merchant,๊,the Ruby Red,T
DATA the Norn Stone,T,the Pale Pearl,T,the Opal Eye,T
DATA the Green Gem,T,the Blue Flame,T,the Palantir,T,the Silmaril,T
DATA X,"?",no weapon," Sandwich"
DATA Dagger," stew",Mace," soup",Sword," burger",No armor," roast"
DATA Leather," filet",Chainmail," taco",Plate mail," pie"
DATA Hobbit,Elf,Man,Dwarf

SUB Help
12600
    CLS
    COLOR 3, 0
    LOCATE 1, 28
    COLOR 27, 0
    PRINT "Temple of Loth instructions"
    COLOR 3, 0
    LOCATE 4, 3
    PRINT "  Temple of Loth is a computerized simulation of one of the most common and"
    PRINT "popular fantasy motifs, the lone adventurer's quest with an immense under"
    PRINT "ground labyrinth. Each game is separate from all others, so the game is a"
    PRINT "challenge even after you have won. Each game will result in a win or loss"
    PRINT "depending on the player's  skill and luck.  The following instructions"
    PRINT "explain the rules and options of the game."
    COLOR 3, 0
    LOCATE 12, 7
    PRINT "A. Character Creation"
    LOCATE 13, 7
    PRINT "B. Equipment"
    LOCATE 14, 7
    PRINT "C. The Temple"
    LOCATE 15, 7
    PRINT "D. Player Commands"
    LOCATE 16, 7:  PRINT "E. Magic Spells"
    LOCATE 17, 7: PRINT "F. Treasures, Curses and Such"
    LOCATE 12, 45:  PRINT "G. Drow Merchants"
    LOCATE 13, 45: PRINT "H. Monsters and The Runestaff"
    LOCATE 14, 45:  PRINT "I. Warps and the ";
    COLOR 11, 0
    PRINT "Amulet of Chaos"
    COLOR 3, 0
    LOCATE 15, 45
    PRINT "J. Error Messages"
    LOCATE 16, 45
    PRINT "K. Points and Scoring"
    LOCATE 17, 45
    PRINT "L. Return to game"

    LOCATE 20, 6
    COLOR 11, 0
    PRINT "Type the number of the section desired:";
12820
    DO
      System.Key.Get
    LOOP UNTIL Key$ <> ""
    IF Key$ = "A" THEN GOTO 13000
    IF Key$ = "B" THEN GOTO 13230
    IF Key$ = "C" THEN GOTO 13490
    IF Key$ = "D" THEN GOTO 13810
    IF Key$ = "E" THEN GOTO 14270
    IF Key$ = "F" THEN GOTO 14390
    IF Key$ = "G" THEN GOTO 14680
    IF Key$ = "H" THEN GOTO 14780
    IF Key$ = "I" THEN GOTO 14910
    IF Key$ = "J" THEN GOTO 15010
    IF Key$ = "K" THEN GOTO 15230
    IF Key$ = "L" THEN EXIT SUB
GOTO 12820

13000
    CLS
    COLOR 11, 0
    PRINT "                                  CHARACTER CREATION"
    PRINT
    COLOR 3, 0
    PRINT "  At the start of each game you will be asked a number of questions about"
    PRINT "what type of character you will have. You must make the choices as follows:"
    PRINT
    PRINT "RACE     You may be an Elf, Dwarf, Man, or Hobbit. Each score is randomly "
    PRINT "         generated, but bonus and deductions are different for each race."
    PRINT
    PRINT "GENDER   You may be a female or male. Both are equal in number of points."
    PRINT "         Be creative in your response."
    PRINT
    PRINT "POINTS   Each character starts with a number of points for the attributes"
    PRINT "         of strength (ST), intelligence (IQ), and dexterity (DX).  In addition,"
    PRINT "         there are some other points you may distribute between these three"
    PRINT "         attributes as you wish."
    PRINT
    PRINT "         Your ST, IQ, and DX may be any number from 1 to 18. If any of the "
    PRINT "         three drop below 1, you have died. For all three attributes, the "
    PRINT "         larger the numerical value, the better. "
    LOCATE 25, 1
    PRINT "Press any key to return to main menu";
    System.Key.Clear
    DO
    LOOP UNTIL INKEY$ <> ""
GOTO 12600

13230
    CLS
    COLOR 11, 0
    PRINT "                                   EQUIPMENT"
    PRINT
    COLOR 3, 0
    PRINT "    Every character is given 60 gold pieces (gp's), at the beginning of each"
    PRINT "to purchase some of the following items."
    PRINT
    PRINT "ARMOR    You may buy platemail armor for 30 gp's, chainmail for 20 gp's or"
    PRINT "         leather for 10 gp's. You can only wear one suit of armor at a time."
    PRINT "         The more expensive the armor, the more damage it will absorb."
    PRINT
    PRINT "WEAPONS  You may buy a sword for 30 gp's, a mace for 20 gp's, or a dagger for "
    PRINT "         10 gp's. You can only carry a single weapon at a time.  The more ex-"
    PRINT "         pensive the weapon, the more damage it does to the various monsters."
    PRINT
    PRINT "LAMP     If after selecting armor and weapons, you have 20 gp's left , you may"
    PRINT "         buy a lamp for 20 gp's. Having the lamp will allow you to look into"
    PRINT "         an adjacent room without having to enter it."
    PRINT
    PRINT "FLARES   If, after all purchases , you have money left, you may buy flares for"
    PRINT "         1 gp each. Lighting a flare reveals the contents of all the rooms "
    PRINT "         surrounding your current location."
    PRINT
    PRINT "         Once you have equipped your character, you are ready to enter the"
    PRINT "         Temple and begin your quest."
    LOCATE 25, 1
    PRINT "Press any key to return to main menu";
    System.Key.Clear
    DO
    LOOP UNTIL INKEY$ <> ""
GOTO 12600

13490
    CLS
    COLOR 11, 0
    PRINT "                                   THE TEMPLE"
    COLOR 3, 0
    PRINT
    PRINT "  Many generations ago, during the Great Elfin Wars"
    PRINT "temple is arranged in a 8x8x8 three dimensional matrix.  This means"
    PRINT "that there are 8 levels with 64 rooms on each level. The temple levels are"
    PRINT "are numbered from 1 (the top level) to 8 (the bottom level. Each temple level"
    PRINT "is constructed in a doughnut like fashion, in that the north edge connects"
    PRINT "to the south edge and the east edge is connected to the west edge.  In a sim-"
    PRINT "ilar fashion, the sinkholes on level 8, explained later, will drop you down"
    PRINT "to level 1. The only room that does not work in this fashion is always locat-"
    PRINT "ed at location (1,4) level 1. Going north from this room will take you out of"
    PRINT "the temple and end the game."
    LOCATE 25, 1
    PRINT "Press any key to continue";
    System.Key.Clear
    DO
    LOOP UNTIL INKEY$ <> ""
    CLS
    PRINT " Each room of the temple will have contents as one of the following."
    PRINT
    PRINT "   ๏ = The entrance / exit room"
    PRINT "   ฮ = An empty room containing nothing"
    PRINT "   U = Stairs going up a level"
    PRINT "   D = Stairs going down a level"
    PRINT "   P = Magic Pool from which you may drink"
    PRINT "   C = A chest you may open."
    PRINT "   B = A book you may open"
    PRINT "   G = From 1 to 10 gold pieces"
    PRINT "    = From 1 to 3 flares"
    PRINT "   Û = A warp to another random location"
    PRINT "    = A monster (1 of 9 different types)"
    PRINT "   * = A Drow fighter"
    PRINT "   ่ = A crystal orb"
    PRINT "   T = A treasure (1 of 8 in the castle)"
    PRINT "   ฒ = A Green Slime"
    PRINT "   4 = A Red Dragon"
    PRINT
    PRINT "     The letters are the abbreviations for the room contents which are display-  ed whenever you look at a map or light a flare. When you look at a map, the     room you are currently located in is bracketed by < >"
    LOCATE 25, 1
    PRINT "Press any key to return to main menu";
    System.Key.Clear
    DO
    LOOP UNTIL INKEY$ <> ""
GOTO 12600

13810
    CLS
    COLOR 11, 0
    PRINT "                             PLAYER COMMANDS"
    COLOR 3, 0
    PRINT
    PRINT "  Whenever the program prompts for a command, you must decide what action to"
    PRINT "preform. If your choice is not valid, the program will ignore it and let you"
    PRINT "try again.  The following is a list of commands the program understands,"
    PRINT "with a description of their effects and restrictions:"
    PRINT
    PRINT "N - Moves you to the room north from your present position.  Going"
    PRINT "    north from the entrance / exit room terminates the game."
    PRINT "    In all other cases, the north edge wraps around to the south."
    PRINT
    PRINT "S - Moves you to the room south of your present position."
    PRINT "    In all cases, the south edge wraps around to the north."
    PRINT
    PRINT "E - Moves you to the room east of your present position."
    PRINT "    In all cases, the east edge wraps around to the west."
    PRINT
    PRINT "W - Moves you to the room west of your present position."
    PRINT "    In all cases, the west edge wraps around to the east."
    PRINT
    PRINT "U/D - In a room containing stairs, causes you to ascend/descend the stairs."
    LOCATE 25, 1
    PRINT "Press any key to continue";
    System.Key.Clear
    DO
    LOOP UNTIL INKEY$ <> ""
    CLS
    PRINT "D - In a room with a pool, causes you to take a drink"
    PRINT "    You may repeat this command as often as you wish."
    PRINT
    PRINT "NOTE:  These next three items when you have one, are not blind,"
    PRINT "       and are not fighting a monster"
    PRINT
    PRINT "M - Causes a map of the level you are currently on to be printed."
    PRINT "    All unexplored rooms are displayed as `?'.  All other rooms are"
    PRINT "    displayed as their one character symbols."
    PRINT
    PRINT "F - Cause one of your flares to be lit, revealing the contents of all the"
    PRINT "    rooms surrounding your current location. Because each edge is joined to"
    PRINT "    the opposite edge, you will always see nine rooms from your location"
    PRINT
    PRINT "L - Allows you to shine your lamp into any one of the rooms north, south,"
    PRINT "    east, and west of your current position, revealing the room contents."
    PRINT "    Unlike flares, the lamp may be used repeatedly."
    PRINT
    PRINT "O - Causes you to open a book or a chest which is in the room with you."
    LOCATE 25, 1
    PRINT "Press any key to continue";
    System.Key.Clear
    DO
    LOOP UNTIL INKEY$ <> ""
    CLS
    PRINT "G - Causes you to gaze into a crystal orb. When you see yourself in a"
    PRINT "    bloody mess, you lose 1 or 2 points of strength.  When you see the"
    PRINT "    location of the ";
    COLOR 11, 0
    PRINT "Amulet of Chaos";
    COLOR 3, 0
    PRINT ", there is only a 50% chance that it"
    PRINT "    is correct. You cannot gaze when you are blind or when you are not in"
    PRINT "    a room containing a crystal orb."
      PRINT
      PRINT " TELE-   Allows you to teleport directly into a specific room any where in the   PORT    temple. This is the only way you can can enter the room containing              the";
      COLOR 11, 0, 1: PRINT " Amulet of Chaos."; : COLOR 3, 0, 1
      PRINT " You must have the Runestaff to teleport!"
      PRINT
      PRINT " QUIT    Allows you to end the game while you are still in the temple. You will          be asked if you are, in case you change your mind. If you quit, you             will lose the game."
      PRINT
      PRINT " HELP    Causes a summary of available commands, abbreviations used in des-               cribing the contents of rooms, and the benefits of possessing each of            the treasures to be displayed at any time."
    LOCATE 25, 1
    PRINT "Press any key to return to main menu";
    System.Key.Clear
    DO
    LOOP UNTIL INKEY$ <> ""
14270 CLS
      COLOR 11, 0, 2
      PRINT "                      MAGIC SPELLS"
      COLOR 3, 0, 1: PRINT
      PRINT "     When ever your intelligence (IQ) becomes 15 or higher, you gain the option  of casting a magic spell on a monster if you have the very first combat         option. The three spells and there effects are as follows:"
      PRINT
      PRINT " WEB     Traps the monster in a sticky web so that it can't fight back as you            attack it. This spell lasts from 2 to 9 turns and costs you one                 strength (ST) point."
      PRINT
      PRINT " FIRE-   Hits the monster with a ball of flame that causes between 2 and 14      BALL    points worth of damage instantly. It costs one strength points and one          point of intelligence."
      PRINT
      PRINT " DEATH   is a contest of will between the monster and yourself, whoever has"
      PRINT "the lower intelligence dies at once. It costs nothing to use, but it"
      PRINT "is very risky. Even with an IQ of 18 (the highest possible), you"
      LOCATE 25, 1: INPUT "Press enter to return to main menu"; B$
GOTO 12600

14390 CLS
      COLOR 11, 0, 1
      PRINT "                       TREASURE, CURSES, AND SUCH"
      COLOR 3, 0, 1
      PRINT
      PRINT "     In the temple there are eight randomly placed treasures:"
      PRINT
      PRINT " The Ruby Red - Wards off the curse of lethargy."
      PRINT " The Pale Pearl - Wards off the curse of the leech."
      PRINT " The Opal Eye - Cures blindness."
      PRINT " The Green Gem - Wards off the curse of forgetfulness."
      PRINT " The Blue Flame - Dissolves books stuck to your hands."
      PRINT " The Norn Stone - Has no special power."
      PRINT " The Palantir - Has no special power."
      PRINT " The Silmaril - Has no special power."
       PRINT
      PRINT "     THERE ARE THREE CURSES:"
      PRINT
      PRINT " LETHARGY - This gives the monster the first attack which prevents you from"
      PRINT "bribing him or casting a spell on them."
      PRINT
      PRINT " LEECH - This takes from 1 to 5 gp's from you each turn until you have no gold"
      PRINT "         left at all!"
      PRINT
      LOCATE 25, 1: INPUT "Press return to continue"; B$
      LOCATE 25, 1: PRINT "                            "
      LOCATE 20, 1
      PRINT " FORGETFULNESS - This causes you to forget what you know about each level of the          temple.  Your map will slowly turn back to all question marks, How-             ever, the contents of the rooms stay the same."
      PRINT
      PRINT "     In addition to nullifying the effects of the curses, the treasures can"
      PRINT "     also provide protection from two undesirable things which can happen "
      PRINT "     when you open a book.  These are going blind, which prevents you from"
      PRINT "     seeing your maps, lighting flares, using your lamp, gazing into orbs, and"
      PRINT "     being informed or your current location; and secondly, having a book"
      PRINT "     stuck to your hands, which prevents you to draw your weapon to fight"
      LOCATE 25, 1: INPUT "Press enter to return to main menu"; B$
GOTO 12600

14680
    CLS
    COLOR 11, 0, 1
    PRINT "                             DROW MERCHANTS"
    COLOR 3, 0, 1
    PRINT
    PRINT "   On every level there are Drow Merchants who sell necessary items at"
    PRINT " inflated prices. Normally, the merchants will make you an offer for every"
    PRINT " treasure you have, and then, depending on the amount of gold you have, will"
    PRINT " sell you new armor, a new weapon, a potion of strength, intelligence, and "
    PRINT " dexterity (no matter how many potions you buy, the maximum amount for these"
    PRINT " attributes is 18), and a lamp, if you don't already have one. If you chose to"
    PRINT " attack the merchant, you will antagonize every one in the temple, and they"
    PRINT " will all react as monsters. You will also lose the ability to trade with"
    PRINT " them. Killing a merchant, however, will give you new platemail, a sword, one"
    PRINT " of each kind of potion, and a lamp (if you don't already have one, in"
    PRINT " addition to his hoard of between 1 and 1000 gold pieces. To end hostilities"
    PRINT " and reestablish trading privileges, you must bribe any Merchant Drow in the"
    PRINT " castle with the treasure of his choice."
    LOCATE 25, 1
      INPUT "Press enter to return to main menu"; B$
GOTO 12600

14780
    CLS
    COLOR 11, 0, 1
    PRINT "                         MONSTERS AND THE RUNESTAFF"
    COLOR 3, 0, 1
    PRINT
    PRINT "     There are 12 types of monsters in the temple:"
    PRINT
    PRINT " Green Slime, Orcs, Evil Dwarfs, Goblins, Mind Flayers, Trolls, Giant Spiders    Minotaurs, Driders, Balor Demon, Reds Dragons, and Drow Warriors."
    PRINT
    PRINT "  Please note that each time you strike a Drow Warrior or a Red Dragon,"
    PRINT "there is a chance that your weapon will be shattered."
    PRINT
    PRINT "  Each monster possesses a hoard of from 1 to 1000 gp's which you obtain"
    PRINT "when you kill a monster. In addition, one of the monsters is also carring The"
    PRINT "Runestaff, (you won't know which until one until you kill it). You must have"
    PRINT "The Runestaff to teleport, and when you teleport into the room with The"
    PRINT "Amulet of Chaos, The Runestaff will disappear. (You must find your way out of"
    PRINT "the temple without it)."
    LOCATE 25, 1
    INPUT "Press enter to return to main menu"; B$
GOTO 12600

14910
    CLS
    COLOR 11, 0, 1
    PRINT "                         WARPS AND THE";
    COLOR 27, 0, 1: PRINT "AMULET OF CHAOS"
    COLOR 3, 0, 1: PRINT
    PRINT "      All but one of the rooms denoted as `Û' are truly warps. Walking,"
    PRINT "      falling, or teleporting into one of these warps will cause you to be instantly"
    PRINT "      transported to anywhere in the temple at random. The one exception to this"
    PRINT "      rule is the room containing the ";
    COLOR 11, 0, 1
    PRINT " Amulet of Chaos";
    COLOR 3, 0, 1
    PRINT ".  This room is disguised as a"
    PRINT "warp. Walking into this room causes you to move one room further in the same"
    PRINT "direction. To actually enter this room, you must teleport in using The Rune-"
    PRINT "staff. At this point, you will acquire ";
    COLOR 11, 0, 1
    PRINT "The Amulet of Chaos";
    COLOR 3, 0, 1
    PRINT ". The Runestaff will"
    PRINT " disappear at this point. Remember, to win the game, you must leave the temple"
    PRINT "with the amulet in your possession."
    LOCATE 25, 1
    PRINT "Press any key to return to main menu";
    System.Key.Clear
    DO
    LOOP UNTIL INKEY$ <> ""
    CLS
GOTO 12600

15010
    CLS
    COLOR 11, 0
    PRINT "                             ERROR MESSAGES"
15030
    COLOR 3, 0
    PRINT
    PRINT "     Anytime you receive a highlighted message with a `**', it means that the     last thing you typed was unacceptable to the program at the time. For in- "
    PRINT " stance ";
    COLOR 11, 0, 1
    PRINT "** It's hard to gaze without an orb.";
    COLOR 3, 0, 1:
    PRINT ", this means that you tried to"
    PRINT " gaze from a room which did not contain a crystal orb. You are always required"
    PRINT " to redo your last response when you receive an `**' message."
    LOCATE 25, 1
    INPUT "Press enter to return to main menu"; B$
GOTO 12600

15230
    CLS
    CALL Font.Regular("POINTS AND SCORING", Center(LEN("POINTS AND SCORING"), 1, 80), 1, 11)
    PRINT "The scoring formula goes as follows:"
    PRINT
    PRINT "     1 point for each gold piece  +  100 times your combined attribute scores"
    PRINT
    PRINT "       + 1000 points for each monster killed  - 5 times the turns played"
    PRINT
    PRINT " Bonus points are scored as follows:"
    PRINT
    PRINT "                  5000 for each treasure"
    PRINT "                 10000 for finding the Runestaff"
    PRINT "                 20000 for finding the Amulet of Chaos"
    PRINT
    PRINT " You will then be ranked into one of the following classes:"
    PRINT
    PRINT "             0 - 20000  Whimp                  20000 - 35000  Peasent"
    PRINT "         35000 - 50000  Ameteur                50000 - 75000  Scout"
    PRINT "         90000 -110000  Adventurer            110000 -125000  Hero"
    PRINT "        125000 -140000  Wizard                140000+  Lord"
    PRINT
    PRINT "  The highest score to date is that of Lord Nurฃcc: 142,498"
    LOCATE 25, 1
    LINE INPUT "Press enter to return to Main Menu"; B$
GOTO 12600
END SUB

SUB Info.1
    CLS
    LOCATE 1, 7
    PRINT "ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป";
    LOCATE 2, 7
    PRINT "ฬอออออออออออออออออน";
    COLOR 27, 0
    PRINT "* * * THE TEMPLE OF LOTH * * *";
    COLOR 3, 0
    PRINT "ฬออออออออออออออออน";
    LOCATE 3, 7
    PRINT "ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน";
    LOCATE 4, 7
    PRINT "บ                                                                 บ";
    LOCATE 5, 7
    PRINT "บ      Many generations ago, during the Great Elfin Wars of the   บ";
    LOCATE 6, 7
    PRINT "บ   first age, there stood the majestic temple of the Drow.  The  บ";
    LOCATE 7, 7
    PRINT "บ   Drow are an evil race of elves dedicated to the  destruction  บ";
    LOCATE 8, 7
    PRINT "บ   of all elves but themselves. During this time they were rul-  บ";
    LOCATE 9, 7
    PRINT "บ   ed by the the evil priestess,Tar-Anclime, a great sorceress.  บ"
    LOCATE 10, 7
    PRINT "บ   Under the aid of her goddess Loth, she created the ";
    COLOR 11, 0
    PRINT "Amulet of";
    COLOR 3, 0
    PRINT "  บ";
    LOCATE 11, 7
    PRINT "บ";
    COLOR 11, 0
    PRINT "   Chaos";
    COLOR 3, 0
    PRINT " which was to be used to aid her side in the final des-  บ";
    LOCATE 12, 7
    PRINT "บ   truction of their rivals. The Drow massed for The final con-  บ";
    LOCATE 13, 7
    PRINT "บ   flict but they were attacked by their rival forces and there  บ"
    LOCATE 14, 7
    PRINT "บ   they were utterly destroyed. Now thousands of years later it  บ"
    LOCATE 15, 7
    PRINT "บ   is said that in the  kingdom of Rhyl that the descendents of  บ"
    LOCATE 16, 7
    PRINT "บ   the Drow are massing. The Drow plan to return to claim their  บ";
    LOCATE 17, 7
    PRINT "บ   homeland to retrieve the ";
    COLOR 11, 0
    PRINT "Amulet of Chaos";
    COLOR 3, 0
    PRINT " so they can finally  บ";
    LOCATE 18, 7
    PRINT "บ   destroy the elves of good. Living in the village shadowed by  บ";
    LOCATE 19, 7
    PRINT "บ   now crumbling  temple, you have been  chosen to retrieve the  บ";
    LOCATE 20, 7
    PRINT "บ   Amulet  before the Drow  return so that it can be destroyed.  บ";
    LOCATE 21, 7
    PRINT "บ   There are many  dangers that live in the  mazes of the ruins  บ";
    LOCATE 22, 7
    PRINT "บ   such as powerful  and  magic  monsters.  It is even believed  บ";
    LOCATE 23, 7
    PRINT "บ   that some of the Drow still live in ruins.";
    COLOR 28, 0
    PRINT "    BEWARE!!!";
    COLOR 3, 0
    PRINT "       บ";
    LOCATE 24, 7
    PRINT "บ                                                                 บ";
    LOCATE 25, 7
    PRINT "ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน";
    SOUND 32729, 600
    CALL System.Delay(2)
END SUB

SUB Show
    COLOR 3, 0
    FOR a = 60 TO 20 STEP -1
        COLOR 2, 0
        LOCATE 5, a
        PRINT "   _______    "
        CALL System.Delay(.01)
    NEXT a

    FOR a = 1 TO 20
        LOCATE 6, a
        PRINT "  /";
        COLOR 3, 0
        PRINT "þþþþþþþ";
        COLOR 2, 0
        PRINT "\   "
        CALL System.Delay(.01)
    NEXT a

    FOR a = 60 TO 20 STEP -1
        LOCATE 7, a
        PRINT " /";
        COLOR 3, 0
        PRINT "þ";
        COLOR 15, 0
        PRINT "Fantasy";
        COLOR 3, 0
        PRINT "þ";
        COLOR 2, 0
        PRINT "\  "
        CALL System.Delay(.01)
    NEXT a
    FOR a = 1 TO 20
        LOCATE 8, a
        PRINT " \";
        COLOR 3, 0
        PRINT "þþ";
        COLOR 15, 0
        PRINT "Warez";
        COLOR 3, 0
        PRINT "þþ";
        COLOR 2, 0
        PRINT "/  "
        CALL System.Delay(.01)
   NEXT a
   FOR a = 60 TO 20 STEP -1
       LOCATE 9, a
       PRINT "  \";
       COLOR 3, 0, 1
       PRINT "þþ";
       COLOR 15
       PRINT "Inc";
       COLOR 3
       PRINT "þþ";
       COLOR 2, 0
       PRINT "/   "
       CALL System.Delay(.01)
   NEXT a
   COLOR 2
   FOR a = 1 TO 20
       LOCATE 10, a
       PRINT "     \_/      "
       CALL System.Delay(.01)
   NEXT a
   COLOR 12, 0
   FOR a = 1 TO 8
       LOCATE a, 35
       PRINT "Presents";
       COLOR 31
       PRINT ". . . ."
       COLOR 12
       CALL System.Delay(.01)
   NEXT a
   CALL System.Delay(.1)
   COLOR 12
   FOR a = 1 TO 8
       LOCATE a, 35
       PRINT "                         "
       CALL System.Delay(.01)
   NEXT a
   LOCATE 8, 35
   PRINT "Presents";
   COLOR 15
   PRINT ". . . ."
   COLOR 15, 0, 1
   PLAY "MST155O2L8A#A#O3L4CO2A#O3CL1DP5L10D"
   LOCATE 5, 20: PRINT "   ÜÜÜÜÜÜÜ    "
   LOCATE 6, 20: PRINT "  ÛÛÛÛÛÛÛÛÛ   "
   LOCATE 7, 20: PRINT " ÛÛฒSmurfsÛÛ  "
   LOCATE 8, 20: PRINT " ÛÛÛฒdieฒÛÛÛ  "
   LOCATE 9, 20: PRINT "  ÛÛÛฑฑฑÛÛÛ   "
   LOCATE 10, 20: PRINT "     ÛฑÛ      "
   CALL System.Delay(.1)
   LOCATE 5, 20: PRINT "              "
   LOCATE 6, 20: PRINT "              "
   LOCATE 7, 20: PRINT "              "
   LOCATE 8, 20: PRINT "              "
   LOCATE 9, 20: PRINT "              "
   LOCATE 10, 20: PRINT "              "


   COLOR 12, 0
   LOCATE 8, 35
   PRINT "Presents";
   COLOR 15
   PRINT " . . . "
   COLOR 12

   FOR a = 35 TO 5 STEP -2
       LOCATE 8, a
       PRINT "Presents";
       COLOR 31
       PRINT " . . ."
       COLOR 12
       CALL System.Delay(.01)
   NEXT a
  
   FOR a = 70 TO 16 STEP -1
       LOCATE 8, a
       PRINT " "
   NEXT
    FOR a = 8 TO 2 STEP -1
        LOCATE a, 5
        PRINT "Presents";
        COLOR 31, 0, 1
        PRINT " . . ."
        CALL System.Delay(.01)
        LOCATE a, 5
        PRINT "                     "
        COLOR 12
    NEXT a
    COLOR 12
    LOCATE 2, 5
    PRINT "Presents";
    COLOR 31
    PRINT " . . ."
    COLOR 2
    FOR a = 1 TO 2
    LOCATE 5, 40
    PRINT "-"
    LOCATE 5, 40
    SOUND 32729, 1
    PRINT "\"
    LOCATE 5, 40
    SOUND 32729, 1
    PRINT "ณ"
    LOCATE 5, 40
    SOUND 32729, 1
    PRINT "/"
    LOCATE 5, 40
    SOUND 32729, 1
    PRINT "-"
    LOCATE 5, 40
    SOUND 32729, 1
    PRINT "\"
    LOCATE 5, 40
    SOUND 32729, 1
    PRINT "ณ"
    LOCATE 5, 40
    SOUND 32729, 1
    PRINT "/"
    LOCATE 5, 40
    SOUND 32729, 1
    PRINT "-"
    NEXT
    LOCATE 5, 40
    PRINT "A"
    COLOR 1
    PRINT "     Ü                     Û     Ü    Ü              ÜÜ"
    PRINT "     Û      ÜÜÜ  Ü ÜÜ   ÜÜÜÛ     Û฿Ü  Û Ü   Ü Ü ÜÜ   Ü฿ Ü   Ü  ÜÜÜ   ÜÜÜ "
    PRINT "     Û     Û   Û Û฿  ฿ Û   Û     Û  ฿ÜÛ Û   Û Û฿  ฿     Û   Û Û   ฿ Û   ฿"
    PRINT "     ÛÜÜÜÜ ฿ÜÜÜ฿ Û     ฿ÜÜÜ฿     Û    Û ฿ÜÜÜ฿ Û         ฿ÜÜÜ฿ ฿ÜÜÜ฿ ฿ÜÜÜ฿"
    COLOR 2
    PRINT "                  -----------";
    COLOR 3
    PRINT "Great Empire of Melnibone";
    COLOR 2
    PRINT "----------"
    COLOR 14
    PRINT "                                                _"
    PRINT "                                           ";
    COLOR 1
    PRINT "_____"; : COLOR 14
    PRINT " []\"
    COLOR 7
    PRINT "                       < < < < < < < < < < ";
    COLOR 1: PRINT "_____"; : COLOR 15: PRINT "[";
    COLOR 12
    PRINT ":*";
    COLOR 15: PRINT "]";
    COLOR 6: PRINT "######";
    COLOR 14: PRINT "["; : COLOR 2: PRINT ">": COLOR 14
    PRINT "                                  _             _[]/"
    PRINT "                               /[] ";
    COLOR 1
    PRINT "_____"
    COLOR 2
    PRINT "                       <";
    COLOR 14
    PRINT "]";
    COLOR 6
    PRINT "######";
    COLOR 15: PRINT "[";
    COLOR 12: PRINT "*:";
    COLOR 15
    PRINT "]";
    COLOR 9
    PRINT "_____";
    COLOR 7
    PRINT "> > > > > > > > > > "
    COLOR 14
    PRINT "                               \[]_"
    PRINT "                                                                "
    COLOR 2: PRINT "                  -----";
    COLOR 11, 0, 1
    PRINT "Call  the Dark Bay at (415) 490-3179";
    COLOR 2
    PRINT "-----"
    FOR I = 1 TO 30
        LOCATE 11, 33
        COLOR 15
        PRINT "> >";
        COLOR 3
        PRINT " Creation ";
        COLOR 15
        PRINT "< <"
        LOCATE 13, 1
        COLOR 7
        PRINT "                        < < < < < < < < < <"
        LOCATE 16, 41
        COLOR 7
        PRINT "> > > > > > > > > > "
        CALL System.Delay(.01)
        LOCATE 13, 1
        COLOR 7
        PRINT "                       < < < < < < < < < < "
        LOCATE 16, 41
        COLOR 7
        PRINT " > > > > > > > > > >"
        LOCATE 11, 33
        COLOR 15
        PRINT " > "
        LOCATE 11, 46
        PRINT " < "
        CALL System.Delay(.01)
    NEXT I
    CLS
    PRINT
    COLOR 14, 0, 1
   
    'FOR QWER = 220 TO 196 STEP -1
    '    SOUND QWER, 1
    'NEXT QWER
   
    FOR a = 1 TO 18
        LOCATE a, 31
        PRINT "by Lord Nurฃcc"
        SOUND 221 - a, 1
        LOCATE a, 31
        PRINT "              "
    NEXT a
    LOCATE 18, 31
    PRINT "by Lord Nurฃcc"
    COLOR 12
    LOCATE 2, 1
    PRINT "            ÜÜÜÜÜ ÜÜÜÜ Ü   Ü ÜÜÜÜ  Ü    ÜÜÜÜ           ÜÜÜ   ÜÜÜÜ"
    PRINT "              Û   Û    ÛÛ ÛÛ Û   Û Û    Û             Û   Û  Û"
    PRINT "              Û   Û฿฿  Û Û Û Û฿฿฿  Û    Û฿฿           Û   Û  Û฿฿"
    PRINT "              Û   ÛÜÜÜ Û   Û Û     ÛÜÜÜ ÛÜÜÜ          ฿ÜÜÜ฿  Û"
    PRINT
    PRINT
    PRINT "                  Ü     ÜÜÜ  ÜÜÜÜÜ  Ü  Ü            ÜÜÜÜÜÜ"
    PRINT "                  Û    Û   Û   Û    Û  Û          Ü฿ Û  Û ฿Ü"
    PRINT "                  Û    Û   Û   Û    Û฿฿Û        Ü฿   Û  Û   ฿Ü"
    PRINT "                  ÛÜÜÜ ฿ÜÜÜ฿   Û    Û  Û      ÜÛÜÜÜÜÜÛÜÜÛÜÜÜÜÜÛÜ"
    PRINT
    COLOR 15, 0, 1
    FOR a = 1 TO 32
        LOCATE 13, a
        PRINT "  VERSION 4.13"
        CALL System.Delay(.01)
    NEXT a
    COLOR 31
    LOCATE 13, 30
    PRINT "    VERSION 4.13  "
    COLOR 3, 0, 1
    PRINT "                              November 11, 1984"
    COLOR 3, 0, 1
    PRINT "              Suggested for use with printer and graphics board"
    PRINT
    PRINT "                           A Fantasy Warez Program"
    COLOR 14
    PRINT "                               by Lord Nurฃcc"
    PRINT "                            (Nurฃcc the Chaotic)"
    PRINT
    COLOR 10, 0
    PRINT "                       of the Great Empire of Melnibone'"
    COLOR 3, 0
    SOU = INT(RND * 2 + 1)
    ON SOU GOTO 1270, 1290
1270
    PLAY "O1MFT155L2DL4EL2FDL1GG#"
EXIT SUB

1290
    PLAY "O1MLT155L2GP10EP10L1F#"
END SUB

SUB Stars
    FOR J = 1 TO 200
        I = (RND * 360)
        F = (RND * 120)
        FOR R = 1 TO 0 STEP -1
            CIRCLE (I, F), R, 3
        NEXT R
    NEXT J
END SUB

SUB TemplePicture
    CIRCLE (20, 20), 20
    PAINT (30, 30), 2, 3
    CIRCLE (240, 30), 15
    PAINT (240, 30), 1, 3
    PSET (60, 125)
    DRAW "e100;f100;l199"
    LINE (360, 125)-(0, 360), , BF
    PAINT (100, 100), 3
    LINE (360, 125)-(0, 360), 1, BF
END SUB

