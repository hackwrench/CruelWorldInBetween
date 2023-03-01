DEFINT A-Z
'=============================================
' ABC Reader (09/1997) Robert Claypool
'=============================================
'$DYNAMIC

TYPE RegTypeX
	 ax    AS INTEGER
	 bx    AS INTEGER
	 cx    AS INTEGER
	 dx    AS INTEGER
	 bp    AS INTEGER
	 si    AS INTEGER
	 di    AS INTEGER
	 flags AS INTEGER
	 ds    AS INTEGER
	 es    AS INTEGER
END TYPE

TYPE DataTransferArea
	   Reserved1   AS STRING * 21
	   Attribute   AS STRING * 1
	   FileTime    AS INTEGER
	   Filedate    AS INTEGER
	   FileSize    AS LONG
	   Filename    AS STRING * 13
END TYPE

TYPE DirectoryRecord
	 Filename    AS STRING * 13
	 FileSize    AS LONG
	 Filedate    AS INTEGER
	 FileTime    AS INTEGER
	 FileAttb    AS INTEGER
END TYPE

TYPE SelectListData
	Fore AS INTEGER
	Back AS INTEGER
	SelFore AS INTEGER
	SelBack AS INTEGER
	X AS INTEGER
	Y AS INTEGER
	YSize AS INTEGER
	CurrSelection AS INTEGER
	TopSelection AS INTEGER
	Style AS INTEGER
	MaxSelection AS INTEGER
END TYPE

TYPE DosPListT
	ax AS INTEGER
	bx AS INTEGER
	cx AS INTEGER
	dx AS INTEGER
	si AS INTEGER
	di AS INTEGER
	ds AS INTEGER
	es AS INTEGER
	Rsrvd AS INTEGER
	CompID AS INTEGER
	ProcID AS INTEGER
END TYPE

DECLARE SUB ABCListInit ()
DECLARE SUB PRINTFill (Txt AS STRING, Length AS INTEGER)


DECLARE SUB ReadABC (ABCFileName$, Position&)
DECLARE SUB DrawBox (X%, Y%, XX%, YY%, C%, BC%, Solid%, CharSet%)
DECLARE SUB Shadow (Uprow, Ltcol, Lorow, Rtcol, Attr, Focus)
DECLARE SUB Scroll (Trow, Lcol, Brow, Rcol, Lines, Attr, Way)
DECLARE SUB DTASet (DTA AS ANY)
DECLARE SUB PrintDirEntry (DR AS ANY, FindStatus%)
DECLARE SUB TransferDTA2DIR (DEntry AS ANY)
DECLARE FUNCTION FindFirst% (Attr%, Filename$, DEntry AS ANY)
DECLARE FUNCTION FindNext% (DEntry AS ANY)
DECLARE FUNCTION FmtDate$ (FDate%)
DECLARE FUNCTION FmtTime$ (t%)
DECLARE FUNCTION RStr$ (X%, LX%)
DECLARE FUNCTION Exist% (seed$, SearchAttrb%)
DECLARE FUNCTION floppyDriveReady% (drive$)
DECLARE SUB FilterTab (LText$)
DECLARE SUB DisplayReader ()
DECLARE SUB PrintText (LText$, X%)
DECLARE SUB ABCList (Filename$)
DECLARE SUB FastSorti (inarray() AS ANY, Lower%, Upper%)
DECLARE SUB LoadABCode (Filename$)
DECLARE SUB FillScreen ()
DECLARE FUNCTION TinyInput$ (Original$, Length, AutoCap, Allowed$)
DECLARE FUNCTION Rename% (OldName$, NewName$)
DECLARE SUB Confirm (Answer)
DECLARE SUB ReadInSetup ()
DECLARE SUB SaveSetup ()
DECLARE SUB SETUP ()
DECLARE SUB StartUp ()


DIM SHARED InRegsX AS RegTypeX
DIM SHARED OutRegsX AS RegTypeX
DIM SHARED DTA AS DataTransferArea
DIM DirEntry AS DirectoryRecord

DIM SHARED From AS STRING * 31
DIM SHARED Subject AS STRING * 31
DIM SHARED SearchStrings AS STRING * 31
DIM SHARED DateOf AS STRING * 23
DIM SHARED CodeOf AS STRING * 23
DIM SHARED NumLines AS STRING * 5
DIM SHARED NumBytes AS STRING * 9
DIM SHARED SaveFile AS STRING * 12
DIM SHARED Text AS STRING * 2048
DIM SHARED Index AS STRING * 78

DIM SHARED Height, HeaderOutLine, HeaderBackGround, HeaderOutLineChar
DIM SHARED HeaderInfo, Header, CommentColor, TextColor, HeaderIndent, DAC
DIM SHARED StatusColor, StatusBColor, StatusHighlight
DIM SHARED BodyOutLine, BodyBackGround, OutLineChar, BodyIndent
DIM SHARED DefaultSave$, BackHeight

DIM SHARED VidSeg%

DIM SHARED ListName(0 TO 0) AS STRING * 12, FileSnippets(0 TO 0) AS LONG
DIM SHARED ABCListData AS SelectListData

StartUp

ReadInSetup
BackHeight = Height

SCREEN 0, 0, 0, 0
WIDTH 80, Height
LOCATE , , 0
ABCListInit

DO
  FillScreen
  ABCList Filename$
  IF Filename$ = "" THEN GOTO ProgramEnd
  A = INSTR(Filename$, CHR$(0))
  IF A > 0 THEN Filename$ = LEFT$(Filename$, A - 1)
  LoadABCode Filename$
LOOP

ProgramEnd:
  COLOR 7, 0: CLS
  SYSTEM

SUB ABCList (Filename$)
	LOCATE 3, 3
	COLOR 0, 7
	PRINT "Number of ABC Packets:"; ABCListData.MaxSelection; "Total Snippets:"; FileSnippets(0)
	LOCATE 5, 30
	PRINTFill "Snippets in current selection: " + STR$(FileSnippets(1)), 31 + LEN(STR$(FileSnippets(0)))
	DrawBox 3, 5, 25, Height - 4, 11, 1, 1, 1
	Shadow 5, 3, Height - 4, 25, 8, 1
	GOSUB ABCListRedraw
	DO
	  DO
		V$ = INKEY$
	  LOOP UNTIL V$ <> ""
	  SELECT CASE V$
	  CASE CHR$(27)
		GOTO NOLOAD
	  CASE CHR$(13)
		GOTO LOAD
	  CASE CHR$(0) + "K"
		GOTO NOLOAD
	  CASE CHR$(0) + "M"
		GOTO LOAD 'Needs to be changed
	  CASE CHR$(0) + "="
		SETUP
	  CASE CHR$(0) + "P"
		GOSUB MenuDown
	  CASE CHR$(0) + "H"
		GOSUB MenuUp
	  CASE CHR$(0) + "Q"
		GOSUB MenuPgDn
	  CASE CHR$(0) + "I"
		GOSUB MenuPgUp
	  CASE CHR$(0) + "G"
		ABCListData.CurrSelection = 1
		ABCListData.TopSelection = 1
		GOSUB ABCListRedraw
	  CASE CHR$(0) + "O"
		IF ABCListData.MaxSelection > 11 THEN
		   ABCListData.CurrSelection = ABCListData.MaxSelection
		   ABCListData.TopSelection = ABCListData.MaxSelection - ABCListData.YSize + 1
		   GOSUB ABCListRedraw
		END IF
	  CASE ELSE
		IF ASC(UCASE$(V$)) > 64 AND ASC(UCASE$(V$)) < 91 THEN
		  FOR i = 1 TO ABCListData.MaxSelection
			FirstCase$ = LEFT$(ListName(i), 1)
			IF UCASE$(V$) = FirstCase$ THEN
			  Temp = ABCListData.CurrSelection - ABCListData.TopSelection
			  ABCListData.CurrSelection = i
			  IF (ABCListData.CurrSelection - Temp > ABCListData.MaxSelection - ABCListData.YSize) THEN
				ABCListData.TopSelection = ABCListData.MaxSelection - ABCListData.YSize + 1
			  ELSEIF Temp < ABCListData.CurrSelection THEN
				ABCListData.TopSelection = ABCListData.CurrSelection - Temp
			  ELSE
				ABCListData.TopSelection = 1
			  END IF
			  EXIT FOR
			END IF
		  NEXT i
		  GOSUB ABCListRedraw
		END IF
	  END SELECT
	LOOP

