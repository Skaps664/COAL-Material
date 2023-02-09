
[org 0x100]

mov ax,2 ;100
mov bx,3 ;103

call addition ;106
call addition ;109

mov ax,0xFFFF ;10C

mov ax,0x4C00 ;10F
int 0x21 ; 112

addition:
push 3 
add ax,bx
pop ax
ret
