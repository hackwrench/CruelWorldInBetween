'-------------------------------------------------------------------------
'
' OBJECT MODIFIERS:
'
' Every object has a set of 5 'generic' attributes which have different
' meaning depending on the object's type.  These attributes are named
' m0 through m4, but this section allows you to assign specific names to
' the attributes.
'
' For example, a WEAPON may use the attributes as follows:
'
'  object.m0 = # of HANDS needed to hold the weapon (0, 1 or 2)
'  object.m1 = RANGE of the weapon (how many squares away can it hit)
'  object.m2 = DAMAGE done during battle (deducted from monster's hit points)
'  object.m3 = Type of AMMUNITION used by the weapon (if any)
'  object.m4 = not used for weapons
'
' Thus, the following definitions are made below:
'
'   .M0 = HANDS
'   .M1 = RANGE
'   .M2 = DAMAGE
'   .M3 = AMMONEEDED
'
' Which means that your script can have the line:
'
'   if player.weapon.hands > 2 then
'     writeln( "That weapon was made for an octupus, which you are not.." );
'     ..
'
' instead of
'
'   if player.weapon.m0 > 2 then
'     writeln( "That weapon was made for an octupus, which you are not.." );
'     ..
'
' NOTE: The names listed below are 'aliases' for the real names m0 through m4,
' which exist for all objects.  No attempt is made to verify that the alias
' you have used is 'valid' for the object's type.  Thus, the following line
' is also equivalent to the two lines in the example above:
'
'   if player.weapon.ac > 2 then
'     writeln( "That weapon was made for an octupus, which you are not.." );
'     ..
'
' because the alias 'ac' is an alias for m0, the same as the alias 'hands'.
'
'[OBJECT MODIFIERS]

' Object Type: FOOD
'          0   Is not used
CONST UNITS = 1     ' If magical, how many units are affected
CONST PERMANENT = 2 ' If magical, how long does effect last? (0=one day, 1=permanent)
'          3   Is not used
'          4   Is not used

' Object Type: WEAPON
CONST HANDS = 0     ' # of hands needed to use the weapon
CONST RANGE = 1     ' Range of this weapon
CONST DAMAGE = 2    ' Damage done when using this weapon.
CONST AMMO.NEEDED = 3 ' Type of ammunition needed (See AMMOTYPE below..)
'          4   Is not used

' Object Type: AMMO
CONST AMMOTYPE = 0  ' Code that differentiates one ammunition from another
CONST RANGE = 1     ' Range of this ammunition
CONST DAMAGE = 2    ' Extra Damage (in addition to the weapon's normal damage)
'          3   Is not used
'          4   Is not used

' Object Type: ARMOR    
CONST AC = 0        ' Armor Class of the armor
CONST ACTYPE = 1    ' Armor Type (not currently implemented)
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: SHIELD    
CONST AC = 0        ' Armor Class of the shield
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: AMULET    
CONST CHARGES = 0   ' Number of times this item can be used
CONST UNITS = 1     ' If magical, how many units are affected
CONST PERMANENT = 2 ' If magical, how long does effect last? (0=one day, 1=permanent)
'          3   Is not used
'          4   Is not used

' Object Type: RING      
CONST CHARGES = 0   ' Number of times this item can be used
CONST UNITS = 1     ' If magical, how many units are affected
CONST PERMANENT = 2 ' If magical, how long does effect last? (0=one day, 1=permanent)
'          3   Is not used
'          4   Is not used

' Object Type: POTION   
'          0   Is not used
CONST UNITS = 1     ' If magical, how many units are affected
CONST PERMANENT = 2 ' If magical, how long does effect last? (0=one day, 1=permanent)
'          3   Is not used
'          4   Is not used

' Object Type: SCROLL   
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: STAFF    
CONST CHARGES = 0   ' Number of times this item can be used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: CHEST    
CONST LOCKTYPE = 0  ' Type of lock on the chest (0=None, 1+=KEYTYPE needed)
CONST TRAPTYPE = 1  ' Type of trap on the lock. 0=No trap, 1=poison,2+=bomb trap)
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: KEYS     
CONST KEYTYPE = 0   ' Type of lock that the key opens
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: GEMS     
CONST CHARGES = 0   ' Number of times this item can be used
CONST UNITS = 1     ' If magical, how many units are affected
CONST PERMANENT = 2 ' If magical, how long does effect last? (0=one day, 1=permanent)
'          3   Is not used
'          4   Is not used

' Object Type: BOOK     
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: GOLDSACK 
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: TORCH    
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: LANTERN   
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: ROPE     
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: HOOKS    
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: MIRROR   
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: SIGN     
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

' Object Type: VEHICLE  
'          0   Is not used
'          1   Is not used
'          2   Is not used
'          3   Is not used
'          4   Is not used

'
' OTHER TOKENS
'
' The rest of the tokens are just names associated with values.  They
' are not used internally by the game system, only by the scripts.  You
' may add any number of sections below, as long as the names are unique
' and different from the ones above.
'
' ENDGAME attribute values:  The object attribute 'endgame' can be set
' to a non-zero value to indicate that the object causes the end of the
' game when a certain action happens.  The value 1 indicates that the game
' should end when the player GETs the object.  The value 2 indicates that
' the game should end when the object is given to a quester.  (See the
' QUESTER script).  The value 3 means the game should end when the player
' USEs the object.  Values 4 through 15 are reserved for expansion.  The
' values from 16 to 255 may be used as you please.
'
'[END-GAME VALUES]
CONST END.ON.GET = 1      ' Game ends if you GET this object       (OBJECT.SCR)
CONST END.ON.GIVE = 2     ' Game ends if you GIVE the object       (QUESTER.SCR)
CONST END.ON.USE = 3      ' Game ends if you USE/INVOKE the object (OBJECT.SCR)

