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
	mov bh,07h	; colur where second is back ground and first is forground 
	mov al,0    ; number of lines to scroll down
	mov ch,0	;  where to start(ch = row )
	mov cl,0	;  {cl=coloumn}
	mov dh,23   ; where to end dh= row and dl= coloumn
	mov dl,79
	MOV ah, 07h  ; SCROLL DOWN FUNCTION
	int 0x10
ret

getnum:
	mov dx,array
	mov ah,0x0a
	int 21h
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

sum:
	mov ah,[array+2]
	mov al,[array+3]
	sub ah,30h
	sub al,30h
	add ah,al
	add ah,30h
	mov [ans+2],ah
ret

printarray:
	mov ch,0
	mov cl,[array+1]
	mov al,1
	mov bh,0
	mov bl,70h
	mov dh,12
	mov dl,17
	push cs
	pop es
	mov bp,ans+2
	mov ah,13h
	int 10h
ret
	
start:
	call clear
	
	mov dx,prompt
	call print
	call getnum
	
	call sum
	
	mov dx,answer
	call print
	call printarray
	
	call done
