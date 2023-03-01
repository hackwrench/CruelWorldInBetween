DECLARE SUB Title.Bar13 (Text AS STRING, X%, Y%, Length%)

SUB Dialog.FileNotFound (FileName AS STRING)
    CALL Title.Bar13("File Not Found", 20, 20, 100)
END SUB

