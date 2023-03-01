NONE      equ 0
MDA       equ 1
CGA       equ 2
EGAMono   equ 5
EGAColor  equ 4
VGAMono   equ 7
VGAColor  equ 8
MCGAMono  equ 11 
MCGAColor equ 12


; GRAPHICSCARDDETECT();
; PC Graphics detection routine. Returns graphics card type

PUBLIC GRAPHICSCARDDETECT
GRAPHICSCARDDETECT PROC FAR
    push    bp                  ; Preserve caller's stack frame
    mov  bp,sp
    mov  ax,1A00h            ; Try calling VGA Identity Adapter function
    int  10h
    cmp  al,1Ah              ; Do we have PS/2/vga video bios ?
jne  @@notPS2               ; No!

    
    xor  ah,ah
    mov  al, bL
jmp  short @@GCdone        ; return ax
@@isCGA:
    mov  ax,CGA              ; Have detected CGA, return id
jmp  short @@GCdone
@@notPS2:                       ; OK We don't have PS/2 Video bios
    mov  ah,12h              ; Set alternate function service
    mov  bx,10h              ; Set to return EGA information
    int  10h                 ; call video service
    cmp  bx,10h              ; Is EGA there ?
je   @@simpleadapter    ; Nop!
    mov  ah,12h              ; Since we have EGA bios, get details
    mov  bl,10h
    int  10h
    or   bh,bh               ; Do we have color EGA ?
jz   @@egacolor         ; Yes
    mov  ax,EGAMono          ; Otherwise we have Mono EGA
jmp  short @@GCdone

@@egacolor:
    mov  ax,EGAColor         ; Have detected EGA Color, return id
jmp  short @@GCdone

@@simpleadapter:
    int  11h                 ; Lets try equipment determination service
    and  al,30h
    shr  al,4
    xor  ah,ah
    or   al,al               ; Do we have any graphics card at all ?
jz   @@GCdone              ; No ? This is a stupid machine!
    cmp  al,3                ; Do We have a Mono adapter
jne  @@isCGA            ; No
    mov  ax,MDA              ; Have detected MDA, return id
@@GCdone:
    pop  bp                  ;restore caller's stack frame
    ret
GRAPHICSCARDDETECT ENDP
