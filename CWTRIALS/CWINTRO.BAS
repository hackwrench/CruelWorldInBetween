DECLARE SUB Rope.Swing ()
DECLARE SUB Block.Get (CharX%, CharY%)
DECLARE FUNCTION Mapx16% (n%)
DEFINT A-Z

DIM SHARED Block1%(65), Block2%(65), Block3%(65)
SCREEN 9, 0, 0, 1

Load.Block:
   OPEN "I", 1, "rope.asc"
   CALL Block.Get(15, 15)
   GET (0, 0)-(15, 15), Block1%
CLS
   OPEN "I", 1, "jcwt.asc"
   CALL Block.Get(15, 15)
   GET (0, 0)-(15, 15), Block2%
CLS
 OPEN "I", 1, "arlyn.asc"
   CALL Block.Get(15, 15)
   GET (0, 0)-(15, 15), Block3%
CLS

 FOR I = 0 TO 39
     FOR j = 0 TO 9
         PUT (Mapx16(I), Mapx16(j)), Block2%, PSET
     NEXT j
 NEXT I

    FOR I = 0 TO 39
        FOR j = 10 TO 19
            LINE (Mapx16(I), Mapx16(j))-(Mapx16(I) + 15, Mapx16(j) + 15), 8, B
        NEXT j
    NEXT I
SCREEN 9, 0, 0, 0
CALL Rope.Swing

SUB Block.Get (CharX, CharY) STATIC
  DIM Fld(15, 15)
  FOR j = 0 TO CharX
      FOR I = 0 TO CharY
          INPUT #1, Fld(I, j)
      NEXT I
  NEXT j
  CLOSE
  FOR I = 0 TO 15
      FOR j = 0 TO 15
          PSET (I, j), Fld(I, j)
      NEXT j
  NEXT I
END SUB  'Block.Get

SUB Rope.Swing
    j = 0
    FOR I = 39 TO 30 STEP -1
        FOR K = 0 TO j
            PUT (Mapx16(I), Mapx16(K)), Block1%, PSET
        NEXT K
            PUT (Mapx16(I), Mapx16(j)), Block3%, OR
      
        IF I = 31 THEN
           EXIT SUB
        END IF
        TIM# = TIMER + .2
        WHILE TIM# > TIMER
        WEND
        FOR K = 1 TO j + 1
            PUT (Mapx16(I), Mapx16(K)), Block2%, PSET
        NEXT K
        j = j + 1
    NEXT I
END SUB

