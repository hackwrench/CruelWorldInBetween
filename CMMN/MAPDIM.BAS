DEFINT A-Z

DECLARE FUNCTION Value.ShiftUp% (Current%, Min%, Max%)
DECLARE FUNCTION Map1D22DX% (Value1D%, TotalX%)
DECLARE FUNCTION Map1D22DY% (Value1D%, X%, TotalX%)
DECLARE FUNCTION MapWorld3D21D% (WorldX%, WorldY%, WorldZ%, ScreenTotX%, XTilt%, YTilt%, ZTilt%)
DECLARE FUNCTION Map3DRot21D% (X%, Y%, Z%, XRot%, YRot%, ZRot%)
DECLARE FUNCTION Map1D22DCurrent% (Value1D%, Prev%, TotalPrev%, TotalCurrent%)
DECLARE FUNCTION Trans3D22DX% (Object AS ANY)
DECLARE FUNCTION Trans3D22DY% (Object AS ANY)

'$INCLUDE: 'C:\CODE\COMMON\LOCATE.INC'

FUNCTION Map1D22DCurrent (Value1D, Prev, TotalPrev, TotalCurrent)
    Map1D22DCurrent = (Value1D - Prev) / TotalPrev MOD TotalCurrent
END FUNCTION

FUNCTION Map1D22DX (Value1D, TotalX)
    Map1D22DX = Value1D MOD TotalX
END FUNCTION

FUNCTION Map1D22DY (Value1D, X, TotalX)
    Map1D22DY = (Value1D - X) / TotalX
END FUNCTION

FUNCTION Map3DRot21D (X, Y, Z, XRot, YRot, ZRot)
   Map3DRot21D = X
END FUNCTION

FUNCTION MapWorld3D21D (WorldX, WorldY, WorldZ, ScreenTotX, XTilt, YTilt, ZTilt)
    MapWorld3D21D = WorldY * (ScreenTotX + (WorldZ * ZTilt)) + (WorldX * XTilt)
END FUNCTION

FUNCTION Trans3D22DX (Object AS Location3D)
    Trans3D22DX = Object.X * d / (Object.Z + d)
END FUNCTION

FUNCTION Trans3D22DY (Object AS Location3D)
    Trans3D22DY = Object.Y * d / (Object.Z + d)
END FUNCTION

