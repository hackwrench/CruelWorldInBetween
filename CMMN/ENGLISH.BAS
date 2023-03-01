DEFINT A-Z
DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)
DECLARE FUNCTION NotHave$ (N$, Y$)
DECLARE FUNCTION Trunc1$ (Text$, X%)
DECLARE FUNCTION NoUnderstand1$ (N$, N2$)
DECLARE FUNCTION Contractables$ (Contract%, Which%)
DECLARE FUNCTION Clause1$ (Group%, Action$)
DECLARE FUNCTION JustWhat$ ()
DECLARE FUNCTION Tired$ (B$, Emote1%)
DECLARE FUNCTION Quant1$ (Emote1%)
DECLARE FUNCTION HaveTo$ ()
DECLARE FUNCTION Glib1$ (N$, P$)
DECLARE FUNCTION DontCare$ ()
DECLARE FUNCTION LayingWithTrowel$ (N$)
DECLARE FUNCTION Dontthink1$ ()

SUB BuyItems.Intro (ItemType$)
    CALL Font.Regular("These are the types of " + ItemType$ + " you can buy:", 1, 17, 3)
END SUB

SUB Capitalize.First (Text$)
    Text$ = UCASE$(LEFT$(Text$, 1)) + RIGHT$(Text$, LEN(Text$) - 1)
END SUB

FUNCTION Clause1$ (Group, Action$)
    SELECT CASE Group
           CASE 1
                Clause1 = "do I " + Action$ + " I am"
           CASE 2
                Clause1 = "do you" + Action$ + "you are"
           CASE 3
                Clause1 = "does he" + Action$ + "he is"
           CASE 4
                Clause1 = "does she" + Action$ + "she is"
           CASE 5
                Clause1 = "do we" + Action$ + "we are"
           CASE 6
                Clause1 = "do they" + Action$ + "they are"
           CASE ELSE
    END SELECT
END FUNCTION

FUNCTION Contractables$ (Contract, Which)
    SELECT CASE Contract
           CASE 1
                IF Which = 1 THEN
                   Contractables = "n't"
                ELSE
                   Contractables = " not"
                END IF
    END SELECT
END FUNCTION

FUNCTION DontCare$
    DontCare = "Look, I'm sorry, but right now I dont really care about what other people"
END FUNCTION

FUNCTION Dontthink1$
   Dontthink1 = "Don't think you can get away from me that easily"
END FUNCTION

FUNCTION Glib1$ (N$, P$)
    Glib1$ = "I'm a" + N$ + ", not a" + P$ + "."
END FUNCTION

FUNCTION HaveTo$
    HaveTo = "having to"
END FUNCTION

FUNCTION JustWhat$
    JustWhat = "just what do you think you are doing"
END FUNCTION

FUNCTION LayingWithTrowel$ (N$)
    LayingWithTrowel$ = "laying on the " + N$ + "trowel"
END FUNCTION

FUNCTION NotHave$ (N$, Y$)
    NotHave = N$ + " doesn't have" + Y$ + "."
END FUNCTION

FUNCTION NoUnderstand1$ (N$, N2$)
    NoUnderstand1$ = N$ + "can't understand" + N2$
END FUNCTION

FUNCTION Quant1$ (Emote1)
    SELECT CASE Emote1
           CASE 1
                Quant1 = "never"
           CASE 2
                Quant1 = "always"
           CASE ELSE
    END SELECT
END FUNCTION

SUB ThinkDoing

END SUB

FUNCTION Tired$ (B$, Emote1)
    Tired = "I'm tired of" + Quant1(Emote1) + B$
END FUNCTION

FUNCTION Trunc1$ (Text$, X%)
    IF LEN(Text$) <= X% THEN
       Trunc1$ = Text$
       Text$ = ""
       EXIT FUNCTION
    END IF
    Temp = X% + 1
    DO
      IF MID$(Text$, Temp, 1) = " " THEN
         Trunc1$ = MID$(Text$, 1, Temp)
         IF Temp = X% + 1 THEN
            Text$ = ""
         ELSE
            Text$ = MID$(Text$, Temp + 1)
         END IF
         EXIT FUNCTION
      END IF
    LOOP
END FUNCTION

