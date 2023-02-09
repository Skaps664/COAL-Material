[org 0x100]

jmp start

section .data
prompt: db "Enter a 5-digit number to check if it is palindrome or not: ",0x0a,0x0d,'$'

yes: db "yes the number u entered is a palindrome: ",0x0a,0x0d,'$'
no: db "no the number u entered is not a palindrome: ",0x0a,0x0d,'$'

array: db 20,0
resb 20

section .code

clear:
	mov ah,07h
	xor al,al
	xor cx,cx
	mov dh,22
	mov dl,79
	mov bh,0x07
	int 10h
ret

print:
	mov ah,09
	int 21h
ret

getnum:
	mov dx,array
	mov ah,0x0a
	int 21h
	
	mov bh,[array+2]
	mov bl,[array+6]
ret

done:
	mov ah,0x01
	int 21h
	mov ax,4c00h
	int 21h
	
yess:
	mov dx,yes
	call print
	jmp done 
ret

noo:
	mov dx,no
	call print 
	jmp done
ret

check1:
	mov bh,[array+3]
	mov bl,[array+5]
	cmp bh,bl
	je yess
	jmp noo
	
start:
	call clear
	
	mov dx,prompt
	call print
	
	call getnum
	cmp bh,bl
	jne noo
	jmp check1

	
	call done

