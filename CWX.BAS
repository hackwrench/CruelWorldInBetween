DECLARE SUB Font.System (Text$, X%, Y%, Colour%)
DECLARE SUB Font.System.Init ()
DEFINT A-Z
'$INCLUDE: 'C:\HIQB\CMMN\LOCATE.INC'
'$INCLUDE: 'C:\HIQB\CMMN\ITEMS.INC'

'$INCLUDE: 'DeclareX.INC'
'$INCLUDE: 'Constant.BAS'
'$INCLUDE: 'Dims.Bas'

''$INCLUDE: 'InitS.bas'

SCREEN 9, 0, 0, 0
CLS

CALL Font.System("Stay with me...", 0, 342, 8)
CALL System.Delay(.2)
CALL Font.System("Stay with me...", 0, 342, 0)

