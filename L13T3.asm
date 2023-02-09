org 100h

jmp start

Section .data ;--------------------------------------

msg db 'Enter the digits:  $'
num dd 0 , '$'

Section .code ;--------------------------------------

printf:
    push bp;
    mov bp, sp;
    mov dx, [bp+4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp;
ret 2

scanString:
    ; Take Input
  
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+1] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+2] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+3] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+4] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+5] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+6] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+7] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+8] ,al
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov byte[num+9] ,al

    ; print the entered number
    
    mov dx, num 
    mov ah, 9
    int 21h
  

ret 2

start:

mov ax, msg
push ax
call printf
call scanString

mov ah, 4ch             ;; end of program
int 21h