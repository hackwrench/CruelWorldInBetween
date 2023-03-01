; DMA_CODE.ASM

.MODEL Medium

Status          EQU     08h     ;DMAC status port (read)     \  same port
Command         EQU     08h     ;DMAC command port (write)   /  (read/write)
Request         EQU     09h     ;DMAC channel request (write-only)
DMA_Mask        EQU     0Ah     ;DMAC DMA_Mask (write-only)
Mode            EQU     0Bh     ;DMAC mode (write)
byte_ptr        EQU     0Ch     ;byte pointer flip-flop

addr            EQU  000h  ; per-channel base address
count           EQU  001h  ; per-channel byte count

IFDEF NON_AUTOINIT
read_cmd        EQU     048h    ; read mode
write_cmd       EQU     044h    ; write mode
ELSE
read_cmd        EQU     058h    ; autoinitializing read
write_cmd       EQU     054h    ; auto write
ENDIF

set_cmd         EQU     000h    ; DMA_Mask set (enable dma)
reset_cmd       EQU     004h    ; DMA_Mask reset (disable)

.DATA
; dma controller page register table
; this table maps from channel number to the i/o port number of the
; page register for that channel

page_table  DW  00087h  ; channel 0
            DW  00083h  ; channel 1
            DW  00081h  ; channel 2
            DW  00082h  ; channel 3
			DW  0FFFFh  ; CH 4 (not used)
			DW  0008Bh  ; CH 5
			DW  00089h  ; CH 6
			DW  0008Ah  ; CH 7

dmac2        DB 0    ; Flag set to non-zero when using the 2nd DMA controller


.CODE
INCLUDE MACROS.ASM
MACRO adjust reg          ; Adjust register port for 2nd DMA cont
local no_adjust
	CMP [DMAc2], 0
	JZ no_adjust
	shl reg,1
	add reg,0C0h
no_adjust:
ENDM adjust




;DMA_SETUP%(Channel%, Segment%, Offset%, Length%, Dir%)
;Channel = 0-7
;Buffer  = Address of data to transfer
; Length  = Length of data to transfer
; Dir     = Direction to move bytes.  1 == Out to the BUS (TO the card)
;                                     0 == In from the BUS and cards.
;Returns: 0 if no errors (DMA_errno == 0)
;         error number if error occurs
DS_STRUC


PUBLIC DMA_SETUP
DMA_SETUP PROC FAR
;ARG Channel:WORD,Buffer:DWORD,Len:WORD,Dir:WORD
	PUSH BP
	MOV  BP,SP

;Convert seg:ofs Buffer to 20-bit physical address
;Assumes operating in 8086/real-Mode
	MOV  BX,[WORD PTR Buffer]
	MOV  AX,[WORD PTR Buffer+2]
	MOV  CL,4
	ROL  AX,CL
	MOV  CH,al
	and  al,0F0h
	add  AX,BX
	adc  CH,0
	and  CH,0Fh
	MOV  di,AX
; (CH << 16) + di == The physical buffer base.

; Check channel number range
	MOV  [DMAc2],0
	MOV  BX,[Channel]
	CMP  BX,7
jbe  @@Set_base
	MOV  [DMA_errno],0Ch
	MOV  AX,-1
jmp  @@ExitPt
@@Set_base:
	CMP  BX,4
	jb   @@OkChannel
	sub  BX,4
	inc  [DMAc2]
@@OkChannel: ; BX contains the adjusted channel number

;Determine which command byte will be written later
	CMP  [WORD PTR Dir],0
jnz  SHORT @@Do_Read
	MOV  al,write_cmd
jmp  short @@Do_Mode
@@Do_Read:
	MOV  al,read_cmd
@@Do_Mode:
	add     al, bl
	CLR     ah
	MOV     si, AX
	MOV     AX, set_cmd    ;allow DMA requests
	add     al, bl
	MOV     CL, al
