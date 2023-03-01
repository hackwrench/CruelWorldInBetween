TYPE Dweller
     Description AS STRING * 20
     Icon AS STRING * 1
     Colour AS INTEGER
END TYPE

DIM SHARED Thing(34) AS Dweller

 Thing(0).Description = "nothing"
 Thing(0).Icon = " "
 Thing(0).Colour = 7


 Thing(1).Description = "a gate"
 Thing(1).Icon = "Œ"
 Thing(1).Colour = 14

 Thing(2).Description = "a doorway"
 Thing(2).Icon = "Ô"
 Thing(2).Colour = 14

 Thing(3).Description = "stairs going up"
 Thing(3).Icon = "U"
 Thing(3).Colour = 11

 Thing(4).Description = "stairs going down"
 Thing(4).Icon = "D"
 Thing(4).Colour = 11

 Thing(5).Description = "a pool"
 Thing(5).Icon = "P"
 Thing(5).Colour = 9

 Thing(6).Description = "a chest"
 Thing(6).Icon = "C"
 Thing(6).Colour = 6

 Thing(7).Description = "gold pieces"
 Thing(7).Icon = "G"
 Thing(7).Colour = 14

 Thing(8).Description = "flares"
 Thing(8).Icon = "ü"
 Thing(8).Colour = 12

 Thing(9).Description = "a warp"
 Thing(9).Icon = "€"
 Thing(9).Colour = 10

Thing(10).Description = "a sinkhole"
Thing(10).Icon = "S"
Thing(10).Colour = 6

Thing(11).Description = "a Crystal Orb"
Thing(11).Icon = "È"
Thing(11).Colour = 13

Thing(12).Description = "a book"
Thing(12).Icon = "B"
Thing(12).Colour = 8

Thing(13).Description = "a Green Slime"
Thing(13).Icon = "≤"
Thing(13).Colour = 2

Thing(14).Description = "an Orc"
Thing(14).Icon = "ù"
Thing(14).Colour = 9

Thing(15).Description = "an Evil Dwarf"
Thing(15).Icon = "ù"
Thing(15).Colour = 4

Thing(16).Description = "a Goblin"
Thing(16).Icon = "ù"
Thing(16).Colour = 5

Thing(17).Description = "a Mind Flayer"
Thing(17).Icon = "ù"
Thing(17).Colour = 5

Thing(18).Description = "a Troll"
Thing(18).Icon = "ù"
Thing(18).Colour = 5

Thing(19).Description = "a Giant Spider"
Thing(19).Icon = "*"
Thing(19).Colour = 5

Thing(20).Description = "a Minotar"
Thing(20).Icon = "ù"
Thing(20).Colour = 5

Thing(21).Description = "a Drow"
Thing(21).Icon = "*"
Thing(21).Colour = 5

Thing(22).Description = "a Drider"
Thing(22).Icon = "ù"
Thing(22).Colour = 5

Thing(23).Description = "a Balor Demon"
Thing(23).Icon = "ù"
Thing(23).Colour = 9

Thing(24).Description = "a Red Dragon"
Thing(24).Icon = "Î"
Thing(24).Colour = 4

Thing(25).Description = "a Drow Merchant"
Thing(25).Icon = "Í"
Thing(25).Colour = 5

Thing(26).Description = "the Ruby Red"
Thing(26).Icon = "T"
Thing(26).Colour = 4

Thing(27).Description = "the Norn Stone"
Thing(27).Icon = "T"
Thing(27).Colour = 5

Thing(28).Description = "the Pale Pearl"
Thing(28).Icon = "T"
Thing(28).Colour = 7

Thing(29).Description = "the Opal Eye"
Thing(29).Icon = "T"
Thing(29).Colour = 5

Thing(30).Description = "the Green Gem"
Thing(30).Icon = "T"
Thing(30).Colour = 2

Thing(31).Description = "the Blue Flame"
Thing(31).Icon = "T"
Thing(31).Colour = 9

Thing(32).Description = "the Palantir"
Thing(32).Icon = "T"
Thing(32).Colour = 5

Thing(33).Description = "the Silmaril"
Thing(33).Icon = "T"
Thing(33).Colour = 5

Thing(34).Description = "a wall"
Thing(34).Icon = "€"
Thing(34).Colour = 6

OPEN "B", 1, "objects.dat"
FOR I = 0 TO UBOUND(Thing)
    PUT 1, , Thing(I)
NEXT I
CLOSE

