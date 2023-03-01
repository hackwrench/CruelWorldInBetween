DEFINT A-Z

DECLARE FUNCTION Blocks.Count% (Min%, Max%)

FUNCTION Blocks.Count% (Min%, Max%)
    Blocks.Count% = Max% - Min% + 1
END FUNCTION