MenuDown:
  IF ABCListData.CurrSelection = ABCListData.MaxSelection THEN RETURN
 
  IF ABCListData.CurrSelection = ABCListData.TopSelection + ABCListData.YSize - 1 THEN
	ABCListData.TopSelection = ABCListData.TopSelection + 1
  END IF
  ABCListData.CurrSelection = ABCListData.CurrSelection + 1
  GOSUB ABCListRedraw
RETURN

MenuPgDn:
  SELECT CASE ABCListData.TopSelection
  CASE IS < ABCListData.MaxSelection - ABCListData.YSize - ABCListData.YSize + 1
	   ABCListData.TopSelection = ABCListData.TopSelection + ABCListData.YSize + 1
	   ABCListData.CurrSelection = ABCListData.CurrSelection + ABCListData.YSize + 1
  CASE IS < ABCListData.MaxSelection - ABCListData.YSize + 1
  'Anywhere in the section before the last viewable section is this strange
  'area that gets set to the last viewable section
  ABCListData.TopSelection = ABCListData.MaxSelection - ABCListData.YSize + 1
  IF ABCListData.CurrSelection > ABCListData.MaxSelection - ABCListData.YSize THEN
	 ABCListData.CurrSelection = ABCListData.MaxSelection
  ELSE
	 ABCListData.CurrSelection = ABCListData.CurrSelection + ABCListData.YSize
  END IF
  CASE ABCListData.MaxSelection - ABCListData.YSize + 1
	   IF ABCListData.CurrSelection = ABCListData.MaxSelection THEN RETURN
	   ABCListData.CurrSelection = ABCListData.MaxSelection
	   ABCListData.TopSelection = ABCListData.MaxSelection - ABCListData.YSize + 1
  CASE ELSE
	  PRINT "You REALLY shouldn't be seeing this on PgDn"
  END SELECT
  GOSUB ABCListRedraw
RETURN

MenuUp:
  IF ABCListData.CurrSelection = 1 THEN RETURN
  IF ABCListData.CurrSelection = ABCListData.TopSelection THEN
	 ABCListData.TopSelection = ABCListData.TopSelection - 1
  END IF
  ABCListData.CurrSelection = ABCListData.CurrSelection - 1
  GOSUB ABCListRedraw
RETURN

MenuPgUp:
  SELECT CASE ABCListData.TopSelection
  CASE 1
	   IF ABCListData.CurrSelection = 1 THEN
		  RETURN
	   ELSE
		  ABCListData.CurrSelection = 1
	   END IF
  CASE IS < ABCListData.YSize + 1
  'Anywhere in the first viewable section is this strange
  'area that gets set to the beginning of the first viewable section
  ABCListData.TopSelection = 1
  IF ABCListData.CurrSelection < ABCListData.YSize + 1 THEN
	 ABCListData.CurrSelection = 1
  ELSE
	 ABCListData.CurrSelection = ABCListData.CurrSelection - ABCListData.YSize
  END IF
  CASE IS > ABCListData.YSize + ABCListData.YSize
	   ABCListData.TopSelection = ABCListData.TopSelection - ABCListData.YSize
	   ABCListData.CurrSelection = ABCListData.CurrSelection - ABCListData.YSize
  CASE ELSE
	  PRINT "You REALLY shouldn't be seeing this on PgUp"
  END SELECT
  GOSUB ABCListRedraw
RETURN

ABCListRedraw:
   FOR i = 1 TO ABCListData.YSize
   LOCATE i + ABCListData.Y - 1, ABCListData.X
   IF i = ABCListData.CurrSelection - ABCListData.TopSelection + 1 THEN
	  COLOR 7, 0
   ELSE
	  COLOR 0, 7
   END IF
   PRINT " "; ListName(i + ABCListData.TopSelection - 1); " "
   NEXT
COLOR 0, 7
LOCATE 5, 30
PRINTFill "Snippets in current selection: " + STR$(FileSnippets(ABCListData.CurrSelection)), 31 + LEN(STR$(FileSnippets(0)))

RETURN
NOLOAD:
Filename$ = ""
GOTO ENDProgram

LOAD:

Filename$ = ListName(ABCListData.CurrSelection)

ENDProgram:
COLOR , 0

END SUB

REM $STATIC
SUB ABCListInit
	DIM DirEntry AS DirectoryRecord
	FileSpec$ = "*.ABC"

	CALL DTASet(DTA)
FindStatus = FindFirst(0, FileSpec$, DirEntry)
'We need to do a check for findstatus here
i = 1
FindStatus = FindNext(DirEntry)
	DO WHILE FindStatus = 0
	   i = i + 1
	   CALL DTASet(DTA)
	   FindStatus = FindNext(DirEntry)
	LOOP
	ABCListData.MaxSelection = i
	REDIM ListName(1 TO ABCListData.MaxSelection) AS STRING * 12, FileSnippets(0 TO ABCListData.MaxSelection) AS LONG

CALL DTASet(DTA)
FindStatus = FindFirst(0, FileSpec$, DirEntry)
Temp$ = LTRIM$(RTRIM$(DirEntry.Filename))
ListName(1) = Temp$

IndexFile$ = LEFT$(Temp$, INSTR(Temp$, ".") - 1) + ".IDX"
OPEN IndexFile$ FOR BINARY AS #2

FileSnippets(1) = LOF(2) / 78
CLOSE

FOR i = 2 TO ABCListData.MaxSelection
	CALL DTASet(DTA)'BASIC keeps moving the buffer around and around
	FindStatus = FindNext(DirEntry)
	Temp$ = LTRIM$(RTRIM$(DirEntry.Filename))
	ListName(i) = Temp$
IndexFile$ = LEFT$(Temp$, INSTR(Temp$, ".") - 1) + ".IDX"
OPEN IndexFile$ FOR BINARY AS #2

FileSnippets(i) = INT(LOF(2) / 78)
CLOSE
   
NEXT
FOR i = 1 TO ABCListData.MaxSelection
   FileSnippets(0) = FileSnippets(0) + FileSnippets(i)
NEXT i

