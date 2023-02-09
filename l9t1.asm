[org 0x0100]
jmp start
Section .data
msg db 'Enter a 3 digit number: $'
msg1 db 'Not Palindrome $'
msg2 db 'Palindrome $'


num dd 0 , '$'
num1 dd 0 , '$'

Section .code
printf:
    push bp;
    mov bp, sp;
    mov dx , [bp+ 4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp;

ret 2

scanchr:
    ;take input
    mov ah, 7
    int 21h; input character will be stored in al
    mov [num] , al
    ;print the entered character
    mov dx, num
    mov ah, 9
    int 21h
ret 2


function1:
    mov dx, msg1
    mov ah, 9
    int 21h 
    jmp end

function2:
    mov dx, msg2
    mov ah, 9
    int 21h 
    jmp end
scanString:
mov ah, 7
int 21h
mov byte[num], al;; input character wil be stored in al
mov byte[num1 + 2] , al
mov ah, 7
int 21h
mov byte[num+1], al; input character wil be stored in al
mov byte[num1 + 1] , al
mov ah, 7
int 21h
mov byte[num+2], al
mov byte[num1] , al
mov ah, 7
int 21h; input character wil be stored in al
;print the entered number
mov dx, num
mov ah, 9
int 21h
mov dx , num1 
mov ah , 9 
int 21h
xor dx , dx 
mov dx , [num] 
cmp dx , [num1] 
jne function1
jmp function2
end:

ret 2

start:

    mov ax, msg
    push ax
    call printf
    call scanString
    mov ah, 4ch
    int 21h