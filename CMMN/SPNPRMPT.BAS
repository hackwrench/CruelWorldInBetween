DEFINT A-Z

DECLARE SUB Font.Regular (Text$, X%, Y%, Colour%)

DIM SHARED SpinPrompt(0 TO 3) AS STRING * 1

SUB Prompt.Spin (X, Y, col) STATIC
    CALL Font.Regular(SpinPrompt(I), X, Y, col)
    I = I + 1
    IF I > 3 THEN I = 0
END SUB

SUB Prompt.Spin.Init
    SpinPrompt(0) = "-"
    SpinPrompt(1) = "\"
    SpinPrompt(2) = "³"
    SpinPrompt(3) = "/"
END SUB