IF ABCListData.MaxSelection > 1 THEN
  Increment = (ABCListData.MaxSelection + 1)
  l2 = 0

  DO
	Increment = Increment \ 2
	i2 = Increment + l2
	FOR i = 1 TO ABCListData.MaxSelection - Increment
	 IF ListName(i) > ListName(i + Increment) THEN
	  SWAP ListName(i), ListName(i + Increment)
	  SWAP FileSnippets(i), FileSnippets(i + Increment)
	  IF i > i2 THEN
		 cutpoint = i
		 stopnow = 0
	  DO
	   i = i - Increment
		IF SGN(i + Increment) = 1 AND SGN(i) = 1 THEN
		   IF ListName(i) > ListName(i + Increment) THEN
		SWAP ListName(i), ListName(i + Increment)
		SWAP FileSnippets(i), FileSnippets(i + Increment)
	   ELSE
		stopnow = -1
		i = cutpoint
	   END IF
	 ELSE
	   stopnow = -1
	   i = cutpoint
	 END IF
	LOOP UNTIL stopnow
  END IF
	 END IF
	NEXT i
  LOOP UNTIL Increment <= 1
  Increment = (ABCListData.MaxSelection + 1)
  l2 = 0

  DO
	Increment = Increment \ 2
	i2 = Increment + l2
	FOR i = 1 TO ABCListData.MaxSelection - Increment
	 IF ListName(i) > ListName(i + Increment) THEN
  SWAP ListName(i), ListName(i + Increment)
  SWAP FileSnippets(i), FileSnippets(i + Increment)
  IF i > i2 THEN
	cutpoint = i
	stopnow = 0
	DO
	 i = i - Increment
	 IF SGN(i + Increment) = 1 AND SGN(i) = 1 THEN
	   IF ListName(i) > ListName(i + Increment) THEN
		SWAP ListName(i), ListName(i + Increment)
		SWAP FileSnippets(i), FileSnippets(i + Increment)
	   ELSE
		stopnow = -1
		i = cutpoint
	   END IF
	 ELSE
	   stopnow = -1
	   i = cutpoint
	 END IF
	LOOP UNTIL stopnow
  END IF
	 END IF
	NEXT i
  LOOP UNTIL Increment <= 1
END IF
   
	DEF SEG = &H40
	Equip = PEEK(&H10)
	Try = (Equip AND 48)
	IF Try = 48 THEN
		ABCListData.Fore = 0
		ABCListData.Back = 7
	ELSE
		ABCListData.Fore = TextColor
		ABCListData.Back = BodyBackGround
	END IF
	ABCListData.TopSelection = 1
	ABCListData.CurrSelection = 1
	IF UBOUND(ListName) < Height - 10 THEN
	   ABCListData.YSize = UBOUND(ListName)
	ELSE
	   ABCListData.YSize = Height - 10
	END IF
	ABCListData.Y = 6
	ABCListData.X = 4


END SUB

SUB Confirm (Answer)

PCOPY 0, 2
DrawBox 22, 10, 58, 12, 14, 4, 1, 1
Shadow 10, 22, 12, 58, 8, 1

LOCATE 11, 24: COLOR 15: PRINT "Really delete this code [y/N]? ";
LOCATE , , 1
A$ = INPUT$(1)
LOCATE , , 0
PRINT A$
IF UCASE$(A$) = "Y" THEN Answer = 1 ELSE Answer = 0
PCOPY 2, 0

END SUB

SUB DisplayReader
 
  DrawBox 1, 1, 80, 5, HeaderOutLine, HeaderBackGround, 1, HeaderOutLineChar
  COLOR HeaderIndent
  FOR X = 2 TO 5
	LOCATE X, 80: PRINT CHR$(179);
  NEXT X
  FOR X = 2 TO 79
	LOCATE 5, X: PRINT CHR$(196);
  NEXT X
  LOCATE 5, 80: PRINT CHR$(217); : LOCATE 1, 80: PRINT CHR$(191)
  COLOR Header
  LOCATE 2, 4: PRINT "  From: "; : COLOR HeaderInfo: PRINT From: COLOR Header
  LOCATE 3, 3: PRINT "Subject: "; : COLOR HeaderInfo: PRINT Subject: COLOR Header
  LOCATE 4, 3: PRINT " Search: "; : COLOR HeaderInfo: PRINT SearchStrings: COLOR Header
  LOCATE 2, 45: PRINT " Date: "; : COLOR HeaderInfo: PRINT DateOf: COLOR Header
  LOCATE 3, 45: PRINT " Code: "; : COLOR HeaderInfo: PRINT CodeOf: COLOR Header
  LOCATE 4, 45: PRINT "Lines: "; : COLOR HeaderInfo: PRINT NumLines; " ("; : PRINT USING "###,###"; VAL(NumBytes); : PRINT " bytes)"
  LOCATE Height, 1: COLOR StatusColor, StatusBColor: PRINT SPACE$(80);
  LOCATE Height, 2: COLOR StatusColor, StatusBColor: PRINT "ABC Reader Programmed by Robert Claypool 1997";
  ' 16 = Blue  70 = Red  40 = Green  50 = Cyan  120 = Grey  80 = Purple
  '100 = Brown
  IF BodyBackGround = 0 THEN DAC = 0
  IF BodyBackGround = 1 THEN DAC = 16
  IF BodyBackGround = 2 THEN DAC = 40
  IF BodyBackGround = 3 THEN DAC = 50
  IF BodyBackGround = 4 THEN DAC = 70
  IF BodyBackGround = 5 THEN DAC = 80
  IF BodyBackGround = 6 THEN DAC = 100
  IF BodyBackGround = 7 THEN DAC = 120
  DrawBox 1, 6, 80, Height - 1, BodyOutLine, BodyBackGround, 1, OutLineChar
  COLOR BodyIndent
  FOR X = 6 TO Height - 1
	LOCATE X, 80
	IF OutLineChar = 2 THEN PRINT CHR$(186);  ELSE PRINT CHR$(179);
  NEXT X
  FOR X = 2 TO 79
	LOCATE Height - 1, X
	IF OutLineChar = 2 THEN PRINT CHR$(205);  ELSE PRINT CHR$(196);
  NEXT X
  LOCATE Height - 1, 80
  IF OutLineChar = 1 THEN
	PRINT CHR$(217); : LOCATE 6, 80: PRINT CHR$(191)
  ELSE
	PRINT CHR$(188); : LOCATE 6, 80: PRINT CHR$(187)
  END IF
END SUB

SUB FastSorti (inarray() AS STRING, Lower, Upper)

  Increment = (Upper + Lower)
  l2 = Lower - 1

  DO
	Increment = Increment \ 2
	i2 = Increment + l2
	FOR i = Lower TO Upper - Increment
	 IF LCASE$(inarray(i)) > LCASE$(inarray(i + Increment)) THEN
  SWAP inarray(i), inarray(i + Increment)
  IF i > i2 THEN
	cutpoint = i
	stopnow = 0
	DO
	 i = i - Increment
	 IF SGN(i + Increment) = 1 AND SGN(i) = 1 THEN
	   IF LCASE$(inarray(i)) > LCASE$(inarray(i + Increment)) THEN
		SWAP inarray(i), inarray(i + Increment)
	   ELSE
		stopnow = -1
		i = cutpoint
	   END IF
	 ELSE
	   stopnow = -1
	   i = cutpoint
	 END IF
	LOOP UNTIL stopnow
  END IF
	 END IF
	NEXT i
  LOOP UNTIL Increment <= 1

END SUB

SUB FillScreen

LOCATE 1, 1: COLOR 14, 1: PRINT "  ABC READER "; : COLOR 10, 1
PRINT "Programmed by Robert Claypool 1997               "; : COLOR 15: PRINT "ESC "; : COLOR 0: PRINT "= Quit ABC    "
COLOR 7, 0
FOR X = 2 TO Height - 1
  LOCATE X, 1: PRINT STRING$(80, CHR$(178));
NEXT X
LOCATE Height, 1
COLOR StatusHighlight, StatusBColor: PRINT "   /PGUP/PGDN/HOME/END ";
COLOR StatusColor: PRINT "Navigate  ";
COLOR StatusHighlight: PRINT "ENTER "; : COLOR StatusColor: PRINT "Select  ";
COLOR StatusHighlight: PRINT "F1 "; : COLOR StatusColor: PRINT "Help  ";
COLOR StatusHighlight: PRINT "F2 "; : COLOR StatusColor: PRINT "Search  ";
COLOR StatusHighlight: PRINT "F3 "; : COLOR StatusColor: PRINT "Setup   ";

