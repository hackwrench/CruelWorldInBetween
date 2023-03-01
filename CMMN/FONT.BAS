'Note: This file requires routines in Quick Library included with Quick Basic
'$DYNAMIC
DEFINT A-Z

TYPE MemLoc
     segment AS INTEGER
     offset  AS INTEGER
END TYPE

TYPE IconType
     Graphic AS STRING * 2
     Fore AS INTEGER
     Back AS INTEGER
END TYPE 'IconType

TYPE RegTypeX
     AX    AS INTEGER
     BX    AS INTEGER
     cx    AS INTEGER
     dx    AS INTEGER
     BP    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     flags AS INTEGER
     ds    AS INTEGER
     ES    AS INTEGER
END TYPE

DECLARE SUB Font.Regular (Text$, X%, Y%, col%)
DECLARE SUB Font.System (Text$, X%, Y%, col%)
DECLARE SUB INTERRUPTX (intnum AS INTEGER, inreg AS RegTypeX, outreg AS RegTypeX)

DECLARE FUNCTION ZBIT% (Byte%, Position%)
DECLARE FUNCTION Center% (Diameter%, X1%, X2%)
DECLARE FUNCTION Video.Segment.ID% ()

COMMON SHARED /Fonts/ Scale%, Font$(), FontPointer AS MemLoc

SUB Font.Icon.Block (Object AS IconType, X1, Y1, X2, Y2)
    COLOR Object.Fore, Object.Back
    FOR Y = Y1 TO Y2
        LOCATE Y, X1
        PRINT STRING$(X2 - X1 + 1, Object.Graphic);
    NEXT Y
END SUB

SUB Font.Mem1 (Text$, X%, Y%, Fore%, Back%)
    ' Calculate video memory offset, where display will begin
    offset% = 160 * (Y% - 1) + 2 * (X% - 1)
    ' Calculate color byte for string
    ColorByte% = (Back% * 16) + Fore%
    ' Set data segment to screen memory
    DEF SEG = Video.Segment.ID
    ' Place the string into video memory, along with the color
    stPos% = 1
    FOR X% = 0 TO ((LEN(Text$) - 1) * 2) STEP 2
        POKE X% + offset%, ASC(MID$(st$, stPos%, 1))
        POKE X% + offset% + 1, ColorByte%
        stPos% = stPos% + 1
    NEXT X%
    ' Restore BASIC's default data segment
    DEF SEG
END SUB

SUB Font.Mem2 (Text$, X%, Y%, Fore%)
    ' Calculate video memory offset, where display will begin
    offset% = 160 * (Y% - 1) + 2 * (X% - 1)
    ' Calculate color byte for string
    ColorByte% = (PEEK((row% - 1) * 160 + (col% - 1) * 2 + 1) AND &HFF) + Fore%
    ' Set data segment to screen memory
    DEF SEG = Video.Segment.ID
    ' Place the string into video memory, along with the color
    stPos% = 1
    FOR X% = 0 TO ((LEN(Text$) - 1) * 2) STEP 2
        POKE X% + offset%, ASC(MID$(st$, stPos%, 1))
        POKE X% + offset% + 1, ColorByte%
        stPos% = stPos% + 1
    NEXT X%
    ' Restore BASIC's default data segment
    DEF SEG
END SUB

SUB Font.PutChar (Text$, X, Y, ForeColor)
    PSET (X, Y), ForeColor
    ForeColor$ = STR$(ForeColor)
    SIZ$ = STR$(Scale%)
    DRAW "C" + ForeColor$ + "S" + SIZ$
    DRAW Font$(ASC(Text$))
END SUB

SUB Font.Regular (Text$, X, Y, ForeColor)
    LOCATE Y, X, 0
    COLOR ForeColor
    PRINT Text$;
END SUB

SUB Font.Regular2 (Text$, X, Y, ForeColor, BackColor)
    LOCATE Y, X, 0
    COLOR ForeColor, BackColor
    PRINT Text$;
END SUB

SUB Font.System (Text$, X, Y, ForeColor)
    SHARED FontPointer AS MemLoc
    DEF SEG = FontPointer.segment
    XPlot = X
    FOR K = 1 TO LEN(RTRIM$(Text$))
        acode = ASC(MID$(Text$, K, 1))
        COFF = FontPointer.offset + 8 * acode
        FOR I = 0 TO 7
            TempDisp = CVI(CHR$(0) + CHR$(PEEK(COFF + I)))
            LINE (XPlot, I + Y)-(XPlot + 7, I + Y), ForeColor, , TempDisp
        NEXT I
        XPlot = XPlot + 8
    NEXT K
    DEF SEG

END SUB

SUB Font.System.Init
    SHARED FontPointer AS MemLoc
    DIM FData AS RegTypeX
    FData.AX = &H1130
    FData.BX = &H300
    CALL INTERRUPTX(&H10, FData, FData)
    FontPointer.segment = FData.ES
    FontPointer.offset = FData.BP
END SUB

'This function returns as a value the memory address where the video
'display memory begins.  There are two possible return values, one
'for monochrome and one for color.
FUNCTION Video.Segment.ID
    ' Set default segment to 0.
    DEF SEG = 0
    ' PEEK at video ID value created by BIOS
     adapter = PEEK(&H463)
    ' Set function equal to proper segment value.
    IF adapter = &HB4 THEN
       Video.Segment.ID = &HB000  ' Mono
    ELSE
       Video.Segment.ID = &HB800  ' Color
    END IF
END FUNCTION

