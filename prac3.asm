org 100h

mov ah,1	; first input
int 21h
mov bl, al

mov ah, 1	; second input
int 21h
mov cl, al

add bl, cl	; calculations
sub bl, 48	; because of achii values 0 starts from 48

mov dl, bl

mov ah, 2	; to print 
int 21h 

 

mov ah, 4ch
int 21h