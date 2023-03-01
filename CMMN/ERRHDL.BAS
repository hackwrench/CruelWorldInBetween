DEFINT A-Z

COMMON SHARED /ErrorHandler/ ErrorType%

ErrorHandle:
    ErrorType% = ERR
RESUME NEXT

SUB ErrorHandling.INIT
    ON ERROR GOTO ErrorHandle
END SUB

