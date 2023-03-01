FUNCTION EnumeratedList$ (Text$, Number&)
EnumeratedList$ = LTRIM$(STR$(Number&)) + ". " + Text$
END FUNCTION

FUNCTION EnumeratedList2$ (Text$, Number&, MaxEntries&)
   Allowance% = LEN(STR$(MaxEntries&)) - 1
   Spaces% = Allowance - LEN(STR$(Number&)) - 1
   Buffer$ = SPACE$(Spaces%)
   EnumeratedList2$ = Buffer$ + LTRIM$(STR$(Number&)) + ". " + Text$
END FUNCTION

FUNCTION NumberAlignRight1$ (Number&, SizeOfField%)
    Spaces% = SizeOfField% - LEN(STR$(Number&)) - 1
    Buffer$ = SPACE$(Spaces%)
    NumberAlignRight1$ = Buffer$ + LTRIM$(STR$(Number&))
END FUNCTION

FUNCTION NumberAlignRight2$ (Number&, MaxEntries&)
   Allowance% = LEN(STR$(MaxEntries&)) - 1
   NumberAlignRight2$ = NumberAlignRight1$(Number&, Allowance%)
END FUNCTION
