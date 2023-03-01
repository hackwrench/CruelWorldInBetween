ON ERROR GOTO ErrorHandle
OPEN "I", 1, "CHARACTER.NFO"
FOR I = 1 TO 5
NEXT I
PRINT "Select the person you want stats on:"
PRINT "Dark Warrior"
PRINT "Arlyn"

ON person GOTO DarkWarrior.Info, Arlyn.Info, Simon.Info
Dark Warrior.Info
'Dark Warrior               M  Leader, aka Shep Marshall
'Arlyn Marshall             F  Adopted Daughter
'Simon Expo                 M  Explosives, Whip
'Crysta Jet                 F  Pilot, Inventor
'Jeanny Cauldron            F  Spell Caster, Accountant

'Nega Warrior               M  Leader
'DeathJolt                  M  Electricity
'Katyn Forest               F  Plants
'Water Fiend                F  Deals with water
'Key-ToyMaster              M  Safecracker, Prankster
END
ErrorHandle:
Print "File CHARACTR.NFO not found

