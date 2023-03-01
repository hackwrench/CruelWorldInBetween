.MODEL Medium
.CODE

BG_STACK STRUC
				DW ? ;BP
				DD ? ;Caller
   BG_Bit       DB ?, ?
   BG_Value     DW ?
BG_STACK ENDS

PUBLIC BIT_GET
BIT_GET PROC FAR
	PUSH    BP
	MOV     BP, SP
	MOV     AX, [BP].BG_Value
	MOV     CL, [BP].BG_Bit
	SHR     AX, CL
	AND     AX, 1
	POP     BP
	RET 4
BIT_GET ENDP

M16G_STACK STRUC
				  DW ? ;BP
				  DD ? ;Caller
   M16G_Offset    DW ?
   M16G_Segment   DW ?
M16G_STACK ENDS

PUBLIC MEM16_GET
MEM16_GET PROC FAR
	PUSH    BP
	MOV     BP, SP
	MOV     ES, [BP].M16G_Segment
	MOV     DI, [BP].M16G_Offset
	MOV     AX, WORD PTR ES:[DI]
	POP     BP
	RET 4
MEM16_GET ENDP

PUBLIC MEM8_GET
MEM8_GET PROC FAR
	PUSH    BP
	MOV     BP, SP
	MOV     ES, [BP].M16G_Segment
	MOV     DI, [BP].M16G_Offset
	MOV     AL, BYTE PTR ES:[DI]
	POP     BP
	RET 4
MEM8_GET ENDP

M16S_STACK STRUC
					DW ? ;BP
					DD ? ;Caller
	M16S_Value      DW ?
	M16S_Offset     DW ?
	M16S_Segment    DW ?
M16S_STACK ENDS

PUBLIC MEM16_SET
MEM16_SET PROC FAR
	PUSH    BP
	MOV     BP, SP
	MOV     ES, [BP].M16S_Segment
	MOV     DI, [BP].M16S_Offset
	MOV     AX, [BP].M16S_Value
	MOV     WORD PTR ES:[DI], AX
	POP     BP
	RET 4
MEM16_SET ENDP

M8S_STACK STRUC
				  DW ? ;BP
				  DD ? ;Caller
   M8S_Value      DB ?, ?
   M8S_Offset     DW ?
   M8S_Segment    DW ?
M8S_STACK ENDS

PUBLIC MEM8_SET
MEM8_SET PROC FAR
	PUSH    BP
	MOV     BP, SP
	MOV     ES, [BP].M8S_Segment
	MOV     DI, [BP].M8S_Offset
	MOV     AL, [BP].M8S_Value
	MOV     BYTE PTR ES:[DI], AL
	POP     BP
	RET 4
MEM8_SET ENDP
END
