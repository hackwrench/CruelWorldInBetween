DECLARE FUNCTION floppyDriveReady% (drive$)
DECLARE SUB TransferDTA2DIR (DEntry AS ANY)
DECLARE FUNCTION FindFirst% (Attr%, Filename$, DEntry AS ANY)
DECLARE FUNCTION FindNext% (DEntry AS ANY)
DECLARE FUNCTION Exist% (Name$, SearchAttrb%)
DEFINT A-Z
TYPE RegTypeX
     ax    AS INTEGER
     bx    AS INTEGER
     cx    AS INTEGER
     dx    AS INTEGER
     bp    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     flags AS INTEGER
     ds    AS INTEGER
     es    AS INTEGER
END TYPE

TYPE DataTransferArea
       Reserved1   AS STRING * 21
       Attribute   AS STRING * 1
       FileTime    AS INTEGER
       Filedate    AS INTEGER
       FileSize    AS LONG
       Filename    AS STRING * 13
END TYPE

TYPE DirectoryRecord
     Filename    AS STRING * 13
     FileSize    AS LONG
     Filedate    AS INTEGER
     FileTime    AS INTEGER
     FileAttb    AS INTEGER
END TYPE

SUB DTASet (DTA AS DataTransferArea)
    InRegsX.ax = &H1A00
    InRegsX.ds = VARSEG(DTA)
    InRegsX.dx = VARPTR(DTA)
    CALL INTERRUPTX(&H21, InRegsX, OutRegsX)
END SUB

FUNCTION Exist% (Name$, SearchAttrb%)

 ' Format:
 ' EXIST Name$, SearchAttrb%
 ' Name$ can be any valid DOS filename, directory name, or_
 ' volume label.
 '     wildcards (* and ?) are accepted.
 ' Attrb% can be the following:
 '     0 == Test for any file
 '    39 == Test for any file
 '    16 == Test for Directory names ONLY
 '     8 == Test for Volume labels ONLY
 '     4 == Test for System files ONLY
 '     2 == Test for Hidden files ONLY
 '     1 == Test for Read-Only files ONLY
 '    63 == Test for anything file/label/directory
 '
 '  Combinations can be made (ie. search for Read-only
 '  Directories) by following this binary number bit chart:
 '     Bit 7  Shareable (Novell Netware, otherwise ignore)
 '     Bit 6  unused
 '     Bit 5  archive
 '     bit 4  Directory
 '     Bit 3  Volume Label
 '     Bit 2  system
 '     Bit 1  Hidden
 '     Bit 0  Read only
 '  for example a Read-only Directory would be bits 0 and 4,
 '  in binary numbers that's: 10001 or 17 decimal.

 ' If the tested for item exists Exist% will be set to -1, true
 '    and SearchAttrb% can be ignored

 ' If the tested for item does not exist, or there is an error,
 ' Exist% will be set to 0, false, and SearchAttrb% will be set
 ' to one of the following:
 '    -1 == Floppy drive not ready or invalid drive letter.
 '     0 == item does not exist.

 DIM inreg AS RegTypeX, outreg AS RegTypeX

 seed$ = LTRIM$(RTRIM$(UCASE$(Name$)))

 IF SearchAttrb% AND 8 THEN  ' Volume label check
   ' Volume Label searches need to have a "." for the
   ' ninth character if the label is >8 characters.
   ' The following assures a correct search

   IF NOT (INSTR(seed$, ".")) THEN

    ' step backwards through the string

    FOR i = LEN(seed$) TO 1 STEP -1

      ' look for end of string, or drive/directory marker

      IF MID$(seed$, i, 1) = ":" OR MID$(seed$, i, 1) = "\" OR i = 1 THEN

        ' I points to start of name, without drive/directory
        ' marker, see if "." is required

        IF LEN(MID$(seed$, i + 1, LEN(seed$) - i)) > 8 THEN

         ' if no drive/directory, then we're checking the
         ' default drive, in this case I must equal 0 to
         ' place the "." correctly.

         IF i = 1 THEN i = 0

         ' place the "."

         seed$ = LEFT$(seed$, i) + MID$(seed$, i + 1, 8) + "." + MID$(seed$, i + 9, LEN(seed$) - i)
        END IF
        i = 1  ' exit the next loop
      END IF
    NEXT i
   END IF
 END IF

 IF SearchAttrb% = 0 THEN SearchAttrb% = 39  ' default search

 ' if there's a drive in the search string
 IF INSTR(seed$, ":") THEN
   drive$ = LEFT$(seed$, 1)   ' gets the drive
 ELSE
   drive$ = "@"               ' for default drive
 END IF

 ' if it's a floppy drive we need to make sure a disk
 ' is in the drive.
 IF NOT floppyDriveReady(drive$) THEN
   SearchAttrb% = -1   ' Floppy not ready.
   Exist% = 0
   EXIT FUNCTION
 END IF

 inreg.dx = VARPTR(DTA)      'set a new DOS DTA
 inreg.ds = VARSEG(DTA)
 inreg.ax = &H1A00
 CALL INTERRUPTX(&H21, inreg, outreg)

 seed$ = seed$ + CHR$(0)     'DOS needs ASCIIZ string
 inreg.ax = &H4E00           'find file name service
 inreg.cx = SearchAttrb%
 inreg.dx = SADD(seed$)      'show where the spec is
 inreg.ds = VARSEG(seed$)    'use this with QB - SSEG for PDS(?)
 CALL INTERRUPTX(&H21, inreg, outreg)

 IF (outreg.flags AND 1) THEN
   SearchAttrb% = 0          ' Item does not exist
   Exist% = 0
 ELSE
   Exist% = -1               ' item exists
 END IF

