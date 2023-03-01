TITLE INT9 keyboard handler
;These routines are still non op
.MODEL Medium
.286

PIC_CMD                 EQU     20h
NONSPEC_EOI             EQU     20h

.CODE
PUBLIC  keys
		keys           db      128 dup (0)
PUBLIC  keynumpress
		keynumpress    db      0
PUBLIC  keylast
		keylast        db      0
PUBLIC  oldkeylast
		oldkeylast     db      0

toASCII                 db      0,27,'1234567890-=',14,15
                        db      'qwertyuiop',0,0,13,0,'as'
                        db      'dfghjkl',0,0,'''',0,0,'zxcv'
                        db      'bnm',0,'./',0,0,0,' ',0,1,2,3,4,5
                        db      6,7,8,9,10,0,0,24,25,26,'-',21,22,23,0,18
                        db      19,20,16,17,0,0,0,11,12,0,0,0,0,0,0,0
                        db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                        db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                        db      0,27,'!',0,'#',0,'%',0,0,0,0,0,0,0,14,15
                        db      'QWERTYUIOP',0,0,13,0,'AS'
                        db      'DFGHJKL:',0,'"',0,0,'ZXCV'
                        db      'BNM',0,0,'?',0,0,0,' ',0,1,2,3,4,5
                        db      6,7,8,9,10,0,0,24,25,26,'-',21,22,23,0,18
                        db      19,20,16,17,0,0,0,11,12,0,0,0,0,0,0,0
                        db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                        db      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
e0flag                  db      0
label oldint9 dword
oldint9off              dw      ?
oldint9seg              dw      ?
keyinst                 db      0
keyrepeat               db      256 dup(0)


PUBLIC GetKey
GetKey PROC FAR

; Get next key from KEYBOARD BUFFER
	mov     al,keybuffer[bx]        ; Fetch the ASCII Code
	inc     [keytail]               ; Increment the KeyTail
									; : NOTE that it loops at bl==256
	cmp     al,1Bh          ; Esc
jne     GKDone
	xor     al,al
GKDone:
	mov     [_keylast],al
	pop     bx ax
	ret                     ; Return to caller and all that stuff
GetKey ENDP

PUBLIC  Set_New_Int9
Set_New_Int9 PROC FAR
                cmp     [keyinst],1
                je      exitnew9

                mov     [keyinst],1
                cli
                pusha
                push    ds es
                mov     ax,3509h
                int     21h
                mov     [oldint9off],bx
                mov     [oldint9seg],es
                mov     ax,2509h
                mov     dx,offset New_Int9
                push    cs
                pop     ds
                int     21h
                pop     es ds
                popa
                sti
exitnew9:       ret
Set_New_Int9  ENDP

                        PUBLIC  _Set_Old_Int9
_Set_Old_Int9           PROC    FAR
                cmp     [keyinst],0
                je      exitold9

                mov     [keyinst],0
                cli
                pusha
                push    ds
                mov     dx,[oldint9off]
                mov     ds,[oldint9seg]
                mov     ax,2509h
                int     21h
                pop     ds
                popa
                sti
exitold9:       ret
Set_Old_Int9 ENDP

New_Int9 PROC FAR
                push    ax bx cx ds
                mov     ax,@data
                mov     ds,ax

                in      al,60h
                mov     ah,al

; these 5 lines of code only necessary on XT's
;                in      al,61h
;                or      al,80h
;                out     61h,al
;                and     al,7Fh
;                out     61h,al

;                pushf                          ; this calls the BIOS handler
;                call    [oldint9]

                cmp     ah,0E0h
                jae     e0flagset

                xor     bx,bx
                mov     bl,ah
                and     bl,01111111b
                add     bl,[e0flag]
                mov     [e0flag],0

                rol     ah,1
                jc      keyrelease

keypress:       mov     ah,1
                sub     ah,_keys[bx]            ; old key status
                add     [_keynumpress],ah
                mov     _keys[bx],1             ; key pressed
                mov     bh,_keys[2ah]           ; get left shift status
                or      bh,_keys[36h]           ; get right shift status
                ror     bh,1                    ; put in bit 7
                add     bl,bh                   ; final key value
                xor     bh,bh                   ; clear for index use
                mov     al,toASCII[bx]          ; get translated value

	; Check to see if buffer is FULL
        mov     cx,bx
        xor     bx,bx
        mov     bl,keyhead              ;; Point to the front of the buffer
        inc     bl                      ;; : and if the next space places
        cmp     bl,keytail              ;; : us on the end of the buffer,
        jz      int9_done               ;; : then the buffer is full ...
        dec     bl                      ;; : otherwise, we help fill it.

	;; *********************************************
	;; Put key into KEYBOARD BUFFER (Adding scancode)
	;; *********************************************
        mov     keybuffer[bx],al        ;; Save the ASCII Code into buffer
        inc     bl                      ;; Increment the KeyHead
        mov     keyhead,bl              ;; : NOTE that it loops at bl==256
        mov     bx,cx
        cmp     keyrepeat[bx],2
        je      int9_done
        inc     keyrepeat[bx]
                jmp     int9_done

keyrelease:
                dec     [_keynumpress]
                mov     _keys[bx],0             ; key released
                mov     keyrepeat[bx],0
                jmp     int9_done

e0flagset:      mov     [e0flag],128
int9_done:      mov     al,NONSPEC_EOI
                out     PIC_CMD,al
                pop     ds cx bx ax
                iret
New_Int9 ENDP
END
