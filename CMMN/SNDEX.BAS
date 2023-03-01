DEFINT A-Z

DECLARE FUNCTION Sound.Calc% (Freq!)

FUNCTION Sound.Calc% (Freq!)
    'Divide clock frequency by sound frequency
    'to get number of "clicks" clock must produce
    Sound.Calc% = CINT(1193280! / Freq!)
END FUNCTION

DEFSNG A-Z
SUB Sound.Off
    SpkrOff% = INP(97) AND &HFC
    OUT 97, SpkrOff%
END SUB

SUB Sound.On (Freq%) STATIC
'Ports 66, 67, and 97 control timer and speaker
    LoByte% = Freq% AND &HFF
    HiByte% = Freq% \ 256
'Tell timer that data is coming
    OUT 67, 182
'Send count to timer
    OUT 66, LoByte%
    OUT 66, HiByte%
'Turn speaker on by setting bits 0 and 1 of PPI chip.
    SpkrOn% = INP(97) OR &H3
    OUT 97, SpkrOn%
END SUB

