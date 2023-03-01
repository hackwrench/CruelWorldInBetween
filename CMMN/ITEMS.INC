
TYPE Attributes
     Race  AS INTEGER
     Developed    AS INTEGER
     Dexterity    AS INTEGER
     Strength     AS INTEGER
     Intelligence AS INTEGER
     Disease      AS STRING * 8
END TYPE

TYPE Stockpile
     Weapon       AS INTEGER
     Firearm      AS INTEGER
     Armour       AS INTEGER
     Claw         AS INTEGER
     Footwear     AS INTEGER
END TYPE

TYPE Character
     NameIs       AS STRING * 20
     Gender       AS STRING * 1
     Status       AS Attributes
     Accesories   AS Stockpile
END TYPE

TYPE Storage
     Article AS STRING * 20
     NumberOf AS INTEGER
END TYPE

TYPE Dweller
     Description AS STRING * 20
     Icon AS STRING * 1
     Colour AS INTEGER
END TYPE