END FUNCTION

FUNCTION FindFirst (Attr, Filename$, DEntry AS DirectoryRecord)
       DTA.Filename = SPACE$(13)
       InRegsX.ax = &H4E00
       InRegsX.cx = Attr

       Spec$ = Filename$ + CHR$(0)
       InRegsX.ds = VARSEG(Spec$) ' Load DS:DX with
       InRegsX.dx = SADD(Spec$)   ' address of Spec$
       CALL INTERRUPTX(&H21, InRegsX, OutRegsX)

       FindFirst = OutRegsX.ax

       IF (OutRegsX.flags AND 1) = 0 THEN
             CALL TransferDTA2DIR(DEntry)
             FindFirst = 0 'Clear error condition setting
       END IF
END FUNCTION

FUNCTION FindNext (DEntry AS DirectoryRecord)
       DTA.Filename = SPACE$(13)
       InRegsX.ax = &H4F00
       CALL INTERRUPTX(&H21, InRegsX, OutRegsX)
       FindNext = OutRegsX.ax
       IF (OutRegsX.flags AND 1) = 0 THEN
             CALL TransferDTA2DIR(DEntry)
             FindNext = 0
       END IF
END FUNCTION

FUNCTION floppyDriveReady% (drive$)
 DIM inreg AS RegTypeX, outreg AS RegTypeX

 ' This function may also be used independently from
 ' the Exist% function. It returns -1, true if the
 ' drive is ready, or 0, false, if the drive is not
 ' ready, or the drive letter is an invalid drive.

 drive% = (ASC(drive$) OR 32) - 97

 'reset floppy drive
 inreg.ax = 0
 inreg.dx = drive%
 CALL INTERRUPTX(&H13, inreg, outreg)

 inreg.ax = &H401     'verify disk sector
 inreg.cx = &H101
 inreg.dx = drive%
 CALL INTERRUPTX(&H13, inreg, inreg)
 'call the interrupt twice since if a disk has just been
 'inserted, the first time gives a wrong answer
 inreg.ax = &H401
 inreg.cx = &H101
 inreg.dx = drive%
 CALL INTERRUPTX(&H13, inreg, outreg)

 'if it was a hard disk we just checked forget the whole thing
 IF outreg.ax AND 256 THEN
   inreg.ax = &H1C00      ' check drive type
   inreg.dx = drive% + 1  ' diff. drive number system must add 1
   CALL INTERRUPTX(&H21, inreg, outreg)
   ' check if drive was a valid drive letter.
   IF (outreg.ax AND &HFF) = &HFF THEN HardCheck = 0 ELSE HardCheck = -1
 END IF

 floppyDriveReady% = ((outreg.flags AND 1) = 0) OR HardCheck

END FUNCTION

SUB TransferDTA2DIR (DEntry AS DirectoryRecord)
       DEntry.Filename = DTA.Filename
       DEntry.FileSize = DTA.FileSize
       DEntry.Filedate = DTA.Filedate
       DEntry.FileTime = DTA.FileTime
       DEntry.FileAttb = ASC(DTA.Attribute)
END SUB

