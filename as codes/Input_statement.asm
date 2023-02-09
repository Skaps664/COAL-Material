[org 0x100]

jmp start

section .data
prompt: db "Enter Two numbers u want to add: ",0x0a,0x0d,'$'

array: db 20,0
resb 20

ans: db 20,0
resb 20

answer: db "The answer is: ",0x0a,0x0d,'$'

section .code

clear:
	clear:
	mov bh,07 	; colur where first is back ground and second is forground 
	mov al,0    ; number of lines to scroll down
	mov ch,0	;  where to start(ch = row )
	mov cl,0	;  {cl=coloumn}
	mov dh,17h   ; where to end dh= row and dl= coloumn
	mov dl,4fh
	MOV ah, 07h  ; SCROLL DOWN FUNCTION
	int 0x10
ret

done:
	mov ax,4c00h
	int 21h
	
print:
	mov ah,09h
	int 21h
ret
	
hold:
	mov ah,00
	int 16h
ret

start:
	call clear
	
	mov dx,prompt
	call print
	
	call done