END SUB

SUB FilterTab (LText$)

  Tb = INSTR(LText$, CHR$(9))
	DO WHILE Tb
	 LText$ = LEFT$(LText$, Tb - 1) + SPACE$(4) + MID$(LText$, Tb + 1)
	 Tb = INSTR(LText$, CHR$(9))
	LOOP

END SUB

FUNCTION FmtDate$ (FDate)
	   Day = FDate AND &H1F
	   Month = (FDate AND &H1E0) \ 32
	   Year = (FDate AND &HFE00) \ 512 + 1980
	   FmtDate$ = RStr$(Month, 2) + "-" + RStr$(Day, 2) + "-" + RStr$(Year, 4)
END FUNCTION

FUNCTION FmtTime$ (t%)
	   Seconds = (t% AND &H1F) * 2
	   Minutes = (t% AND &H7E0) \ 32

	   Hours = (t% < 0) * (-16) + ((t% AND &H7FFF) \ 2048)
	   Abbr$ = " am"
	   IF Hours = 12 THEN Abbr$ = " pm"
	   IF Hours = 0 THEN Hours = 12

	   IF Hours > 12 THEN
			 Hours = Hours MOD 12
			 Abbr$ = " pm"
	   END IF
	   FmtTime$ = RStr$(Hours, 2) + ":" + RStr$(Minutes, 2) + ":" + RStr$(Seconds, 2)
END FUNCTION

SUB LoadABCode (Filename$)

DIM di AS STRING * 10
DIM Index2 AS STRING * 78
BeginHere:
REDIM P&(1000)

DrawBox 1, 1, 80, Height - 1, 8, 7, 1, 1
COLOR 15
FOR X = 2 TO Height - 2
  LOCATE X, 80: PRINT CHR$(179);
NEXT X
FOR X = 2 TO 79
  LOCATE Height - 1, X: PRINT CHR$(196);
NEXT X
LOCATE Height - 1, 80: PRINT CHR$(217); : LOCATE 1, 80: PRINT CHR$(191)

IndexFile$ = LEFT$(Filename$, INSTR(Filename$, ".") - 1) + ".IDX"

OPEN IndexFile$ FOR BINARY AS #2
  A = LOF(2)
  NumABC = A / 78
  IF NumABC > 1000 THEN NumABC = 1000
  FOR X = 1 TO NumABC
	P&(X) = (78 * (X - 1)) + 1
  NEXT X
  X = 0
  Row = 2
  COLOR 0
  DO
	X = X + 1
	GOSUB ShowRow
	Row = Row + 1
  LOOP UNTIL X = NumABC OR Row = Height - 1

Row = 2: X = 1
GET #2, P&(X), Index
COLOR 15, 1
GOSUB ShowRow

DO
  V$ = INKEY$
  IF V$ = CHR$(27) THEN GOTO ExitLoadABCode
  IF V$ = CHR$(13) THEN GOSUB GetPosition
  IF V$ = CHR$(0) + "=" THEN SETUP
 
  IF V$ = CHR$(0) + "P" THEN D = 1: GOSUB NextRow
  IF V$ = CHR$(0) + "H" THEN D = 2: GOSUB NextRow
  IF V$ = CHR$(0) + "Q" THEN GOSUB PgDn
  IF V$ = CHR$(0) + "I" THEN GOSUB PgUp
  IF V$ = CHR$(0) + "O" THEN Row = Height - 2: X = NumABC: GOSUB PgDn
  IF V$ = CHR$(0) + "G" THEN Row = 2: X = 1: GOSUB PgUp
  IF V$ = CHR$(0) + CHR$(83) THEN GOSUB DeleteCode: IF Answer = 1 THEN GOTO BeginHere
LOOP

NextRow:
  IF X = 1 AND D = 2 THEN RETURN
  IF X = NumABC AND D = 1 THEN RETURN
  COLOR 0, 7
  GOSUB ShowRow
  IF D = 1 THEN Row = Row + 1: X = X + 1
  IF D = 2 THEN Row = Row - 1: X = X - 1
  IF Row = Height - 1 THEN
	Scroll 1, 1, Height - 3, 78, 1, 120, 6
	Row = Height - 2
  END IF
  IF Row = 1 THEN
	Scroll 1, 1, Height - 3, 78, 1, 120, 7
	Row = 2
  END IF
  COLOR 15, 1
  GOSUB ShowRow
RETURN

ShowRow:
  GET #2, P&(X), Index
  LOCATE Row, 3: PRINT USING "###"; X
  COLOR , 7
  LOCATE Row, 7: PRINT LEFT$(Index, 1)
  LOCATE Row, 9: PRINT MID$(Index, 17, 31)
  LOCATE Row, 42: PRINT MID$(Index, 48, 31)
  LOCATE Row, 73: PRINT MID$(Index, 12, 5)
RETURN

PgDn:
  IF NumABC <= Height - 3 THEN Row = 1 + NumABC
  COLOR 0, 7
  X = X + (Height - 3): Bak = Row
  IF X > NumABC - (Height - 3) THEN X = NumABC - (Height - 3)
  IF X < 0 THEN X = 0
  FOR Y = 1 TO Height - 3
	X = X + 1
	IF X > NumABC THEN EXIT FOR
	Row = Y + 1
	GOSUB ShowRow
  NEXT Y
  Row = Bak
  X = X - (Height - (Height - 21)) + (Row - 2)
  IF NumABC < Height - 2 THEN X = NumABC
  IF X < 0 THEN X = NumABC
  COLOR 15, 1
  GOSUB ShowRow
RETURN

PgUp:
  COLOR 0, 7
  X = X - (Height + (Height - 21)): Bak = Row
  IF X < 0 THEN X = 0
  FOR Y = 1 TO Height - 3
	X = X + 1
	IF X > NumABC THEN EXIT FOR
	Row = Y + 1
	GOSUB ShowRow
  NEXT Y
  Row = Bak
  X = X - (Height - 4) + (Row - 2)
  IF X < Height - 2 THEN X = 1: Row = 2
  COLOR 15, 1
  GOSUB ShowRow
RETURN

DeleteCode:
  Confirm Answer
  IF Answer = 0 THEN RETURN
  IF NumABC = 1 THEN CLOSE 2: KILL Filename$: KILL IndexFile$: GOTO ExitLoadABCode
  Position& = VAL(MID$(Index, 2, 10))
  IF X <> NumABC THEN GET #2, P&(X + 1), Index: NextPosition& = VAL(MID$(Index, 2, 10))
	OPEN "IDX.TMP" FOR BINARY AS #3
	 Deleted = 0
	 FOR Y = 1 TO NumABC
	   GET #2, P&(Y), Index
	   IndexPrn$ = Index
	   IF Y = X THEN
		di = MID$(Index, 2, 10)
		Deleted = 1
	   ELSE
		IF Deleted = 1 THEN
		  IF Y <> NumABC THEN
			GET #2, P&(Y + 1), Index2
			IndexPrn$ = " " + di + RIGHT$(Index, 67)
			di = LTRIM$(STR$((VAL(MID$(Index2, 2, 10)) - VAL(MID$(Index, 2, 10))) + VAL(di)))
		  ELSE
			IndexPrn$ = " " + di + RIGHT$(Index, 67)
		  END IF
		END IF
		PUT #3, , IndexPrn$
	   END IF
	 NEXT Y
  CLOSE 3
  PCOPY 0, 2
  OPEN "ABC.TMP" FOR BINARY AS #3
	OPEN Filename$ FOR BINARY AS #4
	A& = LOF(4)
	IF X = NumABC THEN NextPosition& = A&
	TotalBytes& = -4095
	Position& = Position& - 4096
	ThatsAll = 0
	DO
	 TotalBytes& = TotalBytes& + 4096
	 IF TotalBytes& >= Position& THEN
	  IF X <> 1 THEN
	   Block& = 4096 - (TotalBytes& - Position&)
	   Block$ = SPACE$(Block&)
	   GET #4, , Block$
	   PUT #3, , Block$
	  END IF
	   TotalBytes& = NextPosition& - 4096
	   Position& = A& + A&
	   IF X = NumABC THEN ThatsAll = 1
	 ELSE
	   LOCATE 1, 2: COLOR 15, 7: PRINT TotalBytes&; "of "; A&
	   IF TotalBytes& >= (A& - 4096) THEN
		Block& = A& - TotalBytes& + 1
		TotalBytes& = A& - Block& + 1
		ThatsAll = 1
	   ELSE
		Block& = 4096
	   END IF
	   Block$ = SPACE$(Block&)
	   GET #4, TotalBytes&, Block$
	   PUT #3, , Block$
	 END IF
	LOOP UNTIL ThatsAll
  CLOSE 2, 3, 4
  PCOPY 2, 0
  KILL Filename$
  KILL IndexFile$
  IF Rename("ABC.TMP", Filename$) THEN CLS : PRINT "Error renaming.": END
  IF Rename("IDX.TMP", IndexFile$) THEN CLS : PRINT "Error renaming.": END
  ERASE P&
