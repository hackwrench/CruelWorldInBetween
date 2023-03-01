10 N=VAL(MID$(TIME$,7,2))
20 RANDOMIZE N
30 CLS:SCREEN 2:SCREEN 0:OUT &H3D0,8: OUT &H3D1,3:COLOR 3,0,1
40 FOR A=60 TO 20 STEP -1
50 COLOR 2,0,1:LOCATE 5,A:PRINT "   _______    ":NEXT
60 FOR A=1 TO 20:LOCATE 6,A:PRINT "  /";:COLOR 3,0,1:PRINT "˛˛˛˛˛˛˛";:COLOR 2,0,1:PRINT "\   ":NEXT
70 FOR A=60 TO 20 STEP -1:LOCATE 7,A:PRINT " /";:COLOR 3,0,1:PRINT "˛";:COLOR 15,0,1:PRINT "Fantasy";:COLOR 3,0,1:PRINT "˛";:COLOR 2,0,1:PRINT "\  ":NEXT
80 FOR A=1 TO 20:LOCATE 8,A:PRINT " \";:COLOR 3,0,1:PRINT "˛˛";:COLOR 15,0,1:PRINT "Warez";:COLOR 3,0,1:PRINT "˛˛";:COLOR 2,0,1:PRINT "/  ":NEXT
90 FOR A=60 TO 20 STEP -1:LOCATE 9,A:PRINT "  \";:COLOR 3,0,1:PRINT "˛˛";:COLOR 15:PRINT "Inc";:COLOR 3:PRINT "˛˛";:COLOR 2,0,1:PRINT "/   ":NEXT
100 COLOR 2:FOR A=1 TO 20:LOCATE 10,A:PRINT "     \_/      "
110 NEXT
120 COLOR 12,0,1:FOR A=1 TO 8:LOCATE A,35:PRINT "Presents";:COLOR 31:PRINT ". . . .":COLOR 12:NEXT:COLOR 12
130 FOR A=1 TO 8:LOCATE A,35:PRINT  "                         "
140 NEXT
150 LOCATE 8,35:PRINT "Presents";:COLOR 31:PRINT ". . . ."
160 COLOR 15,0,1:PLAY"MST155O2L8A#A#O3L4CO2A#O3CL1DP5L10D"
170 LOCATE 5,20:PRINT "   ‹‹‹‹‹‹‹    "
180 LOCATE 6,20:PRINT "  €€€€€€€€€   "
190 LOCATE 7,20:PRINT " €€≤Smurfs€€  "
200 LOCATE 8,20:PRINT " €€€≤die≤€€€  "
210 LOCATE 9,20:PRINT "  €€€±±±€€€   "
220 LOCATE 10,20:PRINT "     €±€      "
230 LOCATE 5,20:PRINT "              "
240 LOCATE 6,20:PRINT "              "
250 LOCATE 7,20:PRINT "              "
260 LOCATE 8,20:PRINT "              "
270 LOCATE 9,20:PRINT "              "
280 LOCATE 10,20:PRINT "              "
290 COLOR 12,0,1:LOCATE 8,35:PRINT "Presents";:COLOR 15:PRINT " . . .":COLOR 12
300 FOR A=35 TO 5 STEP-2:LOCATE 8,A:PRINT "Presents";:COLOR 31:PRINT " . . .":COLOR 12:NEXT
310 FOR A=70 TO 16 STEP-1:LOCATE 8,A:PRINT " ":NEXT
320 FOR A=8 TO 2 STEP -1:LOCATE A,5:PRINT "Presents";:COLOR 31,0,1:PRINT " . . .":LOCATE A,5:PRINT "                     "
330 COLOR 12:NEXT:COLOR 12
340 LOCATE 2,5:PRINT "Presents";:COLOR 31:PRINT " . . ."
350 COLOR 2:FOR A=1 TO 2:LOCATE 5,40:PRINT "-"
360 LOCATE 5,40:SOUND 32729,1:PRINT "\"
370 LOCATE 5,40:SOUND 32729,1:PRINT "≥"
380 LOCATE 5,40:SOUND 32729,1:PRINT "/"
390 LOCATE 5,40:SOUND 32729,1:PRINT "-"
400 LOCATE 5,40:SOUND 32729,1:PRINT "\"
410 LOCATE 5,40:SOUND 32729,1:PRINT "≥"
420 LOCATE 5,40:SOUND 32729,1:PRINT "/"
430 LOCATE 5,40:SOUND 32729,1:PRINT "-":NEXT :LOCATE 5,40:PRINT "A"
440 COLOR 1:PRINT "     ‹                     €     ‹    ‹              ‹‹                   "
450 PRINT "     €      ‹‹‹  ‹ ‹‹   ‹‹‹€     €ﬂ‹  € ‹   ‹ ‹ ‹‹   ‹ﬂ ‹   ‹  ‹‹‹   ‹‹‹ "
460 PRINT "     €     €   € €ﬂ  ﬂ €   €     €  ﬂ‹€ €   € €ﬂ  ﬂ     €   € €   ﬂ €   ﬂ":PRINT "     €‹‹‹‹ ﬂ‹‹‹ﬂ €     ﬂ‹‹‹ﬂ     €    € ﬂ‹‹‹ﬂ €         ﬂ‹‹‹ﬂ ﬂ‹‹‹ﬂ ﬂ‹‹‹ﬂ"
470 PRINT:PRINT :PRINT
480 COLOR 2:PRINT "                  -----------";:COLOR 3:PRINT "Great Empire of Melnibone";:COLOR 2:PRINT "----------"
490 COLOR 14:PRINT "                                                _"
500 PRINT "                                           ";:COLOR 1:PRINT "_____";:COLOR 14:PRINT " []\"
510 COLOR 7:PRINT "                       < < < < < < < < < < ";:COLOR 1:PRINT "_____";:COLOR 15:PRINT "[";:COLOR 12:PRINT ":*";:COLOR 15:PRINT "]";:COLOR 6:PRINT "######";:COLOR 14:PRINT "[";:COLOR 2:PRINT ">":COLOR 14
520 PRINT "                                  _             _[]/"
530 PRINT "                               /[] ";:COLOR 1:PRINT "_____"
540 COLOR 2:PRINT "                       <";:COLOR 14:PRINT "]";:COLOR 6:PRINT "######";:COLOR 15:PRINT "[";:COLOR 12:PRINT "*:";:COLOR 15:PRINT "]";:COLOR 9:PRINT "_____";:COLOR 7:PRINT "> > > > > > > > > > "
550 COLOR 14:PRINT "                               \[]_
560 PRINT "                                                                "
570 COLOR 2:PRINT "                  -----";:COLOR 11,0,1:PRINT "Call  the Dark Bay at (415) 490-3179";:COLOR 2:PRINT "-----"
580 'LOCATE 21,1:PRINT :PRINT :PRINT "Fantasy Warez Inc. is a fictionous name for all legal purposes. This progarm is                              publis domain software."
590 FOR A= 1 TO 20:LOCATE 11,33:COLOR 15:PRINT "> >";:COLOR 3:PRINT " Creation ";:COLOR 15:PRINT "< <"
600 LOCATE 16,1:COLOR 7:PRINT "                        < < < < < < < < < <"
610 LOCATE 16,1:COLOR 7:PRINT "                       < < < < < < < < < < "
620 LOCATE 19,41:COLOR 7:PRINT "> > > > > > > > > >"
630 LOCATE 19,41:COLOR 7:PRINT " > > > > > > > > > > "
640 LOCATE 11,33:COLOR 15:PRINT " > ":LOCATE 11,46:PRINT " < ":NEXT
650 GOTO 1000
660 KEY OFF
670 'N=VAL (MID$(TIME$,7,2))
680 'RANDOMIZE N
690 INPUT "Do you want graphics (Y/N)";ANS$
700 IF ANS$ = "y" GOTO 740
710 IF ANS$ = "Y" GOTO 740
720 IF ANS$="ARIOCH" GOTO 1400
730 GOTO 1020
740 SCREEN 1:CLS
750  CIRCLE (20,20),20
760 PAINT (30,30),2,3
770 CIRCLE (240,30),15
780 PAINT (240,30),1,3
790 PSET (60,125)
800 DRAW"e100;f100;l199"
810 LINE (360,125)-(0,360),,BF
820 PAINT (100,100),3
830 LINE (360,125)-(0,360),1,BF
840 LOCATE 16,19
850 PRINT "   "
860 FOR J = 1 TO 200
870 I=(RND*360)
880 F=(RND*120)
890 FOR R=1 TO 0 STEP -1
900 CIRCLE (I,F),R,3
910 NEXT
920 NEXT
930 LOCATE 22,11
940 PRINT "Congradulations!!!"
950 LOCATE 22,11
960 BEEP
970 FOR X = 200 TO 0 STEP -4
980 CIRCLE (160,100),X,,,,1
990 SCREEN 2:SCREEN 0:GOTO 10540
1000 SCREEN 2
1010 SCREEN 0
1020 CLS
1030 PRINT : COLOR 14,0,1
1040 FOR A=1 TO 18:LOCATE A,1:PRINT"                               by Lord Nur£cc":LOCATE A,1:PRINT "                                                  ":NEXT:LOCATE 18,1:PRINT "                               by Lord Nur£cc"
1050 COLOR 12:LOCATE 2,1:PRINT"            ‹‹‹‹‹ ‹‹‹‹ ‹   ‹ ‹‹‹‹  ‹    ‹‹‹‹           ‹‹‹   ‹‹‹‹
1060 PRINT"              €   €    €€ €€ €   € €    €             €   €  €
1070 PRINT"              €   €ﬂﬂ  € € € €ﬂﬂﬂ  €    €ﬂﬂ           €   €  €ﬂﬂ
1080 PRINT"              €   €‹‹‹ €   € €     €‹‹‹ €‹‹‹          ﬂ‹‹‹ﬂ  €
1090 PRINT:
1100 PRINT
1110 PRINT"                  ‹     ‹‹‹  ‹‹‹‹‹  ‹  ‹            ‹‹‹‹‹‹
1120 PRINT"                  €    €   €   €    €  €          ‹ﬂ €  € ﬂ‹
1130 PRINT"                  €    €   €   €    €ﬂﬂ€        ‹ﬂ   €  €   ﬂ‹
1140 PRINT"                  €‹‹‹ ﬂ‹‹‹ﬂ   €    €  €      ‹€‹‹‹‹‹€‹‹€‹‹‹‹‹€‹
1150 PRINT:COLOR 15,0,1
1160 FOR A=1 TO 32:LOCATE 13,A:PRINT"  VERSION 4.13":NEXT :FOR A=1 TO 33:LOCATE 13,A:PRINT " ":NEXT:COLOR 31:LOCATE 13,30:PRINT "    VERSION 4.13  "
1170 COLOR 3,0,1:PRINT "                              November 11, 1984
1180 COLOR 3,0,1:PRINT"              Suggested for use with printer and graphics board
1190 PRINT"
1200 PRINT "                           A Fantasy Warez Program"
1210 COLOR 14:PRINT"                               by Lord Nur£cc"
1220 'PRINT"                            (Nur£cc the Chaotic)
1230 PRINT:COLOR 10,0,1
1240 PRINT"                       of the Great Empire of Melnibone'":COLOR 3,0,1
1250 SOU=INT(RND*2+1)
1260 ON SOU GOTO 1270,1290
1270 PLAY"O1MFT155L2DL4EL2FDL1GG#"
1280 GOTO 1340
1290 FOR QWER= 220 TO 196 STEP-1
1300 SOUND QWER,1
1310 NEXT
1320 PLAY"O1MLT155L2GP10EP10L1F#"
1330 GOTO 1340
1340 PRINT
1350 PRINT "     Make sure that all commands are done in capitals.  For help type `H'.
1360 INPUT "                      Do you want instructions (Y/N)";ANS$
1370 IF ANS$="Y" GOTO 12600
1380 IF ANS$="y" GOTO 12600
1390 IF ANS$="ARIOCH" THEN MN=1
1400 REM
1410 REM    ****************************************************
1420 REM    *  WRITTEN BY JOHN BELEW FOR USE WITH THE I.B.M.   *
1430 REM    *            AND OTHER COMPATIBLE                  *
1440 REM    *        THANKS TO TSR FOR THE MONSTERS            *
1450 REM    * THANKS TO RECREATIONAL COMPUTING FOR THE ORIGINAL*
1460 REM    * PROGRAM          JUNE 29, 1984                   *
1470 REM    ****************************************************
1480 DEFINT A-Z
1490 DIM C$(34),I$(34),R$(4),W$(8),E$(8)
1500 DIM L(512),C(3,4),T(8),O(3),R(3)
1510 DEF FNA(Q)=1+INT(RND(1)*Q)
1520 DEF FNB(Q)=Q+8*((Q=9)-(Q=0))
1530 DEF FNC(Q)=-Q*(Q<19)-18*(Q>18)
1540 DEF FND(Q)=64*(Q-1)+8*(X-1)+Y
1550 DEF FNE(Q)=Q+100*(Q>99)
1560 COLOR 11,0,15:Y$="** Please answer yes or no":COLOR 3,0,1
1570 NG=0
1580 REM
1590 REM   INITIALIZE ARRAYS
1600 REM
1610 NG=NG+1
1620 Q=RND(1)
1630 RESTORE
1640 FOR Q=1 TO 34
1650 READ C$(Q),I$(Q)
1660 NEXT Q
1670 FOR Q=1 TO 512
1680 L(Q)=101
1690 NEXT Q
1700 FOR Q=1 TO 8
1710 READ W$(Q),E$(Q)
1720 NEXT Q
1730 FOR Q=1 TO 4
1740 READ R$(Q)
1750 NEXT Q
1760 IF NG > 1 GOTO 2080
1770 CLS
1780 PRINT "       …ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª"
1790 PRINT "       ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ";:COLOR 27,0,1:PRINT "* * * THE TEMPLE OF LOTH * * *";:COLOR 3,0,1:PRINT "ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ"
1800 PRINT "       ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ"
1810 'PRINT  ∫                                                                 ∫
1820 PRINT "       ∫                                                                 ∫
1830 'GOSUB 9060
1840 PRINT "       ∫      Many generations ago, during the great Elfin Wars  of the  ∫
1850 PRINT "       ∫   first age, there stood the majestic temple of the Drow.  The  ∫
1860 PRINT "       ∫   Drow are an evil race of elves dedicated to the  destruction  ∫
1870 PRINT "       ∫   of all elves but themselves. During this time they were rul-  ∫
1880 PRINT "       ∫   ed by the the evil priestess,Tar-Anclime, a great sorceress.  ∫
1890 PRINT "       ∫   Under the aid of her goddess Loth, she created ";:COLOR 11,0,1:PRINT"the Amulet of";:COLOR 3,0,1:PRINT"  ∫"
1900 PRINT "       ∫";:COLOR 11,0,1:PRINT"   Chaos";:COLOR 3,0,1:PRINT" which was to be used to aid her side in the final des-  ∫
1910 PRINT "       ∫   truction of their rivals. The Drow massed for The final con-  ∫
1920 PRINT "       ∫   flict but they were attacked by their rival forces and there  ∫
1930 PRINT "       ∫   they were utterly destroyed. Now thousands of years later it  ∫
1940 PRINT "       ∫   is said that in the  kingdom of Rhyl that the descendents of  ∫
1950 PRINT "       ∫   the Drow are massing. The Drow plan to return to claim their  ∫
1960 PRINT "       ∫   homeland to retrieve ";:COLOR 11,0,1:PRINT "the Amulet of Chaos";:COLOR 3,0,1:PRINT" so they can finally  ∫
1970 PRINT "       ∫   destroy the elves of good. Living in the village shadowed by  ∫
1980 PRINT "       ∫   now crumbling  temple, you have been  chosen to retrieve the  ∫
1990 PRINT "       ∫   Amulet  before the Drow  return so that it can be destroyed.  ∫
2000 PRINT "       ∫   There are many  dangers that live in the  mazes of the ruins  ∫
2010 PRINT "       ∫   such as powerful  and  magic  monsters.  It is even believed  ∫
2020 PRINT "       ∫   that the some Drow still live in ruins.";:COLOR 28,0,1:PRINT" BEWARE!!!";:COLOR 3,0,1:PRINT"             ∫
2030 PRINT "       ∫                                                                 ∫
2040 PRINT "       ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ"
2050 PRINT "       ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ"
2060 SOUND 32729,600
2070 'PRINT "Wait one moment please while I stock the temple..."
2080 X=1 : Y=4
2090 L(FND(1))=2
2100 FOR Z=1 TO 7
2110 FOR Q1=1 TO 2
2120 Q=104
2130 GOSUB 11350
2140 L(FND(Z+1))=103
2150 NEXT Q1
2160 NEXT Z
2170 FOR Z=1 TO 8
2180 FOR Q=113 TO 124
2190 GOSUB 11350
2200 NEXT Q
2210 FOR Q1=1 TO 3
2220 FOR Q=105 TO 112
2230 GOSUB 11350
2240 NEXT Q
2250 Q=125
2260 GOSUB 11350
2270 NEXT Q1
2280 NEXT Z
2290 FOR Q=126 TO 133
2300 Z=FNA(8)
2310 GOSUB 11350
2320 NEXT Q
2330 Q=101
2340 FOR A=1 TO 3
2350 Z=FNA(8)
2360 GOSUB 11350
2370 C(A,1)=X
2380 C(A,3)=Z
2390 C(A,2)=Y
2400 C(A,4)=0
2410 NEXT A
2420 RC=0
2430 ST=2
2440 DX=8
2450 R$(3)="Man"
2460 Q=112+FNA(12)
2470 Z=FNA(8)
2480 GOSUB 11350
2490 R(1)=X
2500 R(2)=Y
2510 R(3)=Z
2520 Q=109
2530 Z=FNA(8)
2540 GOSUB 11350
2550 O(1)=X
2560 O(2)=Y
2570 O(3)=Z
2580 BF=0 : OT=8 : AV=0 : HT=0 : T=1 : VF=0 : LF=0
2590 TC=0 : GP!=60 : RF=0 : OF=0 : BL=0 : IQ=8 : SX=0
2600 FOR Q=1 TO 8
2610 T(Q)=0
2620 NEXT Q
2630 PRINT CHR$(7);
2640 CLS
2650 'PRINT:KEY ON:KEY 1,"Elf     "+CHR$(13):KEY 2,"Man      "+CHR$(13):KEY 3,"Dwarf     "+CHR$(13):KEY 4,"Hobbit  "+CHR$(13):KEY 5,"Male    "+CHR$(13):KEY 6,"Female    "+CHR$(13):KEY 7,"":KEY 8,"":KEY 9,"":KEY 10,""
2660 PRINT
2670 COLOR 11,0,1:PRINT "  You are in large room blinded by a very bright light.  All of the sudden you "
2680 PRINT "hear a booming voice which says, `You have been chosen bold one to be a valiant"
2690 PRINT "and brave  warrior of any race you desire.  You can choose to be an Elf, a Man,"
2700 PRINT "a Dwarf or a Hobbit.' Remember though, you only have 500 turns.":COLOR 3,0,1
2710 COLOR 3,0,1
2720 GOSUB 11590
2730 FOR Q=1 TO 4
2740 STR = INT(RND*10+2)
2750 DEX = INT(RND*10+2)
2760 IF LEFT$(R$(Q),1)=O$ THEN RC=Q : ST=STR*Q : DX=DEX*Q
2770 IF ST > 18 THEN ST=18
2780 IF DX > 18 THEN DX =18
2790 NEXT Q
2800 PRINT
2810 OT=OT+4*(RC=1)
2820 IF RC > 0 THEN R$(3)="Human" : GOTO 2850
2830 COLOR 11,0,15:PRINT "** That was incorrect. Please type E, D, M, OR H.":COLOR 3,0,1
2840 GOTO 2720
2850 PRINT "Which sex do you prefer";
2860 GOSUB 11610
2870 IF O$="M" THEN SX=1 : GOTO 2910
2880 IF O$="F" GOTO 2910
2890 COLOR 11,0,15:PRINT "** Cute ";R$(RC);", Real cute. Try M OR F.":COLOR 3,0,1
2900 GOTO 2850
2910 PRINT
2920 PRINT "OK, ";R$(RC);", you have the following attributes :"
2930 PRINT "Strength =";ST
2940 PRINT "Intelligence =";IQ
2950 PRINT "Dexterity =";DX
2960 PRINT "and";OT;"other points you allocate as you wish."
2970 PRINT
2980 Z$="Strength"
2990 GOSUB 11640
3000 ST=ST+Q
3010 IF OT=0 GOTO 3100
3020 Z$="Intelligence"
3030 GOSUB 11640
3040 IQ=IQ+Q
3050 IF OT=0 GOTO 3100
3060 Z$="Dexterity"
3070 GOSUB 11640
3080 DX=DX+Q
3090 'KEY 1,"Plate   "+CHR$(13):KEY 2,"Chain   "+CHR$(13):KEY 3,"Leather   "+CHR$(13):KEY 4,"Sword   "+CHR$(13):KEY 5,"Mace    "+CHR$(13):KEY 6,"Dagger    "+CHR$(13):KEY 7,"Nothing "+CHR$(13):KEY 8,"No      "+CHR$(13):KEY 9,"Yes       "+CHR$(13)
3100 PRINT "OK, ";R$(RC);", you find your self at a bazaar in a small village built in the "
3110 PRINT "shadow of a large and crumbling castle.  You have nothing save the clothes on "
3120 PRINT "your back and a purse containing 60gp's to buy your equipments with."
3130 Z$="Armor"
3140 GOSUB 11890
3150 AV=0 : WV=0 : FL=0 : WC=0
3160 PRINT "Plate Mail:30gp's Chainmail:20gp's Leather:10gp's Nothing:-
3170 GOSUB 11590
3180 IF O$="N" GOTO 3240
3190 AV=-3*(O$="P")-2*(O$="C")-(O$="L")
3200 IF AV > 0 GOTO 3240
3210 PRINT
3220 COLOR 11,0,15:PRINT "** Are you a ";R$(RC);" or ";C$(FNA(12)+12);"?":COLOR 3,0,1
3230 GOTO 3130
3240 AH=AV*7 : GP!=GP!-AV*10
3250 PRINT
3260 PRINT "OK, bold ";R$(RC);", you have";GP!;"gp's left."
3270 PRINT
3280 Z$="Weapons"
3290 GOSUB 11890
3300 PRINT "Sword:30gp's Mace:20gp's Dagger:10gp's Nothing:-"
3310 GOSUB 11590
3320 IF O$="N" GOTO 3380
3330 WV=-3*(O$="S")-2*(O$="M")-(O$="D")
3340 IF WV > 0 GOTO 3380
3350 PRINT 
3360 COLOR 11,0,15:PRINT "** Is your IQ really";IQ;"?":COLOR 3,0,1
3370 GOTO 3280
3380 GP!=GP!-WV*10
3390 IF GP! < 20 GOTO 3450
3400 PRINT
3410 PRINT "Do you want to buy a lamp for 20gp's";
3420 GOSUB 11610
3430 IF O$="Y" THEN LF=1 : GP!=GP!-20 : GOTO 3450
3440 IF O$ <> "N" THEN PRINT : PRINT Y$ : PRINT : GOTO 3410
3450 PRINT
3460 IF GP! < 1 THEN Q=0 : GOTO 3570
3470 PRINT "OK, ";R$(RC);", you have";GP!;"gold pieces left."
3480 PRINT
3490 INPUT "Flares give off light which allows you to see all the rooms around you.  At a   cost of 1gp each how many do you want to buy?";O$
3500 Q=VAL(O$)
3510 PRINT
3520 IF Q > 0 OR ASC(O$)=48 GOTO 3560
3530 COLOR 11,0,15:PRINT "** If you don't want any, just type 0.":COLOR 3,0,1
3540 PRINT
3550 GOTO 3490
3560 COLOR 11,0,15:IF Q > GP! THEN PRINT "** You can only afford";GP!;"." :COLOR 3,0,1: PRINT : GOTO 3490
3570 FL=FL+Q : GP!=GP!-Q
3580 X=1 : Y=4 : Z=1
3590 COLOR 27,0,15:PRINT "OK, ";R$(RC);", You are now entering the castle!":COLOR 3,0,1:
3600 GOTO 7090
3610 REM
3620 REM   MAIN PROCESSING LOOP
3630 REM
3640 T=T+1
3650 IF RF+OF > 0 GOTO 3780
3660 IF C(1,4) > T(1) THEN T=T+1
3670 IF C(2,4) > T(3) THEN GP!=GP!-FNA(5)
3680 IF GP! < 0 THEN GP!=0
3690 IF C(3,4) <= T(5) GOTO 3780
3700 A=X : B=Y : C=Z
3710 X=FNA(8) : Y=FNA(8) : Z=FNA(8)
3720 L(FND(Z))=FNE(L(FND(Z)))+100
3730 X=A : Y=B : Z=C
3740 IF L(FND(Z)) <> 1 GOTO 3780
3750 FOR Q=1 TO 3
3760 C(Q,4)=-(C(Q,1)=X)*(C(Q,2)=Y)*(C(Q,3)=Z)
3770 NEXT Q
3780 IF FNA(5) > 1 GOTO 4280
3790 PRINT
3800 PRINT "You ";
3810 Q=FNA(7)+BL
3820 IF Q > 7 THEN Q=4
3830 ON Q GOSUB 4130,3870,4110,3850,4150,4180,4200
3840 GOTO 4280
3850 PRINT "stepped on dragon @#*%!"
3860 RETURN
3870 PRINT "hear ";
3880 ON FNA(4) GOTO 3890,3950,4030,4060
3890 PRINT "a scream!"
3900 FOR I=2075 TO 1800 STEP-1
3910 SOUND I,.1
3920 NEXT
3930 SOUND 32729,1
3940 RETURN
3950 PRINT "footsteps!"
3960 'FOR I=1 TO 5
3970 FOR J=40 TO 37 STEP-1
3980 SOUND J,1
3990 SOUND 32729,10
4000 'NEXT
4010 NEXT
4020 RETURN
4030 PRINT "a Wumpus!"
4040 PLAY "O0MST255L4AGP5AGP5AGP5AG
4050 RETURN
4060 PRINT "groans!"
4070 FOR I = 300 TO 37 STEP-1
4080 SOUND I,.1
4090 NEXT
4100 RETURN
4110 PRINT "sneezed!"
4120 RETURN
4130 PRINT "see a bat fly by!"
4140 RETURN
4150 PRINT "hear a ";C$(12+FNA(13));" growling!"
4160 GOTO 4070
4170 RETURN
4180 PRINT "feel like you're being watched!"
4190 RETURN
4200 PRINT "hear faint rustling noises!"
4210 FOR Q=1 TO 200
4220 A = INT(RND*50+37)
4230 SOUND A,.001
4240 'SOUND 32729,1
4250 NEXT
4260 SOUND 32729,1
4270 RETURN
4280 IF BL+T(4) <> 2 GOTO 4320
4290 PRINT
4300 PRINT C$(29);" cures your blindness!"
4310 BL=0
4320 IF BF+T(6) <> 2 GOTO 4360
4330 PRINT
4340 PRINT C$(31);" dissolves the book!"
4350 BF=0
4360 PRINT
4370 PRINT
4380 LOCATE 23,1:COLOR 3,0,1:PRINT "Enter your command:
4390 FOR ASD= 1 TO 2
4400 LOCATE 23,20:PRINT "-":SOUND 32767,1
4410 LOCATE 23,20:PRINT "\":SOUND 32767,1
4420 LOCATE 23,20:PRINT "≥":SOUND 32767,1
4430 LOCATE 23,20:PRINT "/":SOUND 32767,1
4440 LOCATE 23,20:PRINT "-":SOUND 32767,1
4450 LOCATE 23,20:PRINT "\":SOUND 32767,1
4460 LOCATE 23,20:PRINT "≥":SOUND 32767,1
4470 LOCATE 23,20:PRINT "/":SOUND 32767,1
4480 LOCATE 23,20:PRINT "-";:SOUND 32767,1
4490 'LINE INPUT O$
4500 NEXT
4510 LINE INPUT O$
4520 IF LEFT$(O$,2)="DR" GOTO 5900
4530 O$=LEFT$(O$,1)
4540 IF O$="N" GOTO 5020
4550 IF (O$="S") OR (O$="W") OR (O$="E") GOTO 5030
4560 IF O$="U" GOTO 5080
4570 IF O$="D" GOTO 5110
4580 IF O$="ﬁ" GOTO 11090
4590 IF O$="M" GOTO 5160
4600 IF O$="F" THEN ON BL+1 GOTO 5400,5160
4610 IF O$="L" THEN ON BL+1 GOTO 5660,5160
4620 IF O$="O" GOTO 6090
4630 IF O$="Q" GOTO 6960
4640 IF O$="G" THEN ON BL+1 GOTO 6550,5160
4650 IF O$="T" THEN PRINT : ON RF+1 GOTO 6810,6850
4660 IF O$="#" GOTO 11950
4670 IF O$ ="H" GOTO 4690
4680 GOTO 5000
4690 INPUT "Do you want a hard copy (Y/N)";HARD$
4700 IF HARD$ = "Y"  GOTO 12000
4710 PRINT"…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª
4720 PRINT"∫";:COLOR 27,0,1:PRINT "   *** TEMPLE OF LOTH'S COMMAND AND INFORMATION SUMMARY ***";:COLOR 3,0,1:PRINT "   ∫
4730  PRINT "ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ"
4740  PRINT "∫ The following commands available are:                        ∫"
4750  PRINT "∫                                                              ∫"
4760  PRINT "∫ H/elp     N/orth    S/outh    E/ast     W/est     U/p        ∫"
4770  PRINT "∫ D/own     DR/ink    M/ap      F/lare    L/amp     O/pen      ∫"
4780  PRINT "∫ G/aze     T/eleport Q/uit     #/Score                        ∫"
4790  PRINT "ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ"
4800  PRINT "∫ The contents of the rooms are as follows:                    ∫"
4810  PRINT "∫                                                              ∫"
4820  PRINT "∫ Œ = empty room      B = book            C = chest            ∫"
4830  PRINT "∫ D = stairs down     Ô = entrance/exit   ü = flares           ∫"
4840  PRINT "∫ G = gold pieces     ù = monster         Ë = crystal orb      ∫"
4850  PRINT "∫ P = magic pool      S = sinkhole        T = treasure         ∫"
4860  PRINT "∫ U = stairs up       * = Drow            € = warp/amulet      ∫"
4870  PRINT "ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ"
4880  PRINT "∫ The benefits of having treasures are:                        ∫"
4890  PRINT "∫                                                              ∫"
4900  PRINT "∫ RUBY RED - avoid lethargy    PALE PEARL - avoid leech        ∫"
4910  PRINT "∫ GREEN GEM - avoid forgetting  OPAL EYE - cure blindness      ∫"
4920  PRINT "∫ BLUE FLAME - dissolves books  NORN STONE - no benefit        ∫"
4930  PRINT "∫ PALANTIR - no benefit         SILMARIL - no benefit          ∫"
4940  PRINT "ÃÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕπ"
4950 PRINT
4960 PRINT "Press return when ready to resume, ";R$(RC);".";
4970 LINE INPUT "";O$
4980 GOTO 3640
4990 PRINT
5000 COLOR 11,0,15:PRINT "** Bold ";R$(RC);", that wasn't a valid command!":COLOR 3,0,1
5010 GOTO 3640
5020 IF L(FND(Z))=2 GOTO 10460
5030 X=X+(O$="N")-(O$="S")
5040 Y=Y+(O$="W")-(O$="E")
5050 X=FNB(X)
5060 Y=FNB(Y)
5070 GOTO 7090
5080 IF L(FND(Z))=3 THEN Z=Z-1 : GOTO 7090
5090 Z$="Up"
5100 GOTO 5130
5110 Z$="Down"
5120 IF L(FND(Z))=4 THEN Z=Z+1 : GOTO 7090
5130 PRINT
5140 COLOR 11,0,15:PRINT "** There are no stairs going ";Z$;" from here!":COLOR 3,0,1
5150 GOTO 3640
5160 IF BL <> 1 GOTO 5240
5170 PRINT
5180 COLOR 11,0,15:PRINT "** You can't see anything ";R$(RC);"!":COLOR 3,0,1
5190 GOTO 3640
5200 REM
5210 REM   DISPLAY MAP OF CURRENT CASTLE LEVEL
5220 REM
5230 COLOR 6,0,1
5240 PRINT
5250 A=X : B=Y
5260 FOR X=1 TO 8
5270 FOR Y=1 TO 8
5280 Q=L(FND(Z))
5290 IF Q > 99 THEN Q=Q-100:LET Q=34:REM TO HIDE ROOMS
5300 COLOR 6,0,1:IF X=A AND Y=B THEN PRINT "<";I$(Q);">  "; : GOTO 5320:COLOR 3,0,1
5310 COLOR 6,0,1:PRINT " ";I$(Q);"   ";:COLOR 3,0,1
5320 NEXT Y
5330 COLOR 3,0,1:PRINT
5340 PRINT
5350 NEXT X
5360 X=A : Y=B
5370 GOTO 5610
5380 COLOR 12,0,1:PRINT ") level";Z:COLOR 3,0,1
5390 GOTO 3640
5400 IF FL <> 0 GOTO 5460
5410 COLOR 11,0,15:PRINT "** You can't, your out of flares!":COLOR 3,0,1
5420 GOTO 3640
5430 REM
5440 REM   DISPLAY ADJACENT ROOM CONTENTS WITH FLARE
5450 REM
5460 PRINT
5470 FL=FL-1
5480 A=X : B=Y
5490 FOR Q1=A-1 TO A+1
5500 X=FNB(Q1)
5510 FOR Q2=B-1 TO B+1
5520 Y=FNB(Q2)
5530 Q=FNE(L(FND(Z)))
5540 L(FND(Z))=Q
5550 COLOR 12,0,1:PRINT " ";I$(Q);"   ";:COLOR 3,0,1
5560 NEXT Q2
5570 PRINT
5580 PRINT
5590 NEXT Q1
5600 X=A : Y=B
5610 GOSUB 11920
5620 GOTO 3640
5630 REM
5640 REM   DISPLAY CONTENTS OF ADJACENT ROOM WITH LAMP
5650 REM
5660 IF LF <> 0 GOTO 5700
5670 PRINT
5680 COLOR 11,0,15:PRINT "** You don't have a lamp, ";R$(RC);"!":COLOR 3,0,1
5690 GOTO 3640
5700 PRINT
5710 PRINT "Where do you want to shine the lamp (N,S,E,W)";
5720 GOSUB 11610
5730 A=X : B=Y
5740 X=FNB(X+(O$="N")-(O$="S"))
5750 Y=FNB(Y+(O$="W")-(O$="E"))
5760 IF A-X+B-Y <> 0 GOTO 5800
5770 PRINT
5780 COLOR 11,0,15:PRINT "** That's not a direction ";R$(RC);"!":COLOR 3,0,1
5790 GOTO 3640
5800 PRINT
5810 PRINT "The lamp shines into (";X;",";Y;") level";Z;"."
5820 PRINT
5830 L(FND(Z))=FNE(L(FND(Z)))
5840 PRINT "There you will find ";C$(L(FND(Z)));"."
5850 X=A : Y=B
5860 GOTO 3640
5870 REM
5880 REM   TAKE A DRINK FROM A POOL
5890 REM
5900 IF L(FND(Z))=5 GOTO 5940
5910 PRINT
5920 COLOR 11,0,15:PRINT "** There is no pool to drink from here!":COLOR 3,0,1
5930 GOTO 3640
5940 Q=FNA(8)
5950 PRINT
5960 PRINT "You take a drink and ";
5970 IF Q < 7 THEN PRINT "feel ";
5980 ON Q GOTO 5990,6000,6010,6020,6030,6040,6050,6070
5990 ST=FNC(ST+FNA(3)) : PRINT "stronger." : GOTO 3640
6000 ST=ST-FNA(3) :COLOR 15,0,1: PRINT "weaker.":COLOR 7,0,1 : ON (1-(ST<1)) GOTO 3640,10340
6010 IQ=FNC(IQ+FNA(3)) : PRINT "smarter." : GOTO 3640
6020 IQ=IQ-FNA(3) :COLOR 15,0,1:PRINT "dumber.":COLOR 3,0,1: ON (1-(IQ<1)) GOTO 3640,10340
6030 DX=FNC(DX+FNA(3)) : PRINT "faster." : GOTO 3640
6040 DX=DX-FNA(3) :COLOR 15,0,1: PRINT "clumsier." :COLOR 3,0,1: ON (1-(DX<1)) GOTO 3640,10340
6050 Q=FNA(4) : IF Q=RC GOTO 6050
6060 RC=Q : PRINT "become a ";R$(RC);"." : GOTO 3640
6070 SX=1-SX : PRINT "turn into a "; : IF SX=0 THEN PRINT "fe";
6080 PRINT "male ";R$(RC);"!" : GOTO 3640
6090 IF L(FND(Z)) <> 6 GOTO 6130
6100 PRINT
6110 PRINT "You open the chest and"
6120 GOTO 6390
6130 IF L(FND(Z)) <> 12 GOTO 6170
6140 PRINT
6150 PRINT "You open the book and"
6160 GOTO 6200
6170 PRINT
6180 COLOR 11,0,15:PRINT "** there is nothing to open here.":COLOR 3,0,1
6190 GOTO 3640
6200 ON FNA(6) GOTO 6210,6240,6260,6280,6310,6340
6210 COLOR 0,15,15:CLS:PRINT "Flash! Oh no! you are now a blind ";R$(RC);"!"
6220 BL=1
6230 GOTO 6370
6240 PRINT "It's another volume of Nur£cc's poetry! - YECH!!"
6250 GOTO 6370
6260 PRINT "It's an old copy of Play";R$(FNA(4));"!"
6270 GOTO 6370
6280 PRINT "It's a manual of dexterity!"
6290 DX=18
6300 GOTO 6370
6310 PRINT "It's a manual of strength!"
6320 ST=18
6330 GOTO 6370
6340 COLOR 11,0,15:PRINT"The book sticks to your hands -"
6350 PRINT "now you are unable to draw your weapon!":COLOR 3,0,1
6360 BF=1
6370 L(FND(Z))=1
6380 GOTO 3640
6390 ON FNA(4) GOTO 6400,6450,6490,6450
6400 PRINT
6410 COLOR 14,0,15:PRINT "KABOOM!";:COLOR 3,0,1:PRINT " it explodes!!"
6420 Q=FNA(6)
6430 GOSUB 10240
6440 ON (1-(ST<1)) GOTO 6370,10340
6450 Q=FNA(1000)
6460 PRINT "find";Q;"gold pieces!"
6470 GP!=GP!+Q
6480 GOTO 6370
6490 PRINT
6500 COLOR 5,0,15:PRINT "GAS!!";:COLOR 3,0,1:PRINT "you stagger from the room!"
6510 L(FND(Z))=1
6520 T=T+20
6530 O$=MID$("NSEW",FNA(4),1)
6540 GOTO 5030
6550 IF L(FND(Z))=11 GOTO 6590
6560 PRINT
6570 COLOR 11,0,15:PRINT "**You need an orb to use the gaze command!":COLOR 3,0,1
6580 GOTO 3640
6590 PRINT
6600 PRINT "You see ";
6610 ON FNA(6) GOTO 6620,6640,6660,6680,6750,6790
6620 PRINT "Yourself in a bloody mess!"
6630 ST=ST-FNA(2) : ON (1-(ST<1)) GOTO 3640,10340
6640 PRINT "Yourself drinking from a pool and becoming ";C$(12+FNA(13));"!"
6650 GOTO 3640
6660 PRINT C$(12+FNA(13));" gazing back at you!"
6670 GOTO 3640
6680 A=X : B=Y : C=Z
6690 X=FNA(8) : Y=FNA(8) : Z=FNA(8)
6700 Q=FNE(L(FND(Z)))
6710 L(FND(Z))=Q
6720 PRINT C$(Q);" at (";X;",";Y;") level";Z;"."
6730 X=A : Y=B : Z=C
6740 GOTO 3640
6750 A=FNA(8) : B=FNA(8) : C=FNA(8)
6760 IF FNA(8) < 4 THEN A=O(1) : B=O(2) : C=O(3)
6770 BEEP:COLOR 12,0,15:PRINT "The Amulet of Chaos at (";A;",";B;") level";C;"!":COLOR 3,0,1
6780 GOTO 3640
6790 PRINT "a soap opera rerun!"
6800 GOTO 3640
6810 IF RF <> 0 GOTO 6850
6820 PRINT
6830 COLOR 11,0,15:PRINT "** You can't teleport without the Runestaff!":COLOR 3,0,1
6840 GOTO 3640
6850 Z$="X-Coordinate"
6860 GOSUB 11750
6870 X=Q
6880 Z$="Y-Coordinate"
6890 GOSUB 11750
6900 Y=Q
6910 Z$="Z-Coordinate"
6920 GOSUB 11750
6930 Z=Q
6940 O$="T"
6950 GOTO 7090
6960 PRINT
6970 PRINT "Do you really want to quit now?";
6980 GOSUB 11610
6990 PRINT
7000 IF O$="Y" GOTO 7030
7010 COLOR 11,0,15:PRINT "** Then don't say that you do!":COLOR 3,0,1
7020 GOTO 3640
7030 PRINT
7040 GOTO 10630
7050 REM
7060 REM   DISPLAY STATUS INFORMATION
7070 REM
7080 CLS
7090 KEY OFF:COLOR 3,0,1:PRINT
7100 IF BL=0 THEN GOSUB 11920 : PRINT
7110 LOCATE 24,1:COLOR 3,0,1
7120 PRINT "Strength =";ST;" Intelligence =";IQ;" Dexterity =";DX
7130 PRINT "Treasures =";TC;" Flares =";FL;" Gold Pieces =";GP!
7140 PRINT "Turns =";T;"  Weapon = ";W$(WV+1);"  Armor = ";W$(AV+5);
7150 IF LF=1 THEN PRINT "  and a lamp"
7160 IF LF=0 THEN PRINT "   "
7170 JOHN!=IQ*100+ST*100+DX*100+KM!+FTRS+REQ+GP!-T*5
7180 ' IF JOHN! > 30000 THEN JOHN!=30000
7190 ' IF GP! > 30000 THEN GP!=30000
7200 PRINT"Score =";JOHN!;:COLOR 3,0,1:
7210 PRINT "  Status = ";
7220 EQUZ=0
7230 IF BL = 1 THEN PRINT "-Blinded":EQUZ=1
7240 IF BF = 1 THEN PRINT "-Unable to draw weapon":EQUZ=1
7250 IF EQUZ=0 THEN PRINT "-Normal"
7260 COLOR 3,0,1
7270 '60:PRINT "Time = ";TIME$:COLOR 3,0,1:MAGICAL=0
7280 PRINT "Your are carrying ";
7290 IF OF = 1 THEN COLOR 12,0,1:PRINT "The Amulet of Chaos":COLOR 3,0,1:MAGICAL=1
7300 IF RF = 1 THEN PRINT "The Runestaff":MAGICAL=1
7310 IF MAGICAL=0 THEN PRINT "no magical items at the moment"
7320 QXYZ=0
7330 PRINT "The treasures you carry are ";
7340 FOR Q=1 TO 8
7350 IF T(Q)=1 THEN PRINT C$ (Q+25):QXYZ=1
7360 NEXT Q
7370 IF QXYZ=0 THEN PRINT "nothing"
7380 IF COME=1 THEN GOTO 7400
7390 IF T > 500 THEN GOTO 12280
7400 WC=0
7410 Q=FNE(L(FND(Z)))
7420 L(FND(Z))=Q
7430 Z$="You now have "
7440 PRINT
7450 PRINT "Here you find ";C$(Q);"."
7460 IF (Q<7) OR (Q=11) OR (Q=12) GOTO 3640
7470 IF Q=7 THEN GP!=GP!+FNA(10) : PRINT Z$;GP!;"." : GOTO 6370
7480 IF Q=8 THEN FL=FL+FNA(5) : PRINT Z$;FL;"." : GOTO 6370
7490 IF Q > 9 GOTO 7520
7500 IF (O(1)=X) AND (O(2)=Y) AND (O(3)=Z) THEN ON (1-(O$="T")) GOTO 5030,11070
7510 X=FNA(8) : Y=FNA(8) : Z=FNA(8) : GOTO 7090
7520 IF Q=10 THEN Z=FNB(Z+1) : GOTO 7090
7530 IF Q <= 25 OR Q >= 34 GOTO 7590
7540 PRINT
7550 PRINT "It's now yours!"
7560 T(Q-25)=1
7570 TC=TC+1
7580 GOTO 6370
7590 A=L(FND(Z))-12
7600 WC=0
7610 IF (A<13) OR (VF=1) GOTO 8800
7620 PRINT
7630 PRINT "You may trade with, attack, or ignore the Drow Merchant."
7640 GOSUB 11590
7650 IF O$="I" GOTO 3640
7660 IF O$ <> "A" GOTO 7710
7670 VF=1
7680 PRINT
7690 COLOR 3,0,12:PRINT "You'll be sorry that you did that!"
7700 GOTO 8800
7710 IF O$="T" GOTO 7750
7720 PRINT
7730 COLOR 11,0,15:PRINT "** Nice shot ";R$(RC);"!":COLOR 3,0,1
7740 GOTO 7620
7750 FOR Q=1 TO 8
7760 A=FNA(Q*1500)
7770 IF T(Q)=0 GOTO 7830
7780 PRINT
7790 PRINT "Do you want to sell ";C$(Q+25);" for ";A;"gp's";
7800 GOSUB 11610
7810 IF O$="Y" THEN TC=TC-1 : T(Q)=0 : GP!=GP!+A : GOTO 7830
7820 IF O$ <> "N" THEN PRINT Y$ : GOTO 7780
7830 NEXT Q
7840 IF GP! >= 1000 GOTO 7880
7850 PRINT
7860 PRINT "You're too poor to trade, ";R$(RC);"."
7870 GOTO 3640
7880 IF GP! < 1250 GOTO 8380
7890 PRINT
7900 PRINT "OK ";R$(RC);", you have ";GP!;"gp's and ";W$(AV+5);" armor."
7910 PRINT
7920 Z$="Armor"
7930 GOSUB 11890
7940 PRINT "Nothing:0gp's Leather:1250gp's ";
7950 IF GP! > 1499 THEN PRINT "Chainmail:1500:gp's ";
7960 IF GP! > 1999 THEN PRINT "Plate Mail:2000gp's ";
7970 PRINT
7980 GOSUB 11590
7990 PRINT
8000 IF O$="N" GOTO 8130
8010 IF O$="L" THEN GP!=GP!-1250 : AV=1 : AH=7 : GOTO 8130
8020 IF O$ <> "C" OR GP! >= 1500 GOTO 8050
8030 COLOR 11,0,15:PRINT "** You haven't got that much gold on hand!":COLOR 3,0,1
8040 GOTO 7910
8050 IF O$="C" THEN GP!=GP!-1500 : AV=2 : AH=14 : GOTO 8130
8060 IF O$ <> "P" OR GP! >= 2000 GOTO 8090
8070 COLOR 11,0,15:PRINT "** You can't afford plate mail!":COLOR 3,0,1
8080 GOTO 7910
8090 IF O$="P" THEN GP!=GP!-2000 : AV=3 : AH=21 : GOTO 8130
8100 PRINT
8110 COLOR 11,0,15:PRINT "** Choose a selection.":COLOR 3,0,1
8120 GOTO 7970
8130 IF GP! < 1250 GOTO 8380
8140 PRINT
8150 PRINT "You have";GP!;"gp's left with ";W$(WV+1);" in hand."
8160 PRINT
8170 Z$="Weapon"
8180 GOSUB 11890
8190 PRINT "Nothing:- Dagger:1250gp's";
8200 IF GP! > 1499 THEN PRINT "Mace:1500gp's";
8210 IF GP! > 1999 THEN PRINT "Sword:2000gp's";
8220 PRINT
8230 GOSUB 11590
8240 PRINT
8250 IF O$="N" GOTO 8380
8260 IF O$="D" THEN GP!=GP!-1250 : WV=1 : GOTO 8380
8270 IF O$ <> "M" OR GP! >= 1500 GOTO 8300
8280 COLOR 11,0,15:PRINT "** Sorry sir, I'm afraid I don't give credit!":COLOR 3,0,1
8290 GOTO 8160
8300 IF O$="M" THEN GP!=GP!-1500 : WV=2 : GOTO 8380
8310 IF O$ <> "S" OR GP! >= 2000 GOTO 8350
8320 COLOR 11,0,15:PRINT "** Your Dungeon Express Card - ";
8330 PRINT "You left home without it!":COLOR 3,0,1
8340 GOTO 8160
8350 IF O$="S" THEN GP!=GP!-2000 : WV=3 : GOTO 8380
8360 COLOR 11,0,15:PRINT "** Try choosing a selection!":COLOR 3,0,1
8370 GOTO 8220
8380 IF GP! < 1000 GOTO 3640
8390 Z$="Strength"
8400 GOSUB 11830
8410 IF O$ <> "Y" GOTO 8470
8420 GP!=GP!-1000
8430 ST=FNC(ST+FNA(6))
8440 Q=ST
8450 GOSUB 11860
8460 GOTO 8380
8470 IF O$ <> "N" THEN PRINT Y$ : GOTO 8390
8480 IF GP! < 1000 GOTO 3640
8490 Z$="Intelligence"
8500 GOSUB 11830
8510 IF O$ <> "Y" GOTO 8570
8520 GP!=GP!-1000
8530 IQ=FNC(IQ+FNA(6))
8540 Q=IQ
8550 GOSUB 11860
8560 GOTO 8480
8570 IF O$ <> "N" THEN PRINT Y$ : GOTO 8490
8580 IF GP! < 1000 GOTO 3640
8590 Z$="Dexterity"
8600 GOSUB 11830
8610 IF O$ <> "Y" GOTO 8670
8620 GP!=GP!-1000
8630 DX=FNC(DX+FNA(6))
8640 Q=DX
8650 GOSUB 11860
8660 GOTO 8580
8670 IF O$ <> "N" THEN PRINT Y$ : GOTO 8590
8680 IF (GP!<1000) OR (LF=1) GOTO 3640
8690 PRINT
8700 PRINT "Do you want to buy a lamp for 1000 gp's";
8710 GOSUB 11610
8720 IF O$ <> "Y" GOTO 8780
8730 GP!=GP!-1000
8740 LF=1
8750 PRINT
8760 PRINT "It's guaranteed to outlive you!"
8770 GOTO 3640
8780 IF O$ <> "N" THEN PRINT Y$ : GOTO 8690
8790 GOTO 3640
8800 Q1=1+INT(A/2) : Q2=A+2 : Q3=1
8810 IF (C(1,4)>T(1)) OR (BL=1) OR (DX<FNA(9)+FNA(9)) GOTO 9850
8820 PRINT
8830 COLOR 3,0,12:PRINT "You're confronting ";C$(A+12);"!"
8840 PRINT
8850 PRINT "You may attack or retreat (strongly suggested!)."
8860 IF Q3=1 THEN PRINT "You can also attempt to bribe the creature."
8870 IF IQ > 14 THEN PRINT "You can also cast a spell."
8880 PRINT
8890 PRINT "Your strength is";ST;"and your dexterity is";DX;"."
8900 GOSUB 11590
8910 IF O$ <> "A" GOTO 9340
8920 IF WV <> 0 GOTO 8960
8930 PRINT
8940 COLOR 11,0,15:PRINT "** Pounding on ";C$(A+12);" won't hurt it!":COLOR 3,0,12
8950 GOTO 9850
8960 IF BF <> 1 GOTO 9000
8970 PRINT
8980 COLOR 11,0,15:PRINT "** You can't kill it with a book, so I suggest you either attack or retreat!":COLOR 3,0,12
8990 GOTO 9850
9000 IF DX >= FNA(20)+(3*BL) GOTO 9040
9010 PRINT
9020 PRINT "You barley missed the ";C$(A+12);"!"
9030 GOTO 9850
9040 Z$=RIGHT$(C$(A+12),LEN(C$(A+12))-2)
9050 IF LEFT$(Z$,1)=" " THEN Z$=MID$(Z$,2)
9060 PRINT
9070 PRINT "A valent blow, you hit the ";Z$;"!"
9080 Q2=Q2-WV
9090 IF (A <> 9 AND A <> 12) GOTO 9140
9100 IF FNA(8) <> 1 GOTO 9140
9110 PRINT
9120 COLOR 11,0,15:BEEP:BEEP:PRINT "OH NO! Your ";W$(WV+1);" broke!":BEEP:BEEP:COLOR 3,0,12
9130 WV=0
9140 IF Q2 > 0 GOTO 9850
9150 PRINT
9160 MC=MC-1
9170 PRINT "You kill ";C$(A+12);"."
9180 KM!=KM!+1000
9190 IF H > T-60 GOTO 9230
9200 PRINT
9210 PRINT "You spend an hour eating ";C$(A+12);E$(FNA(8));"."
9220 H=T
9230 IF X <> R(1) OR Y <> R(2) OR Z <> R(3) THEN ON (1-(A=13)) GOTO 9290,11390
9240 PRINT
9250 COLOR 11,0,15:BEEP:PRINT "You've found the Runestaff!";CHR$(7):COLOR 3,0,12
9260 FTRS=10000
9270 R(1)=0
9280 RF=1
9290 Q=FNA(1000)
9300 PRINT
9310 PRINT "You now get his hoard of";Q;"gp's!"
9320 GP!=GP!+Q
9330 GOTO 6370
9340 IF O$="R" GOTO 9850
9350 IF O$ <> "C" GOTO 9640
9360 IF IQ >= 15 OR Q3 <= 1 GOTO 9400
9370 PRINT
9380 COLOR 11,0,15:PRINT "** You can't cast a spell now!":COLOR 3,0,12
9390 GOTO 8820
9400 PRINT
9410 PRINT "Which spell do you wish to cast, W/eb, F/ireball, or D/eathspell?";
9420 GOSUB 11610
9430 PRINT
9440 IF O$ <> "W" GOTO 9480
9450 ST=ST-1
9460 WC=FNA(8)+1
9470 ON (1-(ST<1)) GOTO 9850,10340
9480 IF O$ <> "F" GOTO 9570
9490 Q=FNA(7)+FNA(7)
9500 ST=ST-1
9510 IQ=IQ-1
9520 IF (IQ < 1) OR (ST < 1) GOTO 10340
9530 PRINT "It does";Q;"points worth of damage."
9540 PRINT
9550 Q2=Q2-Q
9560 GOTO 9140
9570 IF O$="D" GOTO 9610
9580 PRINT
9590 COLOR 11,0,15:PRINT "** Try one of the options given.":COLOR 3,0,12
9600 GOTO 8820
9610 PRINT "Death is. . . ";
9620 IF IQ < FNA(4)+15 THEN PRINT "yours!" : IQ=0 : GOTO 10340
9630 PRINT "his!" : Q2=0 : GOTO 9150
9640 IF O$="B" AND Q3 <= 1 GOTO 9680
9650 PRINT
9660 COLOR 11,0,15:PRINT "** Choose one of the options listed.":COLOR 3,0,12
9670 GOTO 8820
9680 IF TC <> 0 GOTO 9720
9690 PRINT
9700 PRINT "All I want is your life!"
9710 GOTO 9850
9720 Q=FNA(8)
9730 IF T(Q)=0 GOTO 9720
9740 PRINT
9750 PRINT "I want ";C$(Q+25);". Will you give it to me?";
9760 GOSUB 11610
9770 IF O$="N" GOTO 9850
9780 IF O$ <> "Y" THEN PRINT Y$ : GOTO 9740
9790 T(Q)=0
9800 TC=TC-1
9810 PRINT
9820 PRINT "OK, just don't tell anyone else."
9830 VF=VF+(L(FND(Z))=25)
9840 GOTO 3640
9850 Q3=2
9860 IF WC <= 0 GOTO 9890
9870 WC=WC-1
9880 IF WC=0 THEN PRINT : PRINT "The web just broke!"
9890 Z$=RIGHT$(C$(A+12),LEN(C$(A+12))-2)
9900 IF LEFT$(Z$,1)=" " THEN Z$=MID$(Z$,2)
9910 IF WC <= 0 GOTO 9950
9920 PRINT
9930 PRINT "The ";Z$;" is stuck and can't attack now!"
9940 GOTO 10130
9950 PRINT
9960 PRINT "The ";Z$;" attacks!"
9970 IF DX < FNA(7)+FNA(7)+FNA(7)+3*BL GOTO 10080
9980 PRINT
9990 HIT=INT(RND(0)*3)
10000 ON HIT GOTO 10010,10030,10050
10010 PRINT "The blow barely misses your left leg making sparks a huge dent in the floor!"
10020 GOTO 10130
10030 PRINT "The ";Z$;" charges at you but you dodge out of the way just in time!"
10040 GOTO 10130
10050 PRINT "The ";Z$;" just  barely misses your ear!"
10060 GOTO 10130
10070 GOTO 10130
10080 PRINT
10090 COLOR 12,0,4:BEEP:PRINT "Thud! The ";Z$;" hit you!":BEEP:COLOR 3,0,12
10100 Q=Q1
10110 GOSUB 10240
10120 IF ST < 1 GOTO 10340
10130 IF O$ <> "R" GOTO 8820
10140 PRINT
10150 PRINT "You have escaped!"
10160 PRINT
10170 PRINT "Do you want to go North, south, east, or west?";
10180 GOSUB 11610
10190 IF O$="N" OR O$="S" OR O$="E" OR O$="W" GOTO 5030
10200 PRINT
10210 COLOR 11,0,15:PRINT "** Don't press your luck, ";R$(RC);"!":COLOR 3,0,12
10220 PRINT
10230 GOTO 10170
10240 IF AV=0 GOTO 10320
10250 Q=Q-AV
10260 AH=AH-AV
10270 IF Q < 0 THEN AH=AH-Q : Q=0
10280 IF AH >= 0 GOTO 10320
10290 AH=0 : AV=0
10300 PRINT
10310 PRINT "Your armor is damaged beyond use . . . good luck!"
10320 ST=ST-Q
10330 RETURN
10340 PRINT CHR$(7)
10350 GOSUB 11530
10360 COLOR 3,0,7:PRINT "A noble effort, oh formerly living ";R$(RC);"!"
10370 PRINT
10380 PRINT "You died due to lack of ";
10390 IF ST < 1 THEN PRINT "Strength."
10400 IF IQ < 1 THEN PRINT "Intelligence."
10410 IF DX < 1 THEN PRINT "Dexterity."
10420 PRINT
10430 Q3=1
10440 PRINT "At the time you died, you had :":PRINT
10450 GOTO 10680
10460 Q3=0
10470 PRINT
10480 PRINT "You left the castle with";
10490 IF OF=0 THEN PRINT "out";
10500 PRINT " the Amulet of Chaos."
10510 PRINT
10520 IF OF=0 GOTO 10630
10530 CLS:GOTO 740
10540 CLS:COLOR 11,0,15:
10550 PRINT"                   ‹ﬂ €   € ‹ﬂﬂ‹ €  €   €     € ﬂ€ﬂ €‹   €  ‹€‹ ﬂ‹
10560 PRINT"          ‹‹‹ ﬂﬂﬂ €    ﬂ‹ﬂ  €  € €  €   €  ‹  €  €  € ﬂ‹ €  ﬂ€ﬂ   € ﬂﬂﬂ ‹‹‹
10570 PRINT"              ﬂﬂﬂ  ﬂ‹   €   ﬂ‹‹ﬂ ﬂ‹‹ﬂ    ﬂ‹ﬂ‹ﬂ  ‹€‹ €   ﬂ€   ‹  ‹ﬂ  ﬂﬂﬂ
10580 PRINT"
10590 PRINT "                         An incredibly glorious victory!!!!":COLOR 3,0,1
10600 PRINT
10610 PRINT "In addition, you got out with the following:"
10620 GOTO 10670
10630 PRINT
10640 PRINT "A less than awe-inspiring defeat."
10650 PRINT
10660 PRINT "When you left the castle, you had:"
10670 IF Q3=0 THEN PRINT "Your miserable life!"
10680 FOR Q=1 TO 8
10690 IF T(Q)=1 THEN PRINT C$(Q+25)
10700 NEXT Q
10710 PRINT W$(WV+1);" and ";W$(AV+5);
10720 IF LF=1 THEN PRINT " and a lamp";
10730 PRINT
10740 PRINT "You also had";FL;"flares and";GP!;"gold pieces"
10750 IF RF=1 THEN PRINT "and the Runestaff"
10760 PRINT "Your score was ";JOHN!
10770 PRINT "And it took you";T;"turns!"
10780 IF JOHN! < 20000 THEN RANK$ ="a Whimp"
10790 IF JOHN! > 35000! THEN RANK$="a Peasent"
10800 IF JOHN! > 50000! THEN RANK$="an Ametuer"
10810 IF JOHN! > 75000! THEN RANK$="a Scout"
10820 IF JOHN! > 90000! THEN RANK$="an Adventurer"
10830 IF JOHN! > 110000! THEN RANK$="a Hero"
10840 IF JOHN! > 125000! THEN RANK$="a Wizard"
10850 IF JOHN! > 140000! THEN GOTO 12470
10860 'GOTO 11290
10870 PRINT :PRINT "You are ranked as ";RANK$
10875 FOR A=2000 TO 800 STEP -2:SOUND A,.1:NEXT
10880 PLAY "MS T225 O2 P4 L8 ggg L4 g P8 L8 ggg L4 g P8 L8 gggggg L2 a# P5"
10890 PLAY "MS T225 O2 L8 ggg L4 g P8 L8 ggg L4 g P8 L8 gggggg L2 a# P5"
10900 PLAY "MS T225 O3 L8 ddd L4 d P8 L8 ddd L4 d P8 L8 dddddd L2 f P5"
10910 PLAY "MS T225 O3 L8 ddd L4 d P8 L8 ddd L4 d P8 L8 dddddd L2 f P5"
10920 PLAY "MS T210 O3 L3 d O2 a# L2 g P8 L2 a# L2 g P4"
10930 PLAY "MS T225 O2 L8 gggggg L2 a# P8 L8 gggggg L2 a# P8 L8 gggggg L2 a# P5 L4 fg P1 g"
10940 PRINT:PRINT  " Are you foolish enough to want to play again?";
10950 GOSUB 11610
10960 PRINT
10970 IF O$ <> "Y" GOTO 11030
10980 PRINT "Some ";R$(RC);"s never learn!"
10990 PRINT
11000 PRINT "Please be patient while the castle is restocked."
11010 PRINT
11020 GOTO 1610
11030 IF O$ <> "N" THEN PRINT Y$ : GOTO 10870
11040 PRINT "Maybe dumb ";R$(RC);" is not so dumb after all!"
11050 PRINT
11060 GOTO 11940
11070 PRINT
11080 'PRINT "Great unmitigated Nur£cc!"
11090 PRINT
11100 COLOR 28,0,15:BEEP:BEEP:PRINT "You just found The Amulet of Chaos!":BEEP:BEEP:COLOR 3,0,1
11110 ST=18
11120 IQ=18
11130 DX=18
11140 REQ=20000
11150 BF=0
11160 BL=0
11170 PRINT
11180 PRINT "The Runestaff has just disappeared!"
11190 RF=0
11200 OF=1
11210 O(1)=0
11220 GOTO 6370
11230 DATA An empty room,Œ,the entrance,Ô,stairs going up,U
11240 DATA stairs going down,D,a pool,P,a chest,C,gold pieces,G
11250 DATA flares,ü,a warp,€,a sinkhole,S,a Crystal Orb,Ë
11260 DATA a book,B,a Green Slime,≤,an Orc,ù,an Evil Dwarf,ù,a Goblin,ù,a Mind Flayer,ù
11270 DATA a Troll,ù,a Giant spider,ù,a Minotar,ù,a Drow,*,a Drider,ù
11280 DATA a Balor Demon,ù,a Red Dragon,Î,a Drow Merchant,Í,the Ruby Red,T
11290 DATA the Norn Stone,T,the Pale Pearl,T,the Opal Eye,T
11300 DATA the Green Gem,T,the Blue Flame,T,the Palantir,T,the Silmaril,T
11310 DATA X,"?",no weapon," Sandwich"
11320 DATA Dagger," stew",Mace," soup",Sword," burger",No armor," roast"
11330 DATA Leather," filet",Chainmail," taco",Plate mail," pie"
11340 DATA Hobbit,Elf,Man,Dwarf
11350 X=FNA(8) : Y=FNA(8)
11360 IF L(FND(Z)) <> 101 GOTO 11350
11370 L(FND(Z))=Q
11380 RETURN
11390 PRINT
11400 PRINT "You get all his wares :"
11410 PRINT "Plate mail"
11420 AV=3 : AH=21
11430 PRINT "A sword"
11440 WV=3
11450 PRINT "A strength potion"
11460 ST=FNC(ST+FNA(6))
11470 PRINT "An intelligence potion"
11480 IQ=FNC(IQ+FNA(6))
11490 PRINT "A dexterity potion"
11500 DX=FNC(DX+FNA(6))
11510 IF LF=0 THEN PRINT "A lamp" : LF=1
11520 GOTO 9290
11530 FOR Q=1 TO 64
11540 PRINT "*";
11550 NEXT Q
11560 PRINT
11570 PRINT
11580 RETURN
11590 PRINT
11600 PRINT "Your choice";
11610 INPUT O$
11620 O$=LEFT$(O$,1)
11630 RETURN
11640 PRINT "How many points do you wish to add to your ";Z$;
11650 INPUT O$
11660 PRINT
11670 Q=VAL(O$)
11680 IF Q=0 AND ASC(O$) <> 48 THEN Q=-1
11690 IF Q<0 OR Q>OT OR Q<>INT(Q) THEN PRINT "** "; : GOTO 11640
11700 OT=OT-Q
11710 RETURN
11720 INPUT O$
11730 Q=INT(VAL(O$))
11740 RETURN
11750 PRINT
11760 PRINT Z$;
11770 INPUT O$
11780 Q=INT(VAL(O$))
11790 IF Q > 0 AND Q < 9 THEN RETURN
11800 PRINT
11810 COLOR 11,0,15:PRINT "** Try a number from 1 to 8.":COLOR 3,0,1
11820 GOTO 11750
11830 PRINT
11840 PRINT "Do you want to buy a potion of ";Z$;" for 1000 gp's";
11850 GOTO 11610
11860 PRINT
11870 PRINT "Your ";Z$;" is now";Q;"."
11880 RETURN
11890 PRINT
11900 PRINT "These are the types of ";Z$;" you can buy :"
11910 RETURN
11920 COLOR 2,0,1:PRINT "You are at (";X;",";Y;") level";Z;".":COLOR 3,0,1
11930 RETURN
11940 END
11950 LET JOHN!=ST+IQ+DX+GP!-T
11960 PRINT
11970 PRINT"Your score at this time is ";JOHN!
11980 PRINT
11990 GOTO 4360
12000 LPRINT "*** TEMPLE OF LOTH'S COMMAND AND INFORMATION SUMMARY ***"
12010 LPRINT
12020 LPRINT "The following commands available are:"
12030 LPRINT
12040 LPRINT "H/elp     N/orth    S/outh    E/ast     W/est     U/p"
12050 LPRINT "D/own     DR/ink    M/ap      F/lare    L/amp     O/pen"
12060 LPRINT "G/aze     T/eleport Q/uit     #/Score
12070 LPRINT
12080 LPRINT "The contents of the rooms are as follows:"
12090 LPRINT
12100 LPRINT "Œ = empty room      B = book            C = chest"
12110 LPRINT "D = stairs down     Ô = entrance/exit   ü = flares"
12120 LPRINT "G = gold pieces     ù = monster         Ë = crystal orb"
12130 LPRINT "P = magic pool      S = sinkhole        T = treasure"
12140 LPRINT "U = stairs up       * = Drow            € = warp/amulet
12150 LPRINT
12160 LPRINT
12170 LPRINT "The benefits of having treasures are:"
12180 LPRINT
12190 LPRINT "RUBY RED - avoid lethargy    PALE PEARL - avoid leech"
12200 LPRINT "GREEN GEM - avoid forgetting  OPAL EYE - cure blindness"
12210 LPRINT "BLUE FLAME - dissolves books  NORN STONE - no benefit"
12220 LPRINT "PALANTIR - no benefit         SILMARIL - no benefit"
12230 LPRINT
12240 GOTO 4380
12250 END
12260 RF=1
12270 GOTO 4380
12280 PRINT
12290 COME=1
12300 PRINT"You hear footsteps...";
12310 SOUND 32767,28
12320 PRINT"The footsteps get louder!"
12330 SOUND 32767,28
12340 PRINT"You hear people talking in a strange language."
12350 SOUND 32767,28
12360 PRINT"Oh, No!! the Drow have returned!!!
12370 DROW=INT(RND*100)
12380 IF DROW < 10 GOTO 12430
12390 ST=0
12400 IQ=0
12410 DX=0
12420 GOTO 10350
12430 PRINT
12440 PRINT "You escaped just in time!"
12450 PRINT
12460 GOTO 10510
12470 LOCATE 25,1:INPUT "Press return to continue.";QWERTYU$
12480 CLS:COLOR 26,0,1
12490 PRINT "  ‹‹   ‹‹  ‹   ‹  ‹‹  ‹‹‹   ‹‹  ‹‹‹  ‹  ‹ ‹    ‹‹  ‹‹‹‹‹ ‹  ‹‹  ‹   ‹  ‹‹    ‹
12500 PRINT " €  ﬂ €  € €€  € €  ﬂ €  € €  € €  € €  € €   €  €   €   € €  € €€  € €  ﬂ  € €
12510 PRINT " €    €  € € € € €    €‹‹ﬂ €‹‹€ €  € €  € €   €‹‹€   €   € €  € € € €  ﬂﬂ‹  € €
12520 PRINT " €  ‹ €  € €  €€ € ﬂ€ € ﬂ‹ €  € €  € €  € €   €  €   €   € €  € €  €€ ‹  €   ﬂ
12530 PRINT "  ﬂﬂ   ﬂﬂ  ﬂ   ﬂ  ﬂﬂ  ﬂ  ﬂ ﬂ  ﬂ ﬂﬂﬂ   ﬂﬂ  ﬂﬂﬂ ﬂ  ﬂ   ﬂ   ﬂ  ﬂﬂ  ﬂ   ﬂ  ﬂﬂ    ﬂ
12540 COLOR 3,0,1:PRINT
12550 PRINT
12560 PRINT " You have been ranked as a Lord with a score of ";JOHN!
12570 PRINT
12580 IF JOHN! > 142498! THEN PRINT " Don't forget to replace my score on Tem-Ins.Bas
12590 GOTO 10880
12600 CLS:KEY OFF:COLOR 3,0,1
12610 LOCATE 1,28:COLOR 27,0,1:PRINT "Temple of Loth instructions"
12620 COLOR 3,0,1:LOCATE 4,3
12630 PRINT "     Temple of Loth is a computerized simulation of one of the most common and       popular fantasy motifs, the lone adventurer's quest with an immense under       ground labyrinth. Each game is separate from all others, so the game is a"
12640 PRINT "     challenge even after you have won. Each game will result in a win or loss       depending on the player's  skill and luck.  The instruction  which follow       will explain the rules and options of the game.
12650 COLOR 3,0,1:LOCATE 12,7:PRINT "A. Character Creation
12660 'LOCATE 4,45:PRINT "A. Sex
12670 'LOCATE 5,7:PRINT "C. Points
12680 LOCATE 12,45:PRINT "B. Equipments
12690 'LOCATE 5,7:PRINT "C. Lamps and Flares
12700 LOCATE 13,7:PRINT "C. The Temple
12710 LOCATE 13,45:PRINT "D. Player Commands
12720 LOCATE 14,7:PRINT "E. Magic Spells
12730 LOCATE 14,45:PRINT "F. Treasures, Curses and Such
12740 LOCATE 15,7:PRINT "G. Drow Merchants
12750 LOCATE 15,45:PRINT "H. Monsters and The Runestaff
12760 LOCATE 16,7:PRINT "I. Warps and ";:COLOR 11,0,1:PRINT "The Amulet of Chaos ":COLOR 3,0,1
12770 LOCATE 16,45:PRINT "J. Error Messages
12780 LOCATE 17,7:PRINT "K. Scoring
12790 LOCATE 17,45:PRINT "L. Comments and Suggestions
12800 LOCATE 18,7:PRINT "M. Return to game
12810 LOCATE 20,6
12820 COLOR 11,0,1:INPUT "Type in the number of the section desired then press return";A$
12830 '$=CHR$(ASC(A$) OR &H20)
12840 IF A$="a" GOTO 13000
12845 IF A$="A" GOTO 13000
12850 IF A$="b" GOTO 13230
12855 IF A$="B" GOTO 13230
12860 IF A$="c" GOTO 13490
12865 IF A$="C" GOTO 13490
12870 IF A$="d" GOTO 13810
12875 IF A$="D" GOTO 13810
12880 IF A$="e" GOTO 14270
12885 IF A$="E" GOTO 14270
12890 IF A$="f" GOTO 14390
12895 IF A$="F" GOTO 14390
12900 IF A$="g" GOTO 14680
12905 IF A$="G" GOTO 14680
12910 IF A$="h" GOTO 14780
12915 IF A$="H" GOTO 14780
12920 IF A$="i" GOTO 14910
12925 IF A$="I" GOTO 14910
12930 IF A$="j" GOTO 15010
12935 IF A$="J" GOTO 15010
12940 IF A$="l" GOTO 15090
12945 IF A$="L" GOTO 15090
12950 IF A$="k" GOTO 15230
12955 IF A$="K" GOTO 15230
12960 IF A$="m" GOTO 15490
12965 IF A$="M" GOTO 15490
12970 IF A$=CHR$(13) GOTO 12820
12980 PRINT :COLOR 11,0,15:PRINT "Invalid input, try again":COLOR 3,0,1
12990 GOTO 12810
13000 CLS
13010 COLOR 11,0,1
13020 PRINT "                                  CHARACTER CREATION
13030 PRINT:COLOR 3,0,1
13040 PRINT "     At the start of each game you will be asked a number of questions about"
13050 PRINT "what type of character you will have. You must make the choices as follows:
13060 PRINT
13070 PRINT "RACE     You may be an Elf, Dwarf, Man, or Hobbit. Each score is randomly "
13080 PRINT "         generated, but bonus and deductions are different for each race."
13090 PRINT
13100 PRINT "SEX      You may be a female or male. Both are equal in number of points."
13110 PRINT "         Be creative in your response.
13120 PRINT
13130 PRINT "POINTS   Each character starts with a number of points for the attributes"
13140 PRINT "         of strength (ST), intelligence (IQ), and dexterity (DX).  In addition,"
13150 PRINT "         there are some other points you may distribute between these three"
13160 PRINT "         attributes as you wish.
13170 PRINT
13180 PRINT "         Your ST, IQ, and DX may be any number from 1 to 18. If any of the "
13190 PRINT "         three drop below 1, you have died. For all three attributes, the "
13200 PRINT "         larger the numerical value, the better. "
13210 LOCATE 25,1:INPUT "Press enter to return to main menu";B$
13220 GOTO 12600
13230 CLS:COLOR 11,0,1
13240 PRINT "                                   EQUIPMENT
13250 PRINT:COLOR 3,0,1
13260 PRINT "    Every character is given 60 gold pieces (gp's), at the beginning of each"
13270 PRINT "to purchase some of the following items.
13280 PRINT
13290 PRINT "ARMOR    You may buy platemail armor for 30 gp's, chainmail for 20 gp's or"
13300 PRINT "         leather for 10 gp's. You can only wear one suit of armor at a time."
13310 PRINT "         The more expensive the armor, the more damage it will absorb."
13320 PRINT
13330 PRINT "WEAPONS  You may buy a sword for 30 gp's, a mace for 20 gp's, or a dagger for "
13340 PRINT "         10 gp's. You can only carry a single weapon at a time.  The more ex-"
13350 PRINT "         pensive the weapon, the more damage it does to the various monsters."
13360 PRINT
13370 PRINT "LAMP     If after selecting armor and weapons, you have 20 gp's left , you may"
13380 PRINT "         buy a lamp for 20 gp's. Having the lamp will allow you to look into"
13390 PRINT "         an adjacent room without having to enter it.
13400 PRINT
13410 PRINT "FLARES   If, after all purchases , you have money left, you may buy flares for"
13420 PRINT "         1 gp each. Lighting a flare reveals the contents of all the rooms "
13430 PRINT "         surrounding your current location.
13440 PRINT
13450 PRINT "         Once you have equipped your character, you are ready to enter the"
13460 PRINT "         Temple and begin your quest.
13470 LOCATE 25,1:INPUT "Press enter to return to main menu.";B$
13480 GOTO 12600
13490 CLS:COLOR 11,0,1
13500 PRINT "                                   THE TEMPLE
13510 COLOR 3,0,1:PRINT
13520 PRINT "     The temple is arranged in a 8x8x8 three dimensional matrix.  This means     that there are 8 levels with 64 rooms on each level. The temple levels are      are numbered from 1 (the top level) to 8 (the bottom level. Each temple level
13530 PRINT " is constructed in a doughnut like fashion, in that the north edge is connect    to the south edge and the east edge is connected to the west edge.  In a sim-   ular fashion, the sinkholes, explain later, on level 8 will "DROP" you down
13540 PRINT " to level 1. The only room that does not work in this fashion is always locat-   ed at location (1,4) level 1. Going north from this room will take you out of   the temple and end the game.
13550 PRINT
13560 PRINT " Each room of the temple will have contents as one of the following.
13570 PRINT
13580 PRINT "   Ô = The entrance / exit room
13590 PRINT "   Œ = An empty room containing nothing
13600 PRINT "   U = Stairs going up a level
13610 PRINT "   D = Stairs going down a level
13620 PRINT "   P = Magic Pool from which you may drink
13630 PRINT "   C = A chest you may open.
13640 PRINT "   B = A book you may open
13650 PRINT "   G = From 1 to 10 gold pieces
13660 PRINT "   ü = From 1 to 3 flares
13670 PRINT "   € = A warp to another random location
13680 LOCATE 25,1:INPUT "Press return to continue";B$
13690 LOCATE 25,1:PRINT "                              "
13700 LOCATE 22,1
13710 PRINT "   ù = A monster (1 of 9 different types)
13720 PRINT "   * = A Drow fighter
13730 PRINT "   Ë = A crystal orb
13740 PRINT "   T = A treasure (1 of 8 in the castle)
13750 PRINT "   ≤ = A Green Slime
13760 PRINT "   4 = A Red Dragon
13770 PRINT
13780 PRINT "     The letters are the abbreviations for the room contents which are display-  ed whenever you look at a map or light a flare. When you look at a map, the     room you are currently located in is bracketed by < >
13790 LOCATE 25,1:INPUT "Press enter to return to main menu";B$
13800 GOTO 12600
13810 CLS:COLOR 11,0,1
13820 PRINT "                             PLAYER COMMANDS
13830 COLOR 3,0,1:PRINT
13840 PRINT "     Whenever the program asks for a command, you must decide what action you    wish to preform. If your choice is not valid, the program will inform you and   allow you to try agian.  The following is a list of commands which the pro-
13850 PRINT " gram understands, with a description of their effects and restrictions:"
13860 PRINT
13870 PRINT " NORTH   Moves you to the room north from your present position. When go north           from the entrance / exit room, the game terminates. In all cases,              the north edge wraps around from the south.
13880 PRINT
13890 PRINT " SOUTH   Moves you to the room south of your present position. In all cases,             the south edge wraps around to the north edge.
13900 PRINT
13910 PRINT " EAST    Moves you to the room east of your present position. In all cases, the          east edge wraps around to the west.
13920 PRINT
13930 PRINT " WEST    Moves you to the room west of your present position. In all cases, the          west edge wraps around to the east.
13940 PRINT
13950 PRINT " UP/DOWN Causes you to ascend/descend stairs. You must be in a room containing           stairs to use this command.
13960 PRINT
13970 LOCATE 25,1:INPUT "Press return to continue";B$
13980 LOCATE 25,1:PRINT "                           "
13990 LOCATE 22,1
14000 PRINT " DRINK   Causes you to take a drink from a magic pool. You may repeat this               command as often as you wish, but you must be in a room with a pool             to use this command.
14010 PRINT
14020 PRINT " MAP     Causes a map of the level you are currently on to be printed. All               unexplored  rooms are displayed as `?'.  All other rooms are dis-               played as their one character symbols. You may look at your map at
14030 PRINT
14040 PRINT " FLARE   Cause one of your flares to be lit, revealing the contents of all the           rooms surrounding your current location. Because each edge is joined            to the opposite edge, you will always see nine rooms with your loca-
14050 PRINT "         as long as you have some and you are not blind or fighting a monster.
14060 PRINT
14070 PRINT " LAMP    Allows you to shine your lamp into any one of the rooms north, south,           east, and west of your current position, revealing the room contents.           Unlike flares, the lamp may be used repeatedly. You may use your lamp
14080 PRINT "         at any time as long as you have one, are not blind, and not attacking           a monster.
14090 PRINT
14100 PRINT " OPEN    Causes you to open a book or a chest which is in the room with you."
14110 PRINT
14120 LOCATE 25,1:INPUT "Press return to continue";B$
14130 LOCATE 25,1:PRINT "                          "
14140 LOCATE 22,1
14150 PRINT " GAZE    Causes you to gaze into a crystal orb. When you see yourself in a               bloody mess, you lose 1 or 2 points of strength.  When you see the              location of the ";:COLOR 11,0,1:PRINT "Amulet of Chaos";:COLOR 3,0,1
14160 PRINT ", there is only a 50% chance that it "
14170 PRINT "         is correct. You cannot gaze when you are blind or when you are not in           a room containing a crystal orb."
14180 PRINT
14190 PRINT " TELE-   Allows you to teleport directly into a specific room any where in the   PORT    temple. This is the only way you can can enter the room containing              the";:COLOR 11,0,1:PRINT " Amulet of Chaos.";:COLOR 3,0,1
14200 PRINT " You must have the Runestaff to teleport!
14210 PRINT
14220 PRINT " QUIT    Allows you to end the game while you are still in the temple. You will          be asked if you are, in case you change your mind. If you quit, you             will lose the game.
14230 PRINT
14240 PRINT " HELP    Causes a summary of available commands, abbreviations used in des-               cribing the contents of rooms, and the benefits of possessing each of            the treasures to be displayed at any time.
14250 LOCATE 25,1:INPUT "Press enter to return to main menu";B$
14260 GOTO 12600
14270 CLS:COLOR 11,0,2
14280 PRINT "                      MAGIC SPELLS"
14290 COLOR 3,0,1:PRINT
14300 PRINT "     When ever your intelligence (IQ) becomes 15 or higher, you gain the option  of casting a magic spell on a monster if you have the very first combat         option. The three spells and there effects are as follows:
14310 PRINT
14320 PRINT " WEB     Traps the monster in a sticky web so that it can't fight back as you            attack it. This spell lasts from 2 to 9 turns and costs you one                 strength (ST) point.
14330 PRINT
14340 PRINT " FIRE-   Hits the monster with a ball of flame that causes between 2 and 14      BALL    points worth of damage instantly. It costs one strength points and one          point of intelligence.
14350 PRINT
14360 PRINT " DEATH   is a contest of will between the monster and yourself, whoever has              the lower intelligence dies at once. It costs nothing to use, but it             is very risky. Even with an IQ of 18 (the highest possible), you
14370 LOCATE 25,1:INPUT "Press enter to return to main menu";B$
14380 GOTO 12600
14390 CLS:COLOR 11,0,1
14400 PRINT "                       TREASURE, CURSES, AND SUCH
14410 COLOR 3,0,1:PRINT
14420 PRINT "     In the temple there are eight randomly placed treasures:
14430 PRINT
14440 PRINT " The Ruby Red - Wards off the curse of lethargy.
14450 PRINT " The Pale Pearl - Wards off the curse of the leech.
14460 PRINT " The Opal Eye - Cures blindness.
14470 PRINT " The Green Gem - Wards off the curse of forgetfulness.
14480 PRINT " The Blue Flame - Dissolves books stuck to your hands.
14490 PRINT " The Norn Stone - Has no special power.
14500 PRINT " The Palantir - Has no special power.
14510 PRINT " The Silmaril - Has no special power.
14520  PRINT
14530 PRINT "     THERE ARE THREE CURSES:"
14540 PRINT
14550 PRINT " LETHARGY - This gives the monster the first attack which prevents you from                 bribing him or casting a spell on them.
14560 PRINT
14570 PRINT " LEECH - This takes from 1 to 5 gp's from you each turn until you have no gold           left at all!
14580 PRINT
14590 LOCATE 25,1:INPUT "Press return to continue";B$
14600 LOCATE 25,1:PRINT "                            "
14610 LOCATE 20,1
14620 PRINT " FORGETFULNESS - This causes you to forget what you know about each level of the          temple.  Your map will slowly turn back to all question marks, How-             ever, the contents of the rooms stay the same.
14630 PRINT
14640 PRINT "     In addition to nullifying the effects of the curses, the treasures can          also provide protection from two undesirable things which can happen            when you open a book.  These are going blind and which prevent you from"
14650 PRINT "     seeing your maps, lighting flares, using your lamp, gazing into orbs, and       being informed or your current location, and secondly, having a book            stuck to your hands, which prevents you to draw your weapon to fight
14660 LOCATE 25,1:INPUT "Press enter to return to main menu";B$
14670 GOTO 12600
14680 CLS:COLOR 11,0,1
14690 PRINT "                             DROW MERCHANTS
14700 COLOR 3,0,1:PRINT
14710 PRINT "      On every level there are Drow Merchants who sell necessary items at in-     flated prices. Normally, the merchants will make you an offer for every         treasure you have, and then, depending on the amount of gold you have, will"
14720 PRINT " sell you new armor, a new weapon, a potion of strength, intelligence, and       dexterity (no matter how many potions you buy, the maximum amount for these
14730 PRINT " attributes is 18), and a lamp, if you don't already have one. If you chose to   attack the merchant, you will antagonize every one in the temple, and they      will all react as monsters. You will also lose the ability to trade with"
14740 PRINT " them. Killing a merchant, however, will give you new platemail, a sword, one    of each kind of potion, and a lamp (if you don't already have one, in add-      ition to his hoard of between 1 and 1000 gold pieces. To end hostilities"
14750 PRINT " and reestablish trading privileges, you must bribe any Merchant Drow in the     castle with the treasure of his choice.
14760 LOCATE 25,1:INPUT "Press enter to return to main menu";B$
14770 GOTO 12600
14780 CLS:COLOR 11,0,1
14790 PRINT "                         MONSTERS AND THE RUNESTAFF"
14800 COLOR 3,0,1:PRINT
14810 PRINT "     There are 12 types of monsters in the temple:
14820 PRINT
14830 PRINT " Green Slime, Orcs, Evil Dwarfs, Goblins, Mind Flayers, Trolls, Giant Spiders    Minotaurs, Driders, Balor Demon, Reds Dragons, and Drow Warriors."
14840 PRINT
14850 PRINT "     Please note that each time you strike a Drow Warrior or a Red Dragon,       there is a chance that your weapon will be shattered."
14860 PRINT
14870 PRINT "     Each monster possesses a hoard of from 1 to 1000 gp's which you obtain      when you kill a monster. In addition, one of the monsters is also carring The   Runestaff, (you won't know which until one until you kill it). You must have"
14880 PRINT " The Runestaff to teleport, and when you teleport into the room with The         Amulet of Chaos, The Runestaff will disappear. (You must find your way out of   the temple without it)."
14890 LOCATE 25,1:INPUT "Press enter to return to main menu";B$
14900 GOTO 12600
14910 CLS:COLOR 11,0,1
14920 PRINT "                         WARPS AND ";:COLOR 27,0,1:PRINT "THE AMULET OF CHAOS"
14930 COLOR 3,0,1:PRINT
14940 PRINT "      All but one of the rooms donated as `€' are truly warps. Walking, fall-    ing, or teleporting into one of these warps will cause you to be instantly      transported to anywhere in the temple at random. The one exception to this"
14950 PRINT " rule is the room containing ";:COLOR 11,0,1:PRINT "The Amulet of Chaos";:COLOR 3,0,1:PRINT ". This room is disguised as a"
14960 PRINT " warp. Walking into this room causes you to move one room further in the same    direction. To actually enter this room, you must teleport in using The Rune-"
14970 PRINT " staff. At this point, you will acquire ";:COLOR 11,0,1:PRINT "The Amulet of Chaos";:COLOR 3,0,1:PRINT ". The Runestaff will"
14980 PRINT " disappear at this point. Remember, to win the game, you must leave the temple   with the amulet in your possession."
14990 LOCATE 25,1:INPUT "Press enter to return to the main menu";B$
15000 GOTO 12600
15010 CLS:COLOR 11,0,1
15020 PRINT"                             ERROR MESSAGES"
15030 COLOR 3,0,1:PRINT
15040 PRINT "     Anytime you receive a highlighted message with a `**', it means that the     last thing you typed was unacceptable to the program at the time. For in- "
15050 PRINT " stance ";:COLOR 11,0,1:PRINT "** It's hard to gaze without an orb.";:COLOR 3,0,1:PRINT ", this means that you tried to"
15060 PRINT " gaze from a room which did not contain a crystal orb. You are always required   to redo your last response when you receive an `**' message.
15070 LOCATE 25,1:INPUT "Press enter to return to main menu";B$
15080 GOTO 12600
15090 CLS:COLOR 11,0,1
15100 PRINT "     :â 16030
10250 IF A$="5" THEN CLS:GOTO 18030
10260 IF A$="6" THEN CLS:GOTO 15030
10270 IF A$<>"1" AND A$<>"2" AND A$<>"3" AND A$<>"4" AND A$<>"5" AND A$<>"6"THEN 10190
10280 GOSUB 17030:GOTO 12030
11000 '
11010 REM ** CORRECT RECORD **
11020 '
11030 CLS:LOCATE 1,1:COLOR 15,0,0:PRINT"GAME #";L:LOCATE 3,1:COLOR 6,0,0::PRINT"GAME     ";
11040 LOCATE 5,1:PRINT"SCORE    ";
11050 LOCATE 7,1:PRINT"PLAYER   ";
11060 LOCATE 9,1:PRINT"DATE     ";
11070 ROW=3:COL=8:MAXLEN=26:SELECT$=ALPHA$+NUM$+CHAR$+" ":COLOR 14:IN$=C$(L):PT=1:GOSUB 22040:TC$=IN$
11080 ROW=5:COL=8:MAXLEN=7:SELECT$=NUM$:IN$=H$(L):PT=1:GOSUB 22040:TH$=IN$
11090 ROW=7:COL=8:MAXLEN=11:SELECT$=ALPHA$+NUM$+CHAR$+" ":IN$=P$(L):PT=1:GOSUB 22040:TP$=IN$
11100 ROW=9:COL=8:MAXLEN=8:SELECT$=NUM$+"/":IN$=D$(L):PT=1:GOSUB 22040:TD$=IN$
11110 LOCATE 15,1:COLOR 4,0,0:PRINT"Is the above information correct?";
11120 A$=INKEY$
11130 IF A$="y" OR A$="Y" THEN CLS:H$(L)=TH$:P$(L)=TP$:D$(L)=TD$:IF TC$=C$(L) THEN GOTO 10040:ELSE C$(L)=TC$:GOTO 9030:'If NAME OF GAME is unchanged there is no need to resort
11140 IF A$="n" OR A$="N" THEN 11030
11150 GOTO 11120
12000 '
12010 REM ** PRINTING ROUTINE **
12020 '
12030 G1$="N A M E   O F   T H E   G A M E"  '3 spaces in between words
12040 N1$="HIGH SCORER"e. The scoring formula goes   as follows:"
15270 PRINT
15280 PRINT "     1 point for each gold piece  +  100 times your combined attribute scores"
15290 PRINT
15300 PRINT "       + 1000 points for each monster killed  - 5 times the turns played"
15310 PRINT
15320 PRINT " Bonus points are scored as follows:
15330 PRINT "
15340 PRINT "                  5000 for each treasure
15350 PRINT "                 10000 for finding the Runestaff
15360 PRINT "                 20000 for finding the Amulet of Chaos
15370 PRINT "
15380 PRINT " You will then be ranked into one of the following classes:
15390 PRINT
15400 PRINT "             0 - 20000  Whimp                  20000 - 35000  Peasent
15410 PRINT "         35000 - 50000  Ameteur                50000 - 75000  Scout
15420 PRINT "         90000 -110000  Adventurer            110000 -125000  Hero
15430 PRINT "        125000 -140000  Wizard                140000+  Lord
15440 PRINT "
15450 PRINT "  The highest score to date is that of Lord Nur£cc: 142,498
15460 LOCATE 25,1
15470 LINE INPUT "Press enter to return to Main Menu";B$
15480 GOTO 12600
15490 CLS
15500 GOTO 1400
15925 IF A$="I" GOTO 14910