;si contains READ/WRITE command for DMA controller
;CL contains confirmation command for DMA controller
		shl  BX,1
;BX == Port # Channel*2

; Calculations have been done ahead of time to minimize time with
; interrupts disabled.
; CH:di == physical base address (must be on word boundary for 16 bits)
; CL == Confirmation command    (Unmasks the channel)
; BX == I/O port Channel*2      (This is where the address is written)
; si == Mode command for DMA
		MOV  AX,di              ;Let's check the address to see if we
		add  AX,[Len]           ;span a page boundary with our length
        jnc  @@BoundaryOk       ;Do we?
		MOV  AX,2     ; y: Error #2
jmp  @@ExitPt           ;    See ya...
@@BoundaryOk:                   ; n: Continue with action
; Now we shift the address and word count right one bit if in 16 bit mode.
	CMP  [DMAc2],0
JZ   @@AddrOk
	shr  CH,1
	rcr  di,1
	shl  CH,1
jc   @@BadAddr
	rcr  [Len],1            ;Odd byte lengths are rounded down
	jmp  @@AddrOk
@@BadAddr:
	MOV  AX, 13    ;Word-alignment error
jmp  @@ExitPt

@@AddrOk:
	CLI                     ;Disable interrupts while mucking with DMA

;The "byte pointer" is also known as the LSB/MSB flip flop.
;By writing any value to it, the DMA controller registers are prepared
;to accept the address and length values LSB first.
	MOV  dx,byte_ptr        ;Reset byte pointer Flip/flop
	adjust dx
	out  dx,al              ;All we have to do is write to it
	MOV  AX,di              ;AX=LSW of 20-bit address
	MOV  dx,BX              ;dx=DMAC Base Address port
	adjust dx
	out  dx,al              ;Store LSB
	MOV  al,ah
	out  dx,al              ;Store next byte

;Write length to port (Channel*2 + 1)
	MOV  AX,[Len]
	MOV  dx,BX
	inc  dx                 ;dx=DMAC Count port
	adjust dx
	out  dx,al              ;Write LSB of Length
	MOV  al,ah
	out  dx,al              ;Write MSB

	MOV  BX,[Channel]
	shl  BX,1
	MOV  dx,[BX + OFFSET page_table]  ;dx=page register port
	MOV  al,CH              ;al=Page number
	out  dx,al              ;Store the page

	MOV  dx,Mode            ;dx=DMAC mode register
	adjust dx
	MOV  AX,si              ;Load pre-calculated mode
	out  dx,al              ;Write it to the DSP

IFNDEF NO_START
	MOV  dx,DMA_Mask        ;dx=DMAX DMA_Mask register
	adjust dx
	MOV  al,CL              ;al=pre-calulated DMA_Mask value
	out  dx,al              ;Write DMA_Mask (allow DMA on this channel)
ENDIF
	MOV  AX,0               ;Return with no error

@@ExitPt:                       ;Restore stack and return
		pop  BP
        ret
DMA_SETUP ENDP

;+---------------------------------------------------------------------------+
;| int prevent_DMA(int Channel)                                              |
;| ------------------------------------------------------------------------- |
;| Channel = 0-7                                                             |
;|         Prevents DMA requests from Channel by masking bit in DMA_C.       |
;| ------------------------------------------------------------------------- |
;| Returns 0 if Ok, -1 and sets DMA_errno on error                           |
;+---------------------------------------------------------------------------+
PUBLIC PREVENT_DMA
PREVENT_DMA PROC FAR
;ARG Channel:Word
  PUSH BP
		MOV  BP,SP
		MOV  AX, reset_cmd      ; Disable DMA requests
Send_AX_mask:                   ; Jump here from _allow_DMA
		PUSH dx
		MOV  [DMA_errno],0
; Check channel number range
		MOV  [DMAc2],0
		MOV  BX,[Channel]
		CMP  BX,7
        jbe  @@Set_base
		MOV  [DMA_errno],0Ch
		MOV  AX,-1
        jmp  @@Exit_Pt
