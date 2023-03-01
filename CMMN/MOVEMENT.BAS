'$DYNAMIC
DEFINT A-Z

'$INCLUDE: 'C:\HIQB\CMMN\LOCATE.INC'

DECLARE FUNCTION Trans3D22DX% (Object AS ANY)
DECLARE FUNCTION Trans3D22DY% (Object AS ANY)
DECLARE FUNCTION Scroll.Pos.Calc% (ListTotal%, ElevTotal%, List.Curr.Pos%)
DECLARE FUNCTION MapWorld3D21D% (WorldX%, WorldY%, WorldZ%, ScreenTotX%, XTilt%, YTilt%, ZTilt%)

DECLARE FUNCTION Map3DRot21D% (X%, Y%, Z%, XRot%, YRot%, ZRot%)
DECLARE FUNCTION Blocks.Count% (Min%, Max%)
DECLARE FUNCTION Distance% (Rate%, StartTime AS SINGLE)
DECLARE FUNCTION Mapx8% (n%)
DECLARE FUNCTION Mapx16% (n%)
DECLARE FUNCTION Center% (Diameter%, X1%, X2%)
DECLARE FUNCTION ListTextMaxLength% (TList() AS STRING)
DECLARE FUNCTION Rand% (Value%)

DECLARE FUNCTION Value.InRange% (X%, X1%, X2%)
DECLARE FUNCTION Value.Limit.Max% (Q%, Max%)
DECLARE FUNCTION Value.Limit.Min% (Q%, Min%)
DECLARE FUNCTION Map1D22DX% (Value1D%, TotalX%)
DECLARE FUNCTION Map1D22DY% (Value1D%, X%, TotalX%)
DECLARE FUNCTION Map1D22DCurrent% (Value1D%, Prev%, TotalPrev%, TotalCurrent%)

REM $STATIC
FUNCTION Center (Diameter, X1%, X2%)
    Center = X1 + CINT((Blocks.Count(X1, X2) - Diameter) / 2)
END FUNCTION

FUNCTION ListTextMaxLength (TList() AS STRING)
    FOR I = LBOUND(TList) TO UBOUND(TList)
        IF Temp < LEN(TList(I)) THEN
           Temp = LEN(TList(I))
        END IF
    NEXT I
    MaxLength = Temp
END FUNCTION

FUNCTION Rand (Value)
    Rand = INT(RND(1) * Value)
END FUNCTION

'Text.Backspace
'Purpose:
'  To properly handle instances where someone wants to backspace text
'  It is not to be called when Textplace would equal 1
'  The purpose of this is to leave what happens when Textplace=1 up to
'  the calling program
SUB Text.Backspace (Text$, TextPlace)
    Text$ = MID$(Text$, 1, TextPlace - 1) + MID$(Text$, TextPlace + 1)
       TextPlace = TextPlace - 1
END SUB

