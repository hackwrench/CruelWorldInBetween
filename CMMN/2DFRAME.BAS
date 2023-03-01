DEFINT A-Z

'$INCLUDE: 'C:\HIQB\CMMN\LOCATE.INC'

DECLARE FUNCTION ObjectX.Total.Get% (Object AS ANY)
DECLARE SUB VidWindow.Coordinates.Get (CoordinateValues AS Location2D)

DECLARE SUB Location2D.Init (Object AS ANY, InitX%, InitY%)

SUB Location2D.Init (Object AS Location2D, InitX, InitY)
    Object.X = InitX
    Object.Y = InitY
END SUB

FUNCTION ObjectX.Total.Get (Object AS Object2D)
    ObjectX.Total.Get = Object.X2 - Object.X1 + 1
END FUNCTION

SUB TextString.Init (Object AS TextString, InitText AS STRING, InitX AS INTEGER, InitY AS INTEGER)
    CALL Location2D.Init(Object.OBJLocation, InitX, InitY)
    Object.Text = InitText
END SUB

SUB VidWindow.Coordinates.Get (CoordinateValues AS Location2D)
    CoordinateValues.X = POS(0)
    CoordinateValues.Y = CSRLIN
END SUB

