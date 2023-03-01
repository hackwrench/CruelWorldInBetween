'$DYNAMIC
DEFINT A-Z

TYPE FileInfoType
     Reserved AS STRING * 21
     Attribute AS STRING * 1
     CreationTime AS INTEGER
     CreationDate AS INTEGER
     Size AS LONG
     FileName AS STRING * 13
END TYPE

TYPE RegTypeX
     AX    AS INTEGER
     BX    AS INTEGER
     CX    AS INTEGER
     DX    AS INTEGER
     BP    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     Flags AS INTEGER
     DS    AS INTEGER
     ES    AS INTEGER
END TYPE

TYPE MemLoc
     Segment AS INTEGER
     Offset  AS INTEGER
END TYPE

DECLARE SUB Directory.Files.Get (FileList() AS ANY, FileTest AS STRING)
DECLARE FUNCTION File.Exist% (FileName AS STRING)

REM $STATIC
SUB Directory.Files.Get (FileList() AS STRING, FileTest AS STRING)
    DIM FileInfo AS FileInfoType, InRegs AS RegTypeX, TempFile AS STRING
    ' When DOS performs disk activity, it uses a DTA (Disk Transfer Area)
    ' in memory.  Usually this is a 128 byte buffer located at offset 80h
    ' in the PSP (Program Segment Prefix).  Since a variable is used here for
    ' easy access, save the current DTA address must be saved and restored
    ' when done.
   
    regx.ax = &H2F00        ' Service 2F (Get DTA) in register AH, 00 in AL.
    InterruptX &H21, regx, regx
    oldOffset% = regx.bx    ' Register BX contains offset of current DTA.
    oldSegment% = regx.es   ' Register ES contains segment of current DTA.
   
    InRegs.AX = &H1A00
    InRegs.DX = VARPTR(FileInfo)
    InRegs.DS = VARSEG(FileInfo)
    CALL InterruptX(&H21, InRegs, InRegs)
   
    TempFile = FileTest + CHR$(0)
   
    InRegs.AX = &H4E00
    InRegs.DX = SADD(TempFile)
    InRegs.DS = VARSEG(TempFile)
    CALL InterruptX(&H21, InRegs, InRegs)
    FileList(0) = FileInfo.FileName
    FOR I = 1 TO 255
        InRegs.AX = &H4F00
        InRegs.DX = SADD(TempFile)
        InRegs.DS = VARSEG(TempFile)
        CALL InterruptX(&H21, InRegs, InRegs)
        FileList(I) = FileInfo.FileName
    NEXT I
    regx.ax = &H1A00        ' Service 1A in register AH, 00 in AL.
    regx.dx = oldOffset%    ' Offset of address of original DOS DTA.
    regx.ds = oldSegment%   ' Segment of address of original DOS DTA.
    InterruptX &H21, regx, regx
END SUB

SUB Drive.Default.Get (Drive$)
    DIM InRegs AS RegType
    InRegs.AX = &H1900
    INTERRUPT &H21, InRegs, InRegs
    Drive$ = CHR$((InRegs.AX AND &HFF) + 65) + ":"
END SUB

SUB Drive.Default.Set (Drive$)
    DIM InRegs AS RegType
    InRegs.AX = &HE00
    InRegs.DX = ASC(Drive$) - 65
    INTERRUPT &H21, InRegs, InRegs
END SUB

FUNCTION File.Exist (FileName AS STRING)
    DIM FileInfo AS FileInfoType, InRegs AS RegTypeX, TempFile AS STRING
    InRegs.AX = &H1A00
    InRegs.DX = VARPTR(FileInfo)
    InRegs.DS = VARSEG(FileInfo)
    CALL InterruptX(&H21, InRegs, InRegs)
  
    TempFile = FileName + CHR$(0)
  
    InRegs.AX = &H4E00
    InRegs.DX = SADD(TempFile)
    InRegs.DS = VARSEG(TempFile)
    CALL InterruptX(&H21, InRegs, InRegs)
    IF FileName = FileInfo.FileName THEN
       File.Exists = -1
       EXIT FUNCTION
    END IF

    FOR I = 1 TO 255
        InRegs.AX = &H4F00
        InRegs.DX = SADD(TempFile)
        InRegs.DS = VARSEG(TempFile)
        CALL InterruptX(&H21, InRegs, InRegs)
        IF FileName = FileInfo.FileName THEN
           File.Exists = -1
           EXIT FUNCTION
        END IF
    NEXT I
END FUNCTION

SUB Subdirectory.List.Get (FileList() AS STRING, FileTest AS STRING)
    DIM FileInfo AS FileInfoType, InRegs AS RegTypeX, TempFile AS STRING
    InRegs.AX = &H1A00
    InRegs.DX = VARPTR(FileInfo)
    InRegs.DS = VARSEG(FileInfo)
    CALL InterruptX(&H21, InRegs, InRegs)
  
    TempFile = FileTest + CHR$(0)
  
    InRegs.AX = &H4E00
    InRegs.CX = &H10
    InRegs.DX = SADD(TempFile)
    InRegs.DS = VARSEG(TempFile)
    CALL InterruptX(&H21, InRegs, InRegs)
    IF (ASC(FileInfo.Attribute) AND &H10) THEN
       FileList(0) = FileInfo.FileName
    END IF
    FOR I = 1 TO 255
        InRegs.AX = &H4F00
        InRegs.CX = &H10
        InRegs.DX = SADD(TempFile)
        InRegs.DS = VARSEG(TempFile)
        CALL InterruptX(&H21, InRegs, InRegs)
        IF (ASC(FileInfo.Attribute) AND &H10) THEN
           FileList(I) = FileInfo.FileName
        END IF
    NEXT I
END SUB

