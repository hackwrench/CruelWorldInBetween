; ===== MACROS =====
; Macro to OUT a 16 bit value to an I/O port
OUT_16 MACRO Register, Value
	IFDIFI <Register>, <DX>         ; If DX not setup
	MOV     DX, Register        ; then Select Register
	ENDIF
	IFDIFI <Value>, <AX>            ; If AX not setup
	MOV     AX, Value           ; then Get Data Value
	ENDIF
	OUT     DX, AX              ; Set I/O Register(s)
ENDM

; Macro to OUT a 8 bit value to an I/O Port
OUT_8 MACRO Register, Value
	IFDIFI <Register>, <DX>         ; If DX not setup
	MOV     DX, Register        ; then Select Register
	ENDIF
	IFDIFI <Value>, <AL>            ; If AL not Setup
	MOV     AL, Value           ; then Get Data Value
	ENDIF
	OUT     DX, AL              ; Set I/O Register
ENDM

; macros to PUSH and POP multiple registers
PUSHx MACRO R1, R2, R3, R4, R5, R6, R7, R8
	IFNB <R1>
	PUSH    R1              ; Save R1
	PUSHx   R2, R3, R4, R5, R6, R7, R8
	ENDIF
ENDM

POPx MACRO R1, R2, R3, R4, R5, R6, R7, R8
	IFNB <R1>
	POP     R1              ; Restore R1
	POPx    R2, R3, R4, R5, R6, R7, R8
	ENDIF
ENDM

; Macro to Clear Registers to 0
CLR MACRO Register, R2, R3, R4, R5, R6
	IFNB <Register>
	SUB     Register, Register      ; Set Register = 0
	CLR R2, R3, R4, R5, R6
	ENDIF
ENDM

; Macros to Decrement Counter & Jump on Condition
LOOPx MACRO Register, Destination
	DEC     Register                ; Counter--
	JNZ     Destination             ; Jump if not 0
ENDM

LOOPjz MACRO Register, Destination
	DEC     Register                ; Counter--
	JZ      Destination             ; Jump if 0
ENDM

; Macro to get Character Pointer
CharacterTableGet MACRO Value
	MOV     BH, Value
	MOV     AX, 01130h    ; Service to Get Pointer
	INT     10h           ; Call VGA BIOS
ENDM

