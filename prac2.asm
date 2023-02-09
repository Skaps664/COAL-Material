org 100h



mov ah, 2
mov dl, 49
mov cl, 5

start:
int 21h
inc [dl+1]

mov bl, dl	; as we are changing dl so to store it 

mov dl, 10	; these 4 lines are for next line
int 21h
mov dl, 13
int 21h

mov dl, bl	; give back the original value to dl

loop start


mov ah, 4ch
int 21h