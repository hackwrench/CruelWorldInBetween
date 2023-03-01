REDIM Race$(11)
Race$(1) = "Hobbit"
Race$(2) = "Elf"
Race$(3) = "Human"
Race$(4) = "Dwarf"
Race$(5) = "Drow"
Race$(6) = "Dragon"
Race$(7) = "Gnome"
Race$(8) = "Goblin"
Race$(9) = "Troll"
Race$(10) = "Skeleton"
Race$(11) = "Orc"
OPEN "O", 1, "races.dat"
FOR I = 1 TO UBOUND(Race$)
    PRINT #1, Race$(I)
NEXT I

