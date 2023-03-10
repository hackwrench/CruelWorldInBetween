DEFINT A-Z

DECLARE SUB Help.Hobbit ()
   
    DIM H(9, 9), M(9, 9), A(7), D(14), AC(7), Z(4)
   
    RANDOMIZE TIMER
   
    A$ = "RUBY RED  NORN STONEPALE PEARLOPAL EYE  BLUE FLAMEPALANTIR  SILMARILL     "
    D$ = "SCHLOCK   YNGVI     GOLLUM    MARDUK    LOKI      AZATOTH   DAGON     FENRIS    ABRACAX   SAURON    CTHULHU   SATAN    "
   
    SCREEN 0
    WIDTH 80
    COLOR 7, 0
    CLS
   
    PRINT "H O B B I T"
100 PRINT "DO YOU WANT INSTRUCTIONS    ";
    IF YesNo THEN CALL Help.Hobbit
    DO
      INPUT "WHAT RATING (1-NOVICE 9-EXPERT)"; N
       N = INT(ABS(N))
    LOOP WHILE N < 1 OR N > 9
    FOR X = 1 TO 9
        FOR Y = 1 TO 9
            H(X, Y) = 5
            M(X, Y) = 1
        NEXT Y
    NEXT X
REM PUT WARPS
    B = 20 + RND * N
    FOR Q = 1 TO B
        DO
          X = RND * 9
          Y = RND * 9
          R = RND * 9
          S = RND * 9
        LOOP WHILE X = S AND Y = R
    H(X, Y) = R * 10 + S
    NEXT Q
REM PUT DEMONS
    B = N + 3
    FOR Q = 1 TO B
        GOSUB 2440
        H(X, Y) = -Q
        D(Q) = 1
    NEXT Q
REM PUT AMULETS
    FOR Q = 1 TO 7
        GOSUB 2440
        H(X, Y) = Q * 100
        A(Q) = 1
        AC(Q) = 3
    NEXT Q
    REM PUT RUNESTAFF
    GOSUB 2440
    H(X, Y) = -1 * (RND * (N + 3))
    D(13) = 1
    Z(3) = X
    Z(4) = Y
    REM PUT ORB
    GOSUB 2440
    H(X, Y) = 10 * (RND * 9) + (RND * 9)
    Z(1) = X
    Z(2) = Y
    D(14) = 1
    REM PUT CURSES
    FOR Q = 1 TO 3
        C(Q, 1) = 1
        C(Q, 2) = 10
        C(Q, 3) = 10
    NEXT Q
    IF N < 7 THEN GOTO 470
    FOR Q = 1 TO N - 6
        GOSUB 2440
        C(Q, 2) = X
        C(Q, 3) = Y
    NEXT Q
470 REM PUT FLARES AND ORACLE
    GOSUB 2440
    H(X, Y) = 4
    GOSUB 2440
    H(X, Y) = 2
    REM PUT HOBBIT
    GOSUB 2440
    K = X
    L = Y
    PRINT "ALL RIGHT FUR-FOOT "
    P = 125 + RND(12 - N)
    T = 1
    G = 0
    W = 0
    F = 10
GOTO 1530

520 IF T > P THEN GOTO 2120
    T = T + 1
    IF N < 7 OR D(14) = 0 THEN GOTO 650
550 IF C(1, 1) = 1 THEN GOTO 570
    T = T + 1
570 IF C(2, 1) = 1 THEN GOTO 590
    G = G - (RND * 5)
590 IF C(3, 1) = 1 OR A(5) = 0 OR D(14) = 0 THEN 610
    PRINT
    PRINT "'YOU ARE UNDER MY POWER NOW...'"
    FOR Q = 1 TO 500
    NEXT Q
    ON (RND * 4) GOTO 810, 830, 850, 870
610 FOR Q = 1 TO 3
    IF C(Q, 2) <> K OR C(Q, 3) <> L THEN GOTO 640
    C(Q, 1) = 0
640 NEXT Q
REM GET COMMNAND
650 PRINT
    INPUT "YOUR MOVE"; O$
    CLS
    IF O$ = "WAIT" OR O$ = "WT" THEN GOTO 1530
670 IF O$ = "NORTH" OR O$ = "N" THEN GOTO 810
    IF O$ = "SOUTH" OR O$ = "S" THEN GOTO 830
    IF O$ = "EAST" OR O$ = "E" THEN 850
    IF O$ = "WEST" OR O$ = "W" THEN 870
    IF O$ = "MAP" OR O$ = "M" THEN 890
    IF O$ = "FLARE" OR O$ = "F" THEN 1110
    IF O$ = "KILL" OR O$ = "K" THEN 2030
    IF O$ = "LAMP" OR O$ = "L" THEN 1200
    IF O$ = "QUIT" OR O$ = "Q" THEN 1460
    IF O$ = "TELEPORT" OR O$ = "T" THEN 1420
