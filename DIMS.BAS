Common Shared Key$, StatusKey$
COMMON SHARED Scale%, Font$()   '/Fonts/

'Global Variables
Dim Shared Failed(1 To 3)
Dim Shared Font$(72 To 73)
'End Global Variable

DIM SHARED Thing(34) AS Dweller, Race$(4)


'Items, Possessions, Etc

DIM SHARED Weapon$(8)
DIM SHARED BWPrices%(8)
DIM SHARED Armor$(8)

DIM Body(DarkWarrior TO CrystaJet) AS Appearance
DIM Stats(DarkWarrior TO CrystaJet) AS Character
DIM SHARED Inventory(255) AS Storage
'Places
DIM SHARED Treasure(8)

DIM SHARED Castle(0 TO 511) AS INTEGER
DIM SHARED Amulet AS Location3D
DIM SHARED RuneStaff AS Location3D
DIM Entrance AS Location3D

DIM SHARED Block1%(65), DarkWarriorEast%(65)

DIM VenderStatement(5) AS TextString



