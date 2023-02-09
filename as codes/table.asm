[org 0x0100]
jmp start

;--------------QUESTION NUMBER 1-----------------------------

section .data

prom: db 'ENTER TABLE NUMBER : ',0x0a,0X0D,'$'
prom1: db 'ENTER TABLE LIMIT: ',0x0a,0X0D,'$'
output:db 'OUTPUT TABLE IS AS BELOW: ',0x0a,0x0d,'$'
line:db '--> ',0x0a,0x0d,'$'

new:db 0x0a,'$'
res:db 20,0,1,2,3,4,5,6,7,8,9
resb 20
ans:db 20,0
resb 20

lim:db 20,0
resb 20

multi:db 20,0
resb 20
;-----------------------------------

section .text
clearreg:
	xor ax,ax
	xor bx,bx
	xor cx,cx
	xor dx,dx
ret
gotonew:
	mov dx,new
	call print
ret
clear:
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
getval:
	mov dx,prom
	call print
	mov dx,ans
	mov ah,0x0a
	int 21h
ret
printf:
	;add dh,1
	mov ch,0
	mov cl,2
	mov al, 1    
    mov bh, 0
    mov bl, 07  
    
    add dh, 1 
    mov dl ,1  	
    push cs
    pop es
    mov bp,multi+2
    mov ah,13h      
    int  10h
	mov ah,00h
	int 16h
ret
getlim:
	mov dx,prom1
	call print
	mov dx,lim
	mov ah,0x0a
	int 21h
ret

printtable:
	xor ax,ax
	mov ax,[ans+2]
	sub ax,30h
	push bx
;-------
	mul bl
	mov dl,10
	div dl
	add al,30h
	add ah,30h
	mov [multi+2],al
	mov [multi+3],ah
	call printf
;--------------------
	mov cx,[lim+2]
	sub cx,30h
	pop bx
	cmp bl,cl
	je done
	add bl,1
	jmp printtable
	jmp done
	
	

start:
	call clear
	mov dh,5
	MOV dl,1
	mov bh,0h	   
	mov ah,02h     
	int 10h
	call getval
	call gotonew
	call getlim 
	call gotonew
	mov dh,10
	MOV dl,2
	mov bh,0h	   
	mov ah,02h     
	int 10h
	mov dx,output
	call print
	call clearreg

main:
	mov cx,[lim+2]
	sub cx,30h
	mov bx,0001h
	mov dh,10
	jmp printtable