770 PRINT "EVEN A STUPID HOBBIT LIKE YOU"
    PRINT "CAN DO BETTER THAN THAT"
    GOTO 520
    REM NORTH
810 K = K - 1
811 GOSUB 2460
    GOTO 1530
    REM SOUTH
830 K = K + 1
    GOTO 811
    REM EAST
850 L = L + 1
    GOTO 811
    REM WEST
870 L = L - 1
    GOTO 811
    REM MAP
890 CLS : PRINT "        1     2     3     4     5     6     7     8     9"
    PRINT "    +---+-----+-----+-----+-----+-----+-----+-----+-----+"
    FOR X = 1 TO 9
    PRINT X; "-| ";
    FOR Y = 1 TO 9
    IF M(X, Y) > 99 THEN 930
    PRINT " ";
930 PRINT M(X, Y); " ";
    IF M(X, Y) > 9 OR M(X, Y) < -9 THEN 960
    PRINT " ";
960 NEXT Y
    PRINT
    NEXT X: PRINT
    PRINT "YOU ARE AT ("; L; ","; K; ")": GOSUB 986: GOTO 520
986 IF G > -1 THEN 990
    G = 0
990 PRINT "YOU HAVE"; G; "GEMS"
     PRINT "AND THESE AMULETS:"
     FOR Q = 1 TO 7
     IF A(Q) = 1 THEN 1040
     PRINT " "; MID$(A$, Q * 10 - 9, 10),
1040 NEXT Q
     IF D(13) = 1 THEN 1070
     PRINT "  RUNESTAFF",
1070 IF D(14) = 1 THEN 1090
     PRINT "  ORB OF ZOT";
1090 RETURN
     REM FLARE
1110 IF F > 0 THEN 1140
     PRINT "EVEN A SCATTER-BRAINED HOBBIT LIKE YOU"
     PRINT "SHOULD KNOW WHEN HE IS OUT OF FLARES": GOTO 520
1140 F = F - 1: X = K: Y = L
     FOR Q = -1 TO 1: FOR QQ = -1 TO 1: K = Q + X: L = QQ + Y
     GOSUB 2460
     M(K, L) = H(K, L)
     IF M(K, L) > 99 THEN 1170: PRINT " ";
1170 PRINT M(K, L); "  "; : IF M(K, L) > 9 OR M(K, L) < 0 THEN 1180: PRINT " ";
1180 NEXT QQ
     PRINT
     NEXT Q
     K = X
     L = Y
GOTO 520


1200 REM LAMP
    INPUT "WHICH DIRECTION DO YOU SHINE THE LAMP"; O$
    X = K
    Y = L
    IF O$ <> "NORTH" AND O$ <> "N" THEN GOTO 1220
    Q = 1: GOTO 1250
1220 IF O$ <> "SOUTH" AND O$ <> "S" THEN 1230
     Q = 2: GOTO 1250
1230 IF O$ <> "EAST" AND O$ <> "E" THEN 1240
     Q = 3: GOTO 1250
1240 IF O$ <> "WEST" AND O$ <> "W" THEN 770
     Q = 4
1250 PRINT "THE MAGIC LAMP SHINES AND AT ";
     ON Q GOTO 1260, 1270, 1280, 1290
1260 K = K - 1: GOTO 1300
1270 K = K + 1: GOTO 1300
1280 L = L + 1: GOTO 1300
1290 L = L - 1
1300 GOSUB 2460
     PRINT "("; L; ","; K; ") YOU SEE "; : M(K, L) = H(K, L)
     IF M(K, L) < 0 THEN 1380
     IF M(K, L) > 0 THEN 1330
     PRINT "AN EMPTY ROOM": GOTO 1365
1330 IF M(K, L) > 2 THEN 1340
     PRINT "THE ORACLE": GOTO 1365
1340 IF M(K, L) > 4 THEN 1350
     PRINT "THE SPARE FLARES": GOTO 1365
1350 IF M(K, L) > 5 THEN 1360
     PRINT "GEMS": GOTO 1365
1360 IF M(K, L) > 99 THEN 1370
     PRINT "A WARP"
