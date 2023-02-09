org 100h

SECTION .TEXT
jmp start
Section .data
msg1 db 0x0a , 'Enter first characters in range (A-Z): $' 
msg2 db 0x0a , 'Enter second characters in range (A-Z): $'

newline db 0x0a ,'$'

data1 db 27, 0 
resb 27

data2 db 27, 0 
resb 27

ans: db 27, 0
reb 27

Section .code

newlinefunction:
    mov dx , newline 
    mov ah , 9 
    int 21h 
    ret 


printArray:
	mov cx,0;
    mov cl, [data1+1]; calculate message size.
 
    mov al, 1    
    mov bh, 0
    mov bl, 07  ; color the text and background
    
    mov dh, 24         ; Row number 12
    mov dl , 0        ; Column No 20
    push cs
    pop es
    mov bp,  data1+2
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h


    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret


getArray1:
    mov cx, 28 
    mov  dx, data1    ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    ret

getArray2:
    mov cx, 28 
    mov  dx, data2    ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    ret

newarr:
	mov [ans+2], ah
ret

compare:
    
    xor bx , bx 
    xor dx , dx 
    xor ax ,ax 
    xor cx , cx 
    mov si , 2 
    mov di , 2 
    mov cx , 

    tag1:
    mov ah , [data1+si]
    mov bh , [data2+di]
    cmp ah, bh
    je newarr
    mov [data+di] , ah

    add di , 1 
    sub si , 1 
   


    loop tag1
    ret 


start:

    mov dx , msg1
    mov ah , 9 
    int 21h
    call getArray

    mov dx , msg2
    mov ah , 9 
    int 21h
    call getArray2

    call compare
    call printArray

    mov ax, 0x4c00 ; terminate program
    int 0x21