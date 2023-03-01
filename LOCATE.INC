TYPE Location3D
     X AS INTEGER
     Y AS INTEGER
     Z AS INTEGER
END TYPE

TYPE Location2D
     X AS INTEGER
     Y AS INTEGER
END TYPE

TYPE Object2D
     X1 AS INTEGER
     Y1 AS INTEGER
     X2 AS INTEGER
     Y2 AS INTEGER
END TYPE'Object2D

TYPE TextString ' object(Location)
     OBJLocation AS Location2D
     Text AS STRING * 80
     Attr AS INTEGER 'Byte
END TYPE

TYPE RectangleType
     X1 AS INTEGER
     Y1 AS INTEGER
     X2 AS INTEGER
     Y2 AS INTEGER
END TYPE

TYPE RectangleTypeObject
     ULCorner AS Object2D
     LRCorner AS Object2D
END TYPE

TYPE TextColorType
     Text AS INTEGER
     Back AS INTEGER
END TYPE

TYPE TextObject ' object(Location)
     Text AS STRING * 80
     At AS Location2D
     Colour AS INTEGER 'Byte
END TYPE

TYPE Appearance
     Identifies AS INTEGER
     At         AS Location3D
     Image      AS INTEGER
     Direction  AS INTEGER
END TYPE

DECLARE SUB Location.Init (Object AS ANY, InitX%, InitY%)
DECLARE SUB Variable.Load (Object() AS ANY, File$)