1365 K = X: L = Y: GOTO 520
1370 PRINT "THE "; MID$(A$, (M(K, L) / 100) * 10 - 9, 10): GOTO 1365
1380 PRINT MID$(D$, -M(K, L) * 10 - 9, 10)
     IF K = Z(3) AND L = Z(4) THEN 1365
     PRINT "AND HE IS SO ANGRY HE COMES AFTER YOU"
     H(X, Y) = H(K, L): M(X, Y) = M(K, L): M(K, L) = 0: H(K, L) = 0: K = X: L = Y: GOTO 1530
     REM TELEPORT
1420 IF D(13) = 0 THEN 1440
     PRINT "LAME-BRAIN HOBBIT MUST BE SUICIDAL"
     PRINT "TO TRY AND TELEPORT WITHOUT THE RUNESTAFF": GOTO 520
1440 INPUT "X-COORD "; L: IF L < 0 OR L > 9 THEN 1440
1441 INPUT "Y-COORD "; K: IF K < 0 OR K > 9 THEN 1441
     FOR Q = 1 TO 7: A(Q) = 1: NEXT Q: G = 0: M(K, L) = H(K, L): GOTO 1530
1460 REM QUIT
     INPUT "DO YOU REALLY WANT TO QUIT"; O$: IF O$ = "YES" OR O$ = "Y" THEN W = 1: GOTO 1481
     PRINT "THEN DON'T SAY YOU DO"
GOTO 520
1481 PRINT : IF D(14) = 0 AND W = 1 THEN PRINT "WELL, LITTLE HOBBIT, YOU WON THIS ONE" ELSE PRINT "TOO BAD YOU DIDN'T WIN, HOBBIT"
     PRINT : GOSUB 986
     PRINT : PRINT "AND YOU KILLED THESE DEMONS:": Q = 0
1484 Q = Q + 1: IF D(Q) = 0 THEN PRINT MID$(D$, Q * 10 - 9, 10),
     IF Q < N + 3 THEN GOTO 1484
     PRINT
     PRINT "DO YOU WANT TO PLAY AGAIN   ";
     IF YesNo THEN
        PRINT "SOME HOBBITS NEVER LEARN"
        GOTO 100
     END IF
1510 PRINT "MAYBE DUMB HOBBIT NOT SO DUMB AFTER ALL"
END

1530 PRINT "YOU ARE AT ("; L; ","; K; ")": M(K, L) = H(K, L)
     IF M(K, L) < 0 THEN 1850
     IF M(K, L) = 0 THEN 1650
     IF M(K, L) = 2 THEN 1660
     IF M(K, L) = 4 THEN 1630
     IF M(K, L) = 5 THEN 1620
     IF M(K, L) < 100 THEN 1790
     PRINT "WHERE YOU FIND "; MID$(A$, M(K, L) / 10 - 9, 10): A(M(K, L) / 100) = 0: GOTO 1640
1620 Q = (RND * 5): H(K, L) = 0: M(K, L) = 0: G = G + Q: IF G >= 0 THEN 1622
     G = Q
1622 PRINT "HERE YOU FIND"; Q; "GEMS"
     PRINT "YOU NOW HAVE"; G; "GEMS": GOTO 520
1630 F = F + 10
     PRINT "HERE YOU FIND THE SPARE FLARES"
1640 H(K, L) = 0
     M(K, L) = 0
GOTO 520

1650 PRINT "LOTS OF HOBBIT TRACKS IN THE DUST"
GOTO 520

1660 PRINT "YOU ARE IN THE PRESENCE OF THE ORACLE"
     IF A(4) = 1 THEN GOTO 1690
     PRINT "THE OPAL EYE COMPELS IT TO ANSWER A QUESTION"
GOTO 1720

1690 IF G > 19 THEN 1700
     PRINT "BUT YOU ARE TOO POOR TO ASK ANYTHING": GOTO 520
1700 INPUT "WILL YOU SPEND 20 GEMS FOR 1 QUESTION"; O$
     IF O$ <> "YES" AND O$ <> "Y" THEN GOTO 550 ELSE G = G - 20
1720
    PRINT "WHAT WOULD YOU KNOW THE LOCATION OF": X = 0: Y = 0
    INPUT "(EX: TO FIND THE OPAL EYE TYPE 400)"; Q
    FOR R = 1 TO 9
        FOR S = 1 TO 9
            PRINT "MUMBLE ";
            IF H(R, S) <> Q THEN GOTO 1760
            IF Q <> 0 THEN M(R, S) = H(R, S): X = R: Y = S: Q = 0