@@Set_base:
		CMP  BX,4
        jb   @@OkChannel
		sub  BX,4
		inc  [DMAc2]
@@OkChannel:
		MOV  dx,DMA_Mask
        adjust dx
		add  AX,BX        ; Add the adjusted channel number
        out  dx,al
		MOV  AX,0
@@Exit_Pt:
        pop  dx
		pop  BP
        ret
PREVENT_DMA ENDP

;| ALLOW_DMA(int Channel)                                                |
;| ------------------------------------------------------------------------- |
;| Channel = 0-7                                                             |
;|         Unmasks DMA on the specified channel.                             |
;| ------------------------------------------------------------------------- |
;| Returns 0 if Ok, -1 and sets DMA_errno on error                           |
;+---------------------------------------------------------------------------+
PUBLIC ALLOW_DMA
ALLOW_DMA PROC
;ARG Channel:Word
	PUSH BP
	MOV  BP,SP
	MOV  AX,set_cmd
JMP Send_AX_mask
ALLOW_DMA ENDP

;+---------------------------------------------------------------------------+
;| int DMA_count(Channel)                                                    |
;| ------------------------------------------------------------------------- |
;| Channel = 0-7                                                             |
;| ------------------------------------------------------------------------- |
;| Returns: -1 if DMA transaction completed                                  |
;|         (It returns the number of bytes/words left to transfer)           |
;| DMA_errno == 0 if no error, otherwise equals error number                 |
;+---------------------------------------------------------------------------+
PUBLIC DMA_COUNT
DMA_COUNT PROC FAR
;ARG Channel:Word
  PUSH BP
		MOV  BP,SP
		PUSHf
		PUSH dx
; Check channel number range
		MOV  [DMAc2],0
		MOV  BX,[Channel]
		CMP  BX,7
        jbe  @@Set_base
		MOV  [DMA_errno],0Ch
		MOV  AX,-1
        jmp  @@Exit_Pt
@@Set_base:
		CMP  BX,4
        jb   @@OkChannel
		sub  BX,4
		inc  [DMAc2]
@@OkChannel:
		MOV  dx,BX
        shl  dx,1
        add  dx,count
        adjust dx
        cli
        in   al,dx
		MOV  ah,al
        in   al,dx
        xchg al,ah
@@Exit_Pt:
        pop  dx
        popf     ; re-enables interrupts
		pop  BP
        ret
DMA_COUNT ENDP

;+---------------------------------------------------------------------------+
;| unsigned DMA_addr(Channel)                                                |
;| ------------------------------------------------------------------------- |
;| Channel = 0-7                                                             |
;| ------------------------------------------------------------------------- |
;| Returns: Current address word of that channel                             |
;| Value must be multiplied by 2 for a 16-bit channel.                       |
;| It is best to start at offset 0, ie on a 64K boundary                     |
;| DMA_errno == 0 if no error, otherwise equals error number                 |
;+---------------------------------------------------------------------------+
PUBLIC DMA_ADDR
DMA_ADDR PROC FAR
;ARG Channel:Word
  PUSH BP
		MOV  BP,SP
		PUSHf
		PUSH dx
; Check channel number range
		MOV  [DMAc2],0
		MOV  BX,[Channel]
		CMP  BX,7
        jbe  @@Set_base
		MOV  [DMA_errno],0Ch
		MOV  AX,-1
        jmp  @@Exit_Pt
@@Set_base:
		CMP  BX,4
        jb   @@OkChannel
		sub  BX,4
		inc  [DMAc2]
@@OkChannel:
		MOV  dx,BX
        shl  dx,1
        adjust dx
        cli
        in   al,dx
		MOV  ah,al
        in   al,dx
        xchg al,ah
@@Exit_Pt:
        pop  dx
        popf
		pop  BP
        ret
DMA_ADDR ENDP
END
