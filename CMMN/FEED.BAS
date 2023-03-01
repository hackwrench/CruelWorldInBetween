DEFINT A-Z
'$DYNAMIC

TYPE FeedData
  DataNext AS INTEGER
  DataNeeded AS INTEGER
  FilePtr1 AS INTEGER
  FilePtr2 AS INTEGER
END TYPE

DECLARE FUNCTION ConfusedInc% (a%, B%)
DECLARE FUNCTION FileOPEN% (FileName$, Mode$)

FUNCTION ConfusedInc% (a%, B%)
    IF a% <> B% THEN ConfusedInc = -1
    a% = a% + 1
END FUNCTION

SUB EndFeed (FeedPointer AS FeedData)
    CLOSE FeedPointer.FilePtr1
    CLOSE FeedPointer.FilePtr2
END SUB

SUB LoadFeed (FeedPointer AS FeedData, Text$, x%, y%)
LoadAnotherFeed:
    LINE INPUT #FeedPointer.FilePtr1, Text$
    GET #FeedPointer.FilePtr2, , x%
    GET #FeedPointer.FilePtr2, , y%
    IF ConfusedInc(FeedPointer.DataNext, FeedPointer.DataNeeded) THEN GOTO LoadAnotherFeed
    FeedPointer.DataNeeded = FeedPointer.DataNeeded + 1
END SUB

SUB StartFeed (FeedPointer AS FeedData, FileName1$, FileName2$)
    FeedPointer.FilePtr1 = FileOPEN(FileName1$, "I")
    FeedPointer.FilePtr2 = FileOPEN(FileName2$, "I")
    FeedPointer.DataNext = 1
    FeedPointer.DataNeeded = 1
END SUB