1760    NEXT S
    NEXT R
    PRINT
    PRINT
    IF X <> 0 THEN
       GOTO 1780
    ELSE
       PRINT "EVEN THE ORACLE DOES NOT KNOW WHERE THAT IS"
       GOTO 550
    END IF
1780
    PRINT "THAT WHICH YOU DESIRE WILL BE FOUND AT ("; Y; ","; X; ")"
GOTO 550

1790 IF K <> Z(1) OR L <> Z(2) THEN GOTO 1830
     IF O$ <> "TELEPORT" AND O$ <> "T" THEN GOTO 670
     PRINT "OH WOW!!": PRINT "LUCKY HOBBIT NOW HAS THE MIGHTY ORB OF ZOT!"
     H(K, L) = 0: M(K, L) = 0: D(14) = 0: GOTO 520
1830 Q = INT(M(K, L) / 10): K = M(K, L) - (Q * 10): L = Q
     G = G - (RND * 5): IF G > -1 THEN 1530 ELSE G = 0: GOTO 1530
     REM DEMON
1850 IF K <> Z(3) OR L <> Z(4) THEN GOTO 1870
     PRINT "BOLD HOBBIT THIEF NOW HAS THE RUNESTAFF"
     H(K, L) = 0
     M(K, L) = 0
     D(13) = 0
GOTO 520

1870 M(K, L) = H(K, L): IF M(K, L) > -1 THEN GOTO 1530
     PRINT "UH OH - YOU JUST RAN INTO "; MID$(D$, ABS(M(K, L)) * 10 - 9, 10): Q = 0
1880 Q = Q + 1: IF A(Q) = 0 THEN 2010
     IF Q < 7 THEN 1880
     INPUT "HOW MUCH OF A BRIBE DO YOU OFFER HIM"; B: PRINT
     IF B > 0 THEN 1930
     PRINT "NORMALLY "; MID$(D$, -M(K, L) * 10 - 9, 10); " WOULD EAT YOU,"
     PRINT "BUT HE IS AFRAID THAT YOU ARE SICK OR SOMETHING"
     PRINT "SO TEARS YOU INTO SHREDS INSTEAD": GOTO 1481
1930 IF B = INT(B) THEN GOTO 1960
     PRINT MID$(D$, -M(K, L) * 10 - 9, 10); " DOESN'T UNDERSTAND DECIMALS,"
     PRINT "SO HE EATS CONFUSING LITTLE FUR-FOOT": GOTO 1481
1960 IF B <= G THEN GOTO 1990
     PRINT MID$(D$, -M(K, L) * 10 - 9, 10); " DOESN'T LIKE HOBBITS WHO OFFER MORE GEMS"
     PRINT "THAN THEY HAVE, SO HE EATS YOU": GOTO 1481
1990 G = G - B
     IF B > (RND * (-M(K, L))) THEN PRINT "HE TAKES YOUR BRIBE": GOTO 550
     PRINT "THAT WASN'T ENOUGH, SO HE EATS YOU": GOTO 1481
2010 PRINT "BUT THE "; MID$(A$, Q * 10 - 9, 10); " PROTECTS YOU": GOTO 520
     REM KILL
2030 IF M(K, L) < 0 THEN 2040
     PRINT "YOU HAVE TO FIND A DEMON TO KILL IT": GOTO 520
2040 PRINT "WHICH AMULET DO YOU ATTACK WITH"
2050 INPUT "(EX: OPAL EYE = 400)"; Q: IF Q > 700 THEN 2050
     Q = Q / 100: IF A(Q) = 0 THEN 2053
     PRINT "YOU DON'T POSSESS THAT ONE, STUPID!": GOTO 520
2053 IF AC(Q) > 0 THEN 2055
     PRINT "THE "; MID$(A$, Q * 10 - 9, 10); " IS RECHARGING": GOTO 520
2055 AC(Q) = AC(Q) - 1
     REM
     PRINT "THE "; MID$(A$, Q * 10 - 9, 10); " ATTACKS AND "; MID$(D$, -M(K, L) * 10 - 9, 10);
     IF (RND * Q) + 3 > (RND * -M(K, L)) THEN GOTO 2090
     PRINT " IS STAGGERED BUT NOT DEAD"
GOTO 520

2090
   PRINT " DIES": B = (RND * 50): D(-M(K, L)) = 0: G = G + B: M(K, L) = 0: H(K, L) = 0
     PRINT "AND HERE IS HIS HOARD OF"; B; "GEMS": GOTO 520
