.MODEL Medium
.286

.CODE

P16I_Stack STRUC
				 DD  ?   ; Caller
	P16I_Value   DW  ?   ; Address of Text$ Descriptor
P16I_Stack ENDS

PUBLIC PORT16_IN
PORT16_IN PROC FAR
	MOV BX, SP
	MOV DX, [BX].P16I_Value
	IN      AX, DX
	RET     2
PORT16_IN ENDP

P8I_Stack STRUC
				 DD  ?   ; Caller
	P8I_Value    DW  ?   ; Address of Text$ Descriptor
P8I_Stack ENDS

PUBLIC PORT8_IN
PORT8_IN PROC FAR
	MOV BX, SP
	MOV DX, [BX].P8I_Value
	SUB     AX, AX
	IN      AL, DX
	RET     2
PORT8_IN ENDP

P16O_Stack STRUC
				 DD  ?  ; Caller
	P16O_Output  DW  ?  ; Value to be placed in port
	P16O_Value   DW  ?  ; port Address
P16O_Stack ENDS

PUBLIC PORT16_OUT
PORT16_OUT PROC FAR
	MOV BX, SP
	MOV DX, [BX].P16O_Value
	MOV AX, [BX].P16O_Output
	OUT      DX, AX
	RET     4
PORT16_OUT ENDP

P8O_Stack STRUC
				 DD  ?   ; Caller
	P8O_Output   DW  ?  ; Value to be placed in port
	P8O_Value    DW  ?   ; port Address
P8O_Stack ENDS

PUBLIC PORT8_OUT
PORT8_OUT PROC FAR
	MOV BX, SP
	MOV DX, [BX].P8O_Value
	MOV AX, [BX].P8O_Output
	OUT      DX, AL
	RET     4
PORT8_OUT ENDP
END