RETURN

GetPosition:
  PCOPY 0, 3
  Position& = VAL(MID$(Index, 2, 10))
  ReadABC Filename$, Position&
  PCOPY 3, 0
RETURN

ExitLoadABCode:
  COLOR , 0
  ERASE P&
  CLOSE #2
END SUB

SUB PrintDirEntry (DR AS DirectoryRecord, FindStatus)
	   FmtStr$ = "\          \  ##,###,###  " + "\        \ \           \ ###"
	   IF FindStatus = 0 THEN
			 PRINT USING FmtStr$; DR.Filename; DR.FileSize; FmtDate$(DR.Filedate); FmtTime(DR.FileTime)
	   ELSE
			 PRINT "Error on file lookup"
			 SELECT CASE FindStatus
					CASE 2
					 PRINT "File not found"
					CASE 3
					 PRINT "Path not found"
					CASE 18
					 PRINT "Match not found"
					CASE ELSE
					 PRINT "Unknown error #"; FindStatus
			 END SELECT
	   END IF
END SUB

SUB PrintText (LText$, X)

DIM ShowText AS STRING * 78
COLOR TextColor, BodyBackGround
ShowText = MID$(LText$, X, 78)
PRINT ShowText

END SUB

SUB ReadABC (ABCFileName$, Position&)

REDIM Pointers&(15000)

OPEN ABCFileName$ FOR BINARY AS #1
  GET #1, Position&, From
  GET #1, , Subject
  GET #1, , SearchStrings
  GET #1, , DateOf
  GET #1, , CodeOf
  GET #1, , NumLines
  GET #1, , NumBytes
  GET #1, , SaveFile

  DisplayReader
  
  TotalBytes& = VAL(NumBytes) - VAL(NumLines)
  BytePos& = 165 + Position&
  InitialPos& = 165 + Position&
  Pointers&(1) = BytePos&
  i = 2
  PCOPY 0, 1
  DrawBox 3, 11, 77, 14, 15, 3, 1, 1
  Shadow 11, 3, 14, 77, 8, 1
  COLOR 15: LOCATE 11, 8: PRINT "Lines Parsed: "
  COLOR 0
  LOCATE 12, 4: PRINT "0%"
  LOCATE 12, 6: PRINT STRING$(33, CHR$(250))
  LOCATE 12, 73: PRINT "100%"
  LOCATE 12, 42: PRINT STRING$(31, CHR$(250))
  LOCATE 12, 39: PRINT "50%"
  COLOR 7, 8: LOCATE 13, 4: PRINT STRING$(73, "²")
  COLOR 14, 3
  Blocks = INT(VAL(NumLines) / 73)
  InitBlock = Blocks: B = 4

  DO
   GET #1, BytePos&, Text
   DO
	Sift = INSTR(1, Text, CHR$(227))
	IF Sift <> 0 THEN
	Text = MID$(Text, Sift + 1, LEN(Text) - Sift)
	BytePos& = BytePos& + Sift
	Pointers&(i) = BytePos&
	i = i + 1
	IF i >= Blocks THEN
	  Blocks = Blocks + InitBlock
	  LOCATE 13, B: COLOR 12: PRINT CHR$(219)
	  B = B + 1
	  IF B = 77 THEN B = 76
	END IF
	END IF
   LOOP UNTIL Sift = 0
   LOCATE 11, 22: COLOR 14: PRINT USING "#####"; i - 2
   InitialPos& = InitialPos& + 2048
   BytePos& = InitialPos&
  LOOP UNTIL i > VAL(NumLines)
  LOCATE 13, 4: COLOR 12: PRINT STRING$(73, CHR$(219))
  PCOPY 1, 0

i = 0: X = 1
DO
  i = i + 1
  LText$ = SPACE$(Pointers&(i + 1) - Pointers&(i) - 1)
  GET #1, Pointers&(i), LText$
  FilterTab LText$
  LOCATE i + 6, 2
  PrintText LText$, 1
LOOP UNTIL i = VAL(NumLines) OR i = Height - 8
LOCATE Height, 2: COLOR StatusColor, StatusBColor: PRINT "E("; : COLOR StatusHighlight
PRINT "X"; : COLOR StatusColor: PRINT ")tract Code   ("; : COLOR StatusHighlight
PRINT "F1"; : COLOR StatusColor: PRINT ") Help   ("; : COLOR StatusHighlight
PRINT "ESC"; : COLOR StatusColor: PRINT ") Exit    [ Memory: "; FRE(-1); "]";
LOCATE Height, 70: COLOR StatusColor, StatusBColor: PRINT USING "#####"; i; : PRINT ":"; : PRINT USING "###"; X;

DO
  DO
	V$ = INKEY$
  LOOP UNTIL V$ <> ""
  IF V$ = CHR$(27) THEN GOTO EXITREAD
  IF V$ = CHR$(0) + "P" THEN D = 1: GOSUB ShowTxt
  IF V$ = CHR$(0) + "H" THEN D = 2: GOSUB ShowTxt
  IF V$ = CHR$(0) + "Q" THEN GOSUB PgDnShowTxt
  IF V$ = CHR$(0) + "I" THEN GOSUB PgUpShowTxt
  IF V$ = CHR$(0) + "O" THEN i = VAL(NumLines): X = 1: GOSUB PgDnShowTxt
  IF V$ = CHR$(0) + "G" THEN i = 0: X = 1: GOSUB PgUpShowTxt
  IF V$ = CHR$(0) + "M" THEN M = 1: GOSUB MoveTxt
  IF V$ = CHR$(0) + "K" THEN M = 2: GOSUB MoveTxt
  IF UCASE$(V$) = "X" THEN GOSUB ExtractFile
LOOP

ShowTxt:
  IF D = 2 AND i <= (Height - 8) THEN RETURN
  IF D = 1 AND i >= VAL(NumLines) THEN RETURN
  IF D = 1 THEN Scroll 6, 1, Height - 3, 78, 1, DAC, 6 ELSE Scroll 6, 1, Height - 3, 78, 1, DAC, 7
  IF D = 1 THEN i = i + 1 ELSE i = i - (Height - 8)
  LText$ = SPACE$(Pointers&(i + 1) - Pointers&(i) - 1)
  GET #1, Pointers&(i), LText$
  FilterTab LText$
  IF D = 1 THEN LOCATE Height - 2, 2 ELSE LOCATE 7, 2
  PrintText LText$, X
  IF D = 2 THEN i = i + (Height - 9)
  LOCATE Height, 70: COLOR StatusColor, StatusBColor: PRINT USING "#####"; i; : PRINT ":"; : PRINT USING "###"; X;
RETURN

MoveTxt:
  IF M = 2 AND X = 1 THEN RETURN
  IF M = 1 AND X = 255 THEN RETURN
  IF M = 1 THEN X = X + 1 ELSE X = X - 1
  i = i - (Height - 8)
  IF i < 0 THEN i = 0
  H = 6
DO
  i = i + 1
  H = H + 1
  LText$ = SPACE$(Pointers&(i + 1) - Pointers&(i) - 1)
  GET #1, Pointers&(i), LText$
  FilterTab LText$
  LOCATE H, 2
  PrintText LText$, X
LOOP UNTIL i >= VAL(NumLines) OR H = Height - 2
LOCATE Height, 70: COLOR StatusColor, StatusBColor: PRINT USING "#####"; i; : PRINT ":"; : PRINT USING "###"; X;
RETURN

PgDnShowTxt:
  H = 6
  IF VAL(NumLines) < Height - 7 THEN RETURN
  IF i >= VAL(NumLines) - (Height - 8) THEN i = VAL(NumLines) - (Height - 8)
DO
  i = i + 1
  H = H + 1
  LText$ = SPACE$(Pointers&(i + 1) - Pointers&(i) - 1)
  GET #1, Pointers&(i), LText$
  FilterTab LText$
  LOCATE H, 2
  PrintText LText$, X
LOOP UNTIL i >= VAL(NumLines) OR H = Height - 2
IF H < (Height - 2) THEN
  FOR E = H TO Height - 2
   LOCATE E, 2: PRINT SPACE$(78)
  NEXT E
END IF
LOCATE Height, 70: COLOR StatusColor, StatusBColor: PRINT USING "#####"; i; : PRINT ":"; : PRINT USING "###"; X;
RETURN

PgUpShowTxt:
  H = 6
  i = i - (Height + (Height - 16))
  IF i < 0 THEN i = 0
DO
  i = i + 1
  H = H + 1
  LText$ = SPACE$(Pointers&(i + 1) - Pointers&(i) - 1)
  GET #1, Pointers&(i), LText$
  FilterTab LText$
  LOCATE H, 2
  PrintText LText$, X
LOOP UNTIL i >= VAL(NumLines) OR H = Height - 2
LOCATE Height, 70: COLOR StatusColor, StatusBColor: PRINT USING "#####"; i; : PRINT ":"; : PRINT USING "###"; X;
RETURN

ExtractFile:
  PCOPY 0, 1
  DrawBox 3, 15, 77, 17, 15, 3, 1, 1
  Shadow 15, 3, 17, 77, 8, 1
  LOCATE 16, 5: COLOR 14, 3: PRINT "Save As:"
  COLOR 15, 1
  LOCATE 16, 15
  Original$ = DefaultSave$ + SaveFile
  What$ = TinyInput$(RTRIM$(LTRIM$(Original$)), 60, 0, "")
  PCOPY 1, 0
  IF What$ <> "" THEN
  A$ = ""
  IF Exist(What$, 0) THEN
	DrawBox 22, 10, 58, 13, 14, 4, 1, 1
	Shadow 10, 22, 13, 58, 8, 1
	COLOR 15, 4: LOCATE 11, 25: PRINT "WARNING:  File Already Exists!"
	LOCATE 12, 25: PRINT "Overwrite ["; : COLOR 14: PRINT "y"; : COLOR 15
	PRINT "/"; : COLOR 14: PRINT "N"; : COLOR 15: PRINT "/"; : COLOR 14: PRINT "a"; : COLOR 15: PRINT "ppend]? ";
	LOCATE , , 1
	A$ = UCASE$(INPUT$(1))
	PRINT A$
	IF A$ <> "Y" AND A$ <> "A" THEN PCOPY 1, 0: RETURN
	LOCATE , , 0
	PCOPY 1, 0
  END IF
  PCOPY 0, 1
  IF A$ = "A" THEN OPEN LTRIM$(What$) FOR APPEND AS #3 ELSE OPEN LTRIM$(What$) FOR OUTPUT AS #3
	DrawBox 20, 12, 60, 14, 15, 3, 1, 1
	Shadow 12, 20, 14, 60, 8, 1
	LOCATE 13, 22: COLOR 14, 3: PRINT "Saving to "; : COLOR 15: PRINT LEFT$(What$, 14)
	COLOR 14
	FOR E = 1 TO VAL(NumLines)
	 IF INKEY$ = CHR$(27) THEN EXIT FOR
	 LOCATE 13, 47: PRINT USING "###.##"; (E / VAL(NumLines)) * 100; : PRINT "% Done"
	 LText$ = SPACE$(Pointers&(E + 1) - Pointers&(E) - 1)
	 GET #1, Pointers&(E), LText$
	 PRINT #3, LText$
	NEXT E
	PCOPY 1, 0
  CLOSE #3
  END IF
RETURN

EXITREAD:
  ERASE Pointers&
  CLOSE #1

END SUB

SUB ReadInSetup
 
  OPEN "NEWREAD\ABCREAD.CFG" FOR INPUT AS #1
  LINE INPUT #1, DefaultSave$
  INPUT #1, Height
  INPUT #1, HeaderOutLine
  INPUT #1, HeaderBackGround
  INPUT #1, HeaderOutLineChar
  INPUT #1, HeaderInfo
  INPUT #1, Header
  INPUT #1, CommentColor
  INPUT #1, TextColor
  INPUT #1, HeaderIndent
  INPUT #1, StatusColor
  INPUT #1, StatusBColor
  INPUT #1, StatusHighlight
  INPUT #1, BodyOutLine
  INPUT #1, BodyBackGround
  INPUT #1, OutLineChar
  INPUT #1, BodyIndent
  CLOSE #1

END SUB

 ' ------------------------ ReName% -----------------------------
 '|  Renames file(s) using DOS Interrupt calls.  Works across    |
 '|  subdirectories if necessary.  Returns 0 if successful, DOS  |
 '|  error code if it fails.                                     |
 ' --------------------------------------------------------------
 FUNCTION Rename% (OldName$, NewName$)

 DIM InRegX AS RegTypeX
 DIM OutRegX AS RegTypeX
 DIM DOSParmList AS DosPListT
 DIM FileNameBuf AS STRING * 128

 Null$ = CHR$(0)

 FileNameBuf = OldName$ + Null$     '| Canonicalize OldName$
 InRegX.ax = &H6000
 InRegX.ds = VARSEG(FileNameBuf)
 InRegX.es = VARSEG(FileNameBuf)
 InRegX.si = VARPTR(FileNameBuf)
 InRegX.di = VARPTR(FileNameBuf)
 CALL INTERRUPTX(&H21, InRegX, OutRegX)
 IF (OutRegX.flags AND 1) THEN
	Rename% = OutRegX.ax
	PRINT "Error in Canonicalizing OldName$"
	EXIT FUNCTION
 ELSE
	TmpOldName$ = LEFT$(FileNameBuf, INSTR(FileNameBuf, Null$))
 END IF

 FileNameBuf = NewName$ + Null$     '| Canonicalize NewName$
 CALL INTERRUPTX(&H21, InRegX, OutRegX)
 IF (OutRegX.flags AND 1) THEN
	Rename% = OutRegX.ax
	PRINT "Error in Canonicalizing NewName$"
	EXIT FUNCTION
 ELSE
	TmpNewName$ = LEFT$(FileNameBuf, INSTR(FileNameBuf, Null$))
 END IF

 InRegX.ax = &H5100                 '| Get PSP Segment
 CALL INTERRUPTX(&H21, InRegX, OutRegX)

 PSPSeg% = OutRegX.bx

 DOSParmList.ax = &H5600            '| Build DOS Parameter List
 DOSParmList.cx = 0                 '|   Structure.
 DOSParmList.dx = SADD(TmpOldName$)
 DOSParmList.ds = VARSEG(TmpOldName$) '| Use VARSEG for QB45
 DOSParmList.di = SADD(TmpNewName$)
 DOSParmList.es = VARSEG(TmpNewName$) '| Use VARSEG for QB45
 DOSParmList.Rsrvd = 0
 DOSParmList.CompID = 0
 DOSParmList.ProcID = PSPSeg%

 InRegX.ax = &H5D00                 '| Do Rename, using Internal
 InRegX.ds = VARSEG(DOSParmList)    '|   Server Function Call to
 InRegX.dx = VARPTR(DOSParmList)    '|   support wildcards in
							 '|   filenames.
 CALL INTERRUPTX(&H21, InRegX, OutRegX)
 IF (OutRegX.flags AND 1) THEN
	Rename% = OutRegX.ax
	PRINT "Error in Renaming Files"
	EXIT FUNCTION
 END IF

 Rename% = 0

 END FUNCTION

FUNCTION RStr$ (X%, LX%)
	   X$ = STR$(X%)
	   RStr$ = RIGHT$("00000" + RIGHT$(X$, LEN(X$) - 1), LX%)
END FUNCTION

SUB SaveSetup
 
  OPEN "NEWREAD\ABCREAD.CFG" FOR OUTPUT AS #1
  PRINT #1, DefaultSave$
  PRINT #1, BackHeight
  PRINT #1, HeaderOutLine
  PRINT #1, HeaderBackGround
  PRINT #1, HeaderOutLineChar
  PRINT #1, HeaderInfo
  PRINT #1, Header
  PRINT #1, CommentColor
  PRINT #1, TextColor
  PRINT #1, HeaderIndent
  PRINT #1, StatusColor
  PRINT #1, StatusBColor
  PRINT #1, StatusHighlight
  PRINT #1, BodyOutLine
  PRINT #1, BodyBackGround
  PRINT #1, OutLineChar
  PRINT #1, BodyIndent
  CLOSE #1

END SUB

SUB SelectListDraw (Object AS SelectListData, OList() AS STRING)
END SUB

SUB SETUP

PCOPY 0, 2
DrawBox 23, 4, 70, 22, 15, 1, 1, 1
Shadow 4, 23, 22, 70, 8, 1
D = 1: GOSUB ShowSetupInfo

DO
  V$ = INKEY$
  IF V$ = CHR$(27) THEN GOTO EXITSETUP
  IF V$ = CHR$(13) THEN GOSUB ChangeInfo
  IF V$ = CHR$(0) + "P" THEN D = D + 1: GOSUB ShowSetupInfo
  IF V$ = CHR$(0) + "H" THEN D = D - 1: GOSUB ShowSetupInfo
LOOP

ShowSetupInfo:
  IF D = 0 THEN D = 17
  IF D = 18 THEN D = 1
  IF D = 1 THEN COLOR 15 ELSE COLOR 0
  LOCATE 5, 25: PRINT "Save Path:          "; : COLOR 15: PRINT DefaultSave$
  IF D = 2 THEN COLOR 15 ELSE COLOR 0
  LOCATE 6, 25: PRINT "Screen Height:     "; : COLOR 15: PRINT BackHeight
  IF D = 3 THEN COLOR 15 ELSE COLOR 0
  LOCATE 7, 25: PRINT "HeaderOutLine:     "; : COLOR 15: PRINT HeaderOutLine
  IF D = 4 THEN COLOR 15 ELSE COLOR 0
  LOCATE 8, 25: PRINT "HeaderBackGround:  "; : COLOR 15: PRINT HeaderBackGround
  IF D = 5 THEN COLOR 15 ELSE COLOR 0
  LOCATE 9, 25: PRINT "HeaderOutLineChar: "; : COLOR 15: PRINT HeaderOutLineChar
  IF D = 6 THEN COLOR 15 ELSE COLOR 0
  LOCATE 10, 25: PRINT "HeaderIndent:      "; : COLOR 15: PRINT HeaderIndent
  IF D = 7 THEN COLOR 15 ELSE COLOR 0
  LOCATE 11, 25: PRINT "HeaderInfo:        "; : COLOR 15: PRINT HeaderInfo
  IF D = 8 THEN COLOR 15 ELSE COLOR 0
  LOCATE 12, 25: PRINT "Header:            "; : COLOR 15: PRINT Header
  IF D = 9 THEN COLOR 15 ELSE COLOR 0
  LOCATE 13, 25: PRINT "CommentColor:      "; : COLOR 15: PRINT CommentColor
  IF D = 10 THEN COLOR 15 ELSE COLOR 0
  LOCATE 14, 25: PRINT "TextColor:         "; : COLOR 15: PRINT TextColor
  IF D = 11 THEN COLOR 15 ELSE COLOR 0
  LOCATE 15, 25: PRINT "BodyOutLine:       "; : COLOR 15: PRINT BodyOutLine
  IF D = 12 THEN COLOR 15 ELSE COLOR 0
  LOCATE 16, 25: PRINT "BodyBackGround:    "; : COLOR 15: PRINT BodyBackGround
  IF D = 13 THEN COLOR 15 ELSE COLOR 0
  LOCATE 17, 25: PRINT "OutLineChar:       "; : COLOR 15: PRINT OutLineChar
  IF D = 14 THEN COLOR 15 ELSE COLOR 0
  LOCATE 18, 25: PRINT "BodyIndent:        "; : COLOR 15: PRINT BodyIndent
  IF D = 15 THEN COLOR 15 ELSE COLOR 0
  LOCATE 19, 25: PRINT "StatusColor:       "; : COLOR 15: PRINT StatusColor
  IF D = 16 THEN COLOR 15 ELSE COLOR 0
  LOCATE 20, 25: PRINT "StatusBackGround:  "; : COLOR 15: PRINT StatusBColor
  IF D = 17 THEN COLOR 15 ELSE COLOR 0
  LOCATE 21, 25: PRINT "StatusHighLight:   "; : COLOR 15: PRINT StatusHighlight
RETURN

ChangeInfo:
  COLOR , 5
  IF D = 1 THEN LOCATE 5, 45: DefaultSave$ = TinyInput$(DefaultSave$, 24, 0, ""): LOCATE 5, 45: COLOR , 1: PRINT SPACE$(24)
  IF D = 2 THEN
	DO
	IF BackHeight = 25 THEN BackHeight = 43: EXIT DO
	IF BackHeight = 43 THEN BackHeight = 50: EXIT DO
	IF BackHeight = 50 THEN BackHeight = 25: EXIT DO
	LOOP
  END IF
  IF D = 3 THEN LOCATE 7, 45: A$ = TinyInput$(LTRIM$(STR$(HeaderOutLine)), 2, 0, "0123456789"): HeaderOutLine = VAL(A$): IF HeaderOutLine > 15 THEN HeaderOutLine = 15
  IF D = 4 THEN LOCATE 8, 45: A$ = TinyInput$(LTRIM$(STR$(HeaderBackGround)), 1, 0, "01234567"): HeaderBackGround = VAL(A$)
  IF D = 5 THEN LOCATE 9, 45: A$ = TinyInput$(LTRIM$(STR$(HeaderOutLineChar)), 1, 0, "12"): HeaderOutLineChar = VAL(A$)
  IF D = 6 THEN LOCATE 10, 45: A$ = TinyInput$(LTRIM$(STR$(HeaderIndent)), 2, 0, "0123456789"): HeaderIndent = VAL(A$): IF HeaderIndent > 15 THEN HeaderIndent = 15
  IF D = 7 THEN LOCATE 11, 45: A$ = TinyInput$(LTRIM$(STR$(HeaderInfo)), 2, 0, "0123456789"): HeaderInfo = VAL(A$): IF HeaderInfo > 15 THEN HeaderInfo = 15
  IF D = 8 THEN LOCATE 12, 45: A$ = TinyInput$(LTRIM$(STR$(Header)), 2, 0, "0123456789"): Header = VAL(A$): IF Header > 15 THEN Header = 15
  IF D = 9 THEN LOCATE 13, 45: A$ = TinyInput$(LTRIM$(STR$(CommentColor)), 2, 0, "0123456789"): CommentColor = VAL(A$): IF CommentColor > 15 THEN CommentColor = 15
  IF D = 10 THEN LOCATE 14, 45: A$ = TinyInput$(LTRIM$(STR$(TextColor)), 2, 0, "0123456789"): TextColor = VAL(A$): IF TextColor > 15 THEN TextColor = 15
  IF D = 11 THEN LOCATE 15, 45: A$ = TinyInput$(LTRIM$(STR$(BodyOutLine)), 2, 0, "0123456789"): BodyOutLine = VAL(A$): IF BodyOutLine > 15 THEN BodyOutLine = 15
  IF D = 12 THEN LOCATE 16, 45: A$ = TinyInput$(LTRIM$(STR$(BodyBackGround)), 1, 0, "01234567"): BodyBackGround = VAL(A$)
  IF D = 13 THEN LOCATE 17, 45: A$ = TinyInput$(LTRIM$(STR$(OutLineChar)), 1, 0, "12"): OutLineChar = VAL(A$)
  IF D = 14 THEN LOCATE 18, 45: A$ = TinyInput$(LTRIM$(STR$(BodyIndent)), 2, 0, "0123456789"): BodyIndent = VAL(A$): IF BodyIndent > 15 THEN BodyIndent = 15
  IF D = 15 THEN LOCATE 19, 45: A$ = TinyInput$(LTRIM$(STR$(StatusColor)), 2, 0, "0123456789"): StatusColor = VAL(A$): IF StatusColor > 15 THEN StatusColor = 15
  IF D = 16 THEN LOCATE 20, 45: A$ = TinyInput$(LTRIM$(STR$(StatusBColor)), 1, 0, "01234567"): StatusBColor = VAL(A$)
  IF D = 17 THEN LOCATE 21, 45: A$ = TinyInput$(LTRIM$(STR$(StatusHighlight)), 2, 0, "0123456789"): StatusHighlight = VAL(A$): IF StatusHighlight > 15 THEN StatusHighlight = 15
  COLOR 15, 4
  GOSUB ShowSetupInfo
RETURN

EXITSETUP:
DrawBox 25, 10, 55, 12, 14, 4, 1, 1
Shadow 10, 25, 12, 55, 8, 1

LOCATE 11, 27: COLOR 15: PRINT "SAVE or just USE [S/U]? ";

SetupRepeatGet:
A$ = INPUT$(1)
LOCATE , , 0
LOCATE 11, 51
PRINT A$
A$ = UCASE$(A$)
IF A$ = "S" THEN
   SaveSetup
ELSEIF A$ <> "U" THEN
  GOTO SetupRepeatGet
END IF
LOCATE , , 1
CALL FillScreen
END SUB

SUB Shadow (Uprow, Ltcol, Lorow, Rtcol, Attr, Focus)

DEF SEG = &H40
Equip = PEEK(&H10)
IF (Equip AND 48) = 48 THEN
  Attr = 0
END IF
	DEF SEG = VidSeg%
	FOR Row = Uprow + 1 TO Lorow + 1
	 IF Focus = 1 THEN
	   FOR Col = Rtcol + 1 TO Rtcol + 2
		  offset = (Row - 1) * 160 + (Col - 1) * 2 + 1
		  POKE offset, Attr
	   NEXT
	 ELSE
	   FOR Col = Ltcol - 2 TO Ltcol - 1
		  offset = (Row - 1) * 160 + (Col - 1) * 2 + 1
		  POKE offset, Attr
	   NEXT
	 END IF
	NEXT

	Row = Lorow + 1
	IF Focus = 1 THEN
	 FOR Col = Ltcol + 2 TO Rtcol + 2
	   offset = (Row - 1) * 160 + (Col - 1) * 2 + 1
	   POKE offset, Attr
	 NEXT
	ELSE
	 FOR Col = Ltcol - 2 TO Rtcol - 2
	   offset = (Row - 1) * 160 + (Col - 1) * 2 + 1
	   POKE offset, Attr
	 NEXT
	END IF
	DEF SEG

END SUB

SUB StartUp

IF NOT Exist("NEWREAD\ABCREAD.CFG", 0) THEN
  CLS : PRINT "File ABCREAD.CFG missing from directory!"
  PRINT "Please correct this error and try again."
  PRINT : PRINT "For more on troubleshooting, read the ABCREAD.DOC"
  SYSTEM
END IF

IF NOT Exist("*.ABC", 0) THEN
  CLS : PRINT "No .ABC files found."
  PRINT "You must download the snippet codes and unpack them."
  PRINT "File(s) to look for:  ABCmmyy.ZIP"
  PRINT "Where mm=month yy=year"
  PRINT : PRINT "For more on troubleshooting, read the ABCREAD.DOC"
  SYSTEM
END IF

	DEF SEG = &H40
	Equip = PEEK(&H10)
	Try = (Equip AND 48)
	IF Try = 48 THEN
	VidSeg% = &HB000
	ELSE
	VidSeg% = &HB800
	END IF

END SUB

FUNCTION TinyInput$ (Original$, Length, AutoCap, Allowed$)

Row = POS(0): CursorPos = CSRLIN

LOCATE CursorPos, Row, 1

PRINT Original$ + SPACE$(Length - LEN(Original$));
LOCATE , Row + LEN(Original$): Total$ = Original$

DO
DO

  Ky$ = INKEY$
LOOP UNTIL Ky$ <> ""
  IF AutoCap THEN Ky$ = UCASE$(Ky$)

  SELECT CASE ASC(Ky$)             'integer compares are faster than
							'string compares
	CASE 13                       '<Enter> time to go

	  TinyInput$ = Total$         'Function returns our string
	  LOCATE , , 0: EXIT DO       'off cursor; exit loop to exit function

	CASE 8                        'Backspace
	  IF LEN(Total$) THEN Total$ = LEFT$(Total$, LEN(Total$) - 1)
	  LOCATE , Row: PRINT Total$ + " ";
	  LOCATE , POS(0) - 1

	CASE 27                       'Escape (doesn't exit??)
	   Total$ = "":
	   LOCATE , CursorPos - 1
	   PRINT SPACE$(Length); : LOCATE , CursorPos - 1
	   EXIT FUNCTION
	CASE 1 TO 8, 11 TO 255       'all other keys (exc. tab & lf)
	   IF AutoCap THEN Ky$ = UCASE$(Ky$)
	   IF LEN(Allowed$) THEN
		 IF INSTR(Allowed$, Ky$) = 0 THEN Ky$ = ""
	   END IF
	   IF LEN(Ky$) AND LEN(Total$) < Length THEN
		  Total$ = Total$ + Ky$
		  PRINT Ky$;
	   END IF
	END SELECT
LOOP

END FUNCTION