REM WIZBACK
2120
    IF W > 0 THEN GOTO 2150
    PRINT "OH NO!!!"
    PRINT "THE WIZARD HAS RETURNED"
    IF D(14) = 1 THEN GOTO 2170
    PRINT "BUT THE ORB OF ZOT PROTECTS YOU - FOR NOW"
    W = RND(9)
GOTO 650

2150
    W = W - 1
    IF W <> 0 THEN GOTO 650 ELSE PRINT "SOME HOBBITS KNOW WHEN TO QUIT"
     PRINT "YOU DIDN'T."
2170 PRINT "WHAT A DELICIOUS LOOKING TOAD YOU MAKE": Q = 0
2180 Q = Q + 1
     IF D(Q) = 1 THEN GOTO 2190
     IF Q = 12 THEN GOTO 2200
GOTO 2180

2190 PRINT "AND YOU GET FED TO "; MID$(D$, Q * 10 - 9, 10)
GOTO 1481

2200 PRINT "AND YOU GET STEPPED ON BY THE WIZARD"
     PRINT "    S Q U I S H  ! !"
GOTO 1481

REM A
2440 X = (RND * 9): Y = (RND * 9): IF H(X, Y) <> 5 THEN 2440: RETURN
REM B
2460 IF K > 0 THEN 2470
     K = 9
2470 IF K < 10 THEN 2480
     K = 1
2480 IF L > 0 THEN 2490
     L = 9
2490 IF L < 10 THEN 2500
     L = 1
2500
RETURN

SUB Help.Hobbit
    PRINT "IN THIS GAME YOU BECOME A HOBBIT THIEF"
    PRINT "TRYING TO STEAL THE ORB OF ZOT FROM"
    PRINT "THE CASTLE OF THE EVIL WIZARD."
    INPUT "HIT ENTER TO CONTINUE"; O$: CLS
    PRINT "THE CASTLE IS A (9 X 9) MATRIX FILLED"
    PRINT "WITH MANY THINGS.  AMONG THESE"
    PRINT "THINGS (FOLLOWED BY THEIR NUMERIC REPRESENTATION"
    PRINT "ON THE MAP) ARE:"
    PRINT "GEMS (5), WARPS (11 THRU 99), SPARE FLARES (4)"
    PRINT "DEMONS (-1 THRU -12), AN ORACLE (2), AND"
    PRINT "AMULETS (100 THRU 700)."
    INPUT "HIT ENTER TO CONTINUE"; O$: CLS
    PRINT "ALSO HIDDEN IN THE CASTLE ARE THE RUNESTAFF"
    PRINT "AND THE ORB OF ZOT.  THE ORB IS DISGUISED "
    PRINT "AS A WARP AND THE ONLY WAY TO GET IT IS"
    PRINT "TO TELEPORT INTO ITS ROOM DIRECTLY."
    PRINT "IF YOU TRY TO MOVE INTO ITS ROOM YOU WILL"
    PRINT "GO PAST IT IN THE SAME DIRECTION."
    PRINT "TO TELEPORT YOU MUST USE THE RUNESTAFF"
    PRINT "WHICH IS DISGUISED AS A DEMON. BE CAREFUL"
    PRINT "WHEN YOU TELEPORT, HOWEVER, BECAUSE YOU LOSE"
    PRINT "ALL YOUR AMULETS AND GEMS (NOTE: YOU MAY ALSO"
    PRINT "DROP SOME GEMS EACH TIME YOU MOVE)."
    INPUT "HIT ENTER TO CONTINUE "; O$: CLS
    PRINT "FIND THE ORB AS QUICKLY AS YOU CAN BECAUSE"
    PRINT "THE WIZARD WILL RETURN SHORTLY AND ONLY THE"
    PRINT "ORB CAN PREVENT HIM FROM DOING TERRIBLE THINGS"
    PRINT "TO YOU."
    PRINT "HIT ENTER TO CONTINUE";
    DO
    LOOP UNTIL INKEY$ = CHR$(13)
    CLS
    PRINT "THE LEGAL MOVES ARE:"
    PRINT "NORTH OR N"
    PRINT "SOUTH OR S"
    PRINT "EAST  OR E"
    PRINT "WEST OR W"
    PRINT "WAIT OR WT"
    PRINT "MAP OR M"
    PRINT "FLARE OR F"
    PRINT "LAMP OR L"
    PRINT "TELEPORT OR T"
    PRINT "KILL OR K"
    PRINT "QUIT OR Q"
    PRINT "HIT ENTER TO CONTINUE";
    DO
    LOOP UNTIL INKEY$ = CHR$(13)
    CLS

END SUB

