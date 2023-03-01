DEFINT A-Z
' This file contains NAMES that can be used instead of numeric values
' when you are writing scripts or creating worlds.  These names make
' it a lot easier to create the games because you don't have to remember
' what the numbers mean. You can use the name instead.
'
' For example, the script line:
'
'    if object.type = WEAPON then ..
'
' clearly is testing whether a given object is of type WEAPON.  It is
' a lot better than trying to remember that weapons are represented by
' a # 1, as in:
'
'    if object.type = 1 then ..
'
' You are welcome to add new tokens to this list, and to change the names
' being used.  However, you should not REMOVE entries unless you are very
' sure of what you are doing.
'
' Tokens are listed in groups, with the name of the group enclosed in
' brackets [group-name] and preceeding each group.  You can create your
' own groups, but the groups already here must remain.  You can change
' the lists, but the group names must not be changed.  They are used to
' tell the game system what names are associated with specific types of
' values.
'
' A brief explanation of what the values in a group mean preceeds each
' group.

' TYPES OF OBJECTS.  May be extended up to 255.  Object types 0 through
' 35 are reserved.  You can create your own starting with 36 and going
' all the way to 255.  This way, I can add new types without affecting
' anything you write.
'
' Note that object behaviour is controlled by the script OBJECT.SCR, which
' uses the object's TYPE and CLASS to decide how the object behaves.

'[OBJECT TYPES]
CONST FOOD = 0          ' This can be eaten.
CONST WEAPON = 1        ' This can be wielded as a weapon.
CONST AMMO = 2          ' This is ammunition for a weapon.
CONST ARMOR = 3         ' This can be worn as armor.
CONST SHIELD = 4        ' This can be carried as a shield.
CONST AMULET = 5        ' This can be worn around your neck.
CONST RING = 6          ' This can be worn around your finger.
CONST POTION = 7        ' This can be drunk
CONST SCROLL = 8        ' This can be invoked
CONST STAFF = 9         ' This can be wielded and used to ZAP spells
CONST CHEST = 10        ' A chest covers other objects.  May be locked.
CONST KEYS = 11         ' This key may be used to open doors or chests
CONST GEMS = 12         ' This gems may be invoked.
CONST BOOK = 13         ' This book may be read.
CONST GOLDSACK = 14     ' Contains gold or silver.
CONST TORCH = 15        ' has no special qualities yet.
CONST LANTERN = 16      ' has no special qualities yet.
CONST ROPE = 17         ' has no special qualities yet.
CONST HOOKS = 18        ' has no special qualities yet.
CONST MIRROR = 19       ' has no special qualities yet.
CONST SIGN = 20         ' This has some text written on it
CONST VEHICLE = 21      ' This can be used for transportation.

' Types of CHARACTERS.  The type determines the default behavior of the
' character.  A script has been (or will be) written to control the
' character's normal behavior.
'
' The script name must be the first 8 characters of the token name below.

'[CHARACTER TYPES]
CONST REGULAR = 0       ' REGULAR.SCR  - Will join the party if asked to..
CONST HOSTILE = 1       ' HOSTILE.SCR  - Will attack on sight and follow you..
CONST MERCHANT = 2      ' MERCHANT.SCR - Buys and Sells stuff..
CONST BARTENDER = 3     ' BARTENDE.SCR - Sells beer.  Good source of information.
CONST HEALER = 4        ' HEALER.SCR   - Cure, Heal, Resurrect, Remove Curse,..
CONST CIVILIAN = 5      ' CIVILIAN.SCR - Will talk, but won't join..
CONST TELLER = 6        ' TELLER.SCR   - Fortune Teller or Oracle type..
CONST QUESTER = 7       ' QUESTER.SCR  - Asks you to find an object or person.
CONST BEGGAR = 8        ' BEGGAR.SCR   - Wants money.  Might give you a tip.
CONST TRAINER = 9       ' TRAINER.SCR  - Will train someone (STR,DEX,AIM,IQ)
CONST GUARD = 10        ' GUARD.SCR    - Blocks your way unless given the password.
CONST PRISONER = 11     ' PRISONER.SCR - Will join your party temporarily (to escape).

' System Graphics:  The following values are used to differentiate
' graphics blocks in the DCSYSTEM graphics file.  The first 5 entries
' (shown below) are also the first 5 graphics blocks in the file, and
' are used during regular game play.

'[SYSTEM TYPES]
CONST SYS.PARTY = 0  ' The party, except when fighting.
CONST SYS.FRAME = 1  ' A frame around the character whose turn it is to move.
CONST SYS.SPLAT = 2  ' Used to indicate the character was hit.
CONST SYS.TARGET = 3 ' Used to point at things.
CONST SYS.BULLET = 4 ' Use to represent a moving missle when fired.

'
' CHARACTER CLASSES (ALL CHARACTER TYPES EXCEPT HOSTILE)
'
'[CHARACTER CLASSES]
CONST HUMAN = 0          ' standard stuff, no power
CONST ELF = 1            ' fast, magical power, not strong
CONST DWARF = 2          ' slow, STRONG, no magic, no missles or shields
CONST WIZARD = 3         ' slow, lot's of magic, not strong
CONST ARCHER = 4         ' fast, no magic, + on missle weapons
CONST FIGHTER = 5        ' fast, strong, no magic of any kind

'
' MONSTER CLASSES (For HOSTILE type characters).
'
'[MONSTER CLASSES]
CONST LAND.MONSTER = 0     ' Land Based, cannot walk over water
CONST WATER.MONSTER = 1    ' Water Based, cannot walk over land
CONST CAVE.MONSTER = 2     ' Dungeon Based, found mostly in dungeons
CONST SPOOK.MONSTER = 3    ' Ghosts, Zombies, Undead, etc.

