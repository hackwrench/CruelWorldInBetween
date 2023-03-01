DEFINT A-Z

DECLARE FUNCTION FileOPEN% (FileName$, Mode$)

FUNCTION FileOPEN% (FileName$, Mode$)
    FileOPEN% = FREEFILE
    OPEN Mode$, FREEFILE, FileName$
END FUNCTION

