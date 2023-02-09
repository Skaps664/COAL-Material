[org 0x100]

jmp start

section .data
promt: db "Enter a 3-digit number to check if it is palindrome or not: ",0x0a,0x0d,'$'

yes: db "yes the number u entered is a palindrome: ",0x0a,0x0d,'$'
no: db "no the number u entered is not a palindrome: ",0x0a,0x0d,'$'

array: 20,0
resb 20

section .code

clear:
	mov bh,07	; colur where second is back ground and first is forground 
	mov al,0    ; number of lines to scroll down
	mov ch,0	;  where to start(ch = row )
	mov cl,0	;  {cl=coloumn}
	mov dh,23   ; where to end dh= row and dl= coloumn
	mov dl,79
	MOV ah, 07h  ; SCROLL DOWN FUNCTION
	int 0x10
ret

check:
	al,[array+2]
	ah,[array+4]
	cmp al,ah
	je yess
	jne noo
ret
	
yess:
	mov dx,yes
	mov ah,0x0a
	int 21h
ret

noo:
	mov dx,no
	mov ah,0x0a
	int 21h
ret
start:
	call clear
	call check

