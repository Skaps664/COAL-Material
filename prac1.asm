org 100h



takeInput:	; to take char input from user
mov ah, 1  	; interupt serice routine
int 21h 	; interupt

printOut:	; to print the char that was input
mov dl, al	; what was input is stored in al and always dl is printed
mov ah, 2	; ISR to print the output
int 21h

printASCHII:
mov dl, 65	; aschii value of 65=A
mov ah, 2
int 21h
mov dl, 97	; aschii avlue of 97=a
int 21h
 


mov ax, 0x4c00
int 0x21