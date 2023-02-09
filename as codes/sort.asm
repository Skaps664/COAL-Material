[org 0x0100]
;-------------- THIS IS Q2 PART 2----------------------
jmp biginning

section .data

msg: db 'Enter 10 integers: ',0X0D,0X0A,'$'
result: db 'The Sorted form is: ',0x0d,0x0a,'$'

answer: db 20,0
resb 20

sort: db 20,0
resb 20

section .text

Blackscreen:
	mov ah,07h
	xor al,al
	xor cx,cx
	mov dh,23
	mov dl,79
	mov bh,07h
	int 10h
ret
print:
	mov ah,09
	int 21h
ret
done:
	mov ax,4c00h
	int 21h

getanswer:
	mov dx,answer
	mov ah,0x0a
	int 21h
ret	
biginning:
	call Blackscreen
	mov dh,5
	mov dl,1
	mov bh,0
	mov ah,02h
	int 10h
	mov dx,msg
	call print
	call getanswer
	
;;---------------FOR SORTING-------------
	mov ah,[answer+2]
	mov [sort+2],ah
	mov ah,[answer+3]
	mov [sort+3],ah
	mov ah,[answer+4]
	mov [sort+4],ah
	mov ah,[answer+5]
	mov [sort+5],ah
	mov ah,[answer+6]
	mov [sort+6],ah
	mov ah,[answer+7]
	mov [sort+7],ah
	mov ah,[answer+8]
	mov [sort+8],ah
	mov ah,[answer+9]
	mov [sort+9],ah
	mov ah,[answer+10]
	mov [sort+10],ah
	mov ah,[answer+11]
	mov [sort+11],ah
	mov ah,[answer+12]
	mov [sort+12],ah

	
	mov cx,10
	jmp main

exchange:
	xchg ah,al
	mov [sort+bx],ah
	mov [sort+bx+1],al
noneed:
	add bx,1
	cmp bx,11
	jne sorting
ret
	
sorting:
	mov ah,[sort+bx]
	mov al,[sort+bx+1]
	cmp ah,al
	jl exchange
	jg noneed
ret	
main:
	sub cx,1
	mov bx,2
	call sorting
	cmp cx,0
	jne main
;Print the string over here-----
	
	mov dh,7
	mov dl,1
	mov bh,0
	mov ah,02h
	int 10h
	mov dx,result
	call print
	mov ah,00h
	int 16h
	mov ch,0
	mov cl,[answer+1]
	mov al, 1    
    mov bh, 0
    mov bl, 07  
    mov dh, 8      
    mov dl ,1   	
	;CHANGE METHOD
    push cs
    pop es
    mov bp,sort+2
    mov ah,13h      
    int  10h
	jmp done