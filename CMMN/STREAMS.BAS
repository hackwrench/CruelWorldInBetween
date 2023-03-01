'$DYNAMIC
DEFINT A-Z

'$INCLUDE: 'C:\HIQB\CMMN\LOCATE.INC'
'$INCLUDE: 'C:\HIQB\CMMN\ITEMS.INC'

TYPE FileInfoType
     Reserved AS STRING * 21
     Attribute AS STRING * 1
     CreationTime AS INTEGER
     CreationDate AS INTEGER
     Size AS LONG
     Filename AS STRING * 13
END TYPE

TYPE RegTypeX
     AX    AS INTEGER
     BX    AS INTEGER
     cx    AS INTEGER
     dx    AS INTEGER
     BP    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     Flags AS INTEGER
     ds    AS INTEGER
     ES    AS INTEGER
END TYPE

TYPE MemLoc
     Segment AS INTEGER
     Offset  AS INTEGER
END TYPE

DECLARE FUNCTION Token.Get$ (Search$, NonToken$, Offset%)
DECLARE FUNCTION Token.Start% (Search$, NonToken$, Offset%)
DECLARE FUNCTION Token.End% (Search$, NonToken$, Offset%)

DECLARE FUNCTION Blocks.Count% (Min%, Max%)

DECLARE SUB Location2D.Init (Object AS ANY, InitX%, InitY%)
DECLARE FUNCTION String.List.Compare% (Text$, TextList$())

DECLARE FUNCTION Split$ (Text$)
DECLARE SUB Variable.Load (Object() AS ANY, File$)

REM $STATIC
FUNCTION Split$ (Text$)
    FOR I = 1 TO LEN(Text$)
        IF MID$(Text$, I, 1) = " " THEN
           Split = LEFT$(Text$, I - 1)
           Text$ = MID$(Text$, I)
           EXIT FUNCTION
        END IF
    NEXT I
    Split = Text$
    Text$ = ""
END FUNCTION

REM $DYNAMIC
SUB Stream.Text.List (TList() AS STRING, FileNumber)
    FOR I = LBOUND(TList) TO UBOUND(TList)
        INPUT #FileNumber, TList(I)
    NEXT I
END SUB

REM $STATIC
'String.List.Compare:
'  Compares a string to a list of strings
FUNCTION String.List.Compare (Text$, TextList$())
    FOR I = LBOUND(TextList$) TO UBOUND(TextList$)
        IF Text$ = TextList$(I) THEN
           String.List.Compare = I
           EXIT FOR
        END IF
    NEXT I
END FUNCTION 'String.List.Compare

' Token.End:
'  Searches Search$ to find the first character from among those in
'  NonToken$. Returns the index of that character. This function can
'  be used to find the end of a token.
' Input:
'  Search$ = string to search
'  NonToken$ = characters to search for
' Output:
'  Token.End = index to first match in Search$ or 0 if none match
FUNCTION Token.End (Search$, NonToken$, Offset%) STATIC
    ' Look for end of token (first character that is a delimiter).
    FOR I = Offset% + 1 TO LEN(Search$)
       IF INSTR(NonToken$, MID$(Search$, I, 1)) <> 0 THEN
          Token.End = I - 1
          EXIT FUNCTION
       END IF
    NEXT I
    Token.End = LEN(Search$)
END FUNCTION

' Token.Get$:
'  Extracts tokens from a string. A token is a word that is surrounded
'  by separators, such as spaces or commas. Tokens are extracted and
'  analyzed when parsing sentences or commands. To use the Token.Get$
'  function, pass  it the string to be parsed on the first call, then pass
'  a null string on subsequent calls until the function returns a null
'  to indicate that the entire string has been parsed.
' Input:
'  Search$ = string to search
'  NonToken$  = String of separators
' Output:
'  Token.Get$ = next token
FUNCTION Token.Get$ (Search$, NonToken$, Offset) STATIC
    Offset% = Token.Start(Search$, NonToken$, Offset)
    IF Offset = 0 THEN EXIT FUNCTION
    ' Find end of token
    Temp = Token.End(Search$, NonToken$, Offset)
    Token.Get = MID$(Search$, Offset%, Blocks.Count(Offset, Temp))
    Offset% = Temp
END FUNCTION

' Token.Start:
'  Searches Search$ to find the first character that is not one of
'  those in NonToken$. Returns the index of that character. This
'  function can be used to find the start of a token.
' Input:
'  Search$ = string to search
'  NonToken$ = characters to search for
' Output:
'  Token.Start = index to first nonmatch in Search$ or 0 if all match
FUNCTION Token.Start% (Search$, NonToken$, Offset%) STATIC
    ' Look for start of a token (character that isn't a delimiter).
    FOR I = Offset% + 1 TO LEN(Search$)
        IF INSTR(NonToken$, MID$(Search$, I, 1)) = 0 THEN
           Token.Start = I
           EXIT FUNCTION
        END IF
    NEXT I
END FUNCTION

SUB Variable.Load (Object() AS Dweller, File$)
    OPEN "B", 1, File$
    FOR I = LBOUND(Object) TO UBOUND(Object)
        GET 1, , Object(I)
    NEXT I
    CLOSE
END SUB

