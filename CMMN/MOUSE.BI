' ==========================================================================
' Symbolic constants for TRUE (non-zero) and FALSE (0).
' ==========================================================================
CONST FALSE = 0, TRUE = -1

' ==========================================================================
' Constants for mouse button masks.
' ==========================================================================
CONST LeftButtonMask% = 1
CONST RightButtonMask% = 2
CONST CenterButtonMask% = 4


' ==========================================================================
' Constants to represent the UP or DOWN status of mouse buttons.
' ==========================================================================
CONST ButtonUp = 0
CONST ButtonDown = 1

CONST MouseOff = 0
CONST MouseOn = 1


' ==========================================================================
' Constants to refer to the left, right, and center mouse buttons.
' ==========================================================================
CONST LeftButton = 0
CONST RIGHTButton = 1
CONST CENTERButton = 2


' ==========================================================================
' Constants to represent the five types of mice recognized by the mouse
' driver function 36, Get Mouse Version Number, Mouse Type, and IRQ number.
' ==========================================================================
CONST BusMouse = 1
CONST SerialMouse = 2
CONST InportMouse = 3
CONST PS2Mouse = 4
CONST HPMouse = 5


' ==========================================================================
' Constants to define the two types of mouse cursors, as well as the default
' software mouse cursor masks.
' ==========================================================================
CONST SoftwareCursor = 0
CONST HardwareCursor = 1
CONST DefaultSMask = &H77FF
CONST DefaultCMask = &H7700


' ==========================================================================
' Define register types to be used by the INTERRUPT routine.  Required for
' accessing the mouse driver interrupt (33h).
' ==========================================================================
TYPE RegType
		 ax    AS INTEGER
		 bx    AS INTEGER
		 cx    AS INTEGER
		 dx    AS INTEGER
		 bp    AS INTEGER
		 si    AS INTEGER
		 di    AS INTEGER
		 flags AS INTEGER
END TYPE

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


' ==========================================================================
' DECLARE statement for all the routines in the mouse package.  Note that
' the INTERRUPT routine is found in the QB QLB/.LIB libraries supplied
' with the QuickBASIC compiler by Microsoft.
' ==========================================================================

DECLARE SUB INTERRUPT (intnum AS INTEGER, inreg AS RegType, outreg AS RegType)
DECLARE SUB INTERRUPTX (intnum AS INTEGER, inreg AS RegTypeX, outreg AS RegTypeX)
DECLARE FUNCTION MouseInit% ()
DECLARE SUB Mouse (m1%, m2%, m3%, m4%)
DECLARE SUB MouseButtonPressInfo (button%, numPresses%, x%, y%)
DECLARE SUB MouseButtonReleaseInfo (button%, numReleases%, x%, y%)
DECLARE SUB MouseButtonStatus (bl%, br%, bc%)
DECLARE SUB MouseGetSensitivity (x%, y%, doubleSpeed%)
DECLARE SUB MouseHide ()
DECLARE SUB MouseInfo (DriverVersion$, mouseType%, IRQ%)
DECLARE SUB MouseMickeyCount (x%, y%)
DECLARE SUB MousePosition (x%, y%)
DECLARE SUB MouseSelectTextCursor (cursorType%, topScan%, botScan%, scrMask%, curMask%)
DECLARE SUB MouseSetMinMaxX (minX%, maxX%)
DECLARE SUB MouseSetMinMaxY (minY%, maxY%)
DECLARE SUB MouseSetPosition (x%, y%)
DECLARE SUB MouseSetSensitivity (x%, y%, doubleSpeed%)
DECLARE SUB MouseShow ()

