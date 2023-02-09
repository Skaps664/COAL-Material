org 100h

jmp start


msg1 db "Enter first word:  ", 0x0d, 0x0a, '$'
msg2 db "Enter second word: ", 0x0d, 0x0a, '$'
msg3 db "Enter third word: ", 0x0d, 0x0a, '$'

inpo1: db 15, 0
resb 15

inpo2: db 15, 0
resb 15

inpo3: db 15, 0
resb 15

data1: db 'I'
msg1end:

data2: db 'Love'
msg2end:

data3: db 'Pakistan'
msg3end:


section.code

RightBox1:

    MOV AH, 06h    ; Scroll down function
    XOR AL, AL    

    mov ch, 2      ; Upper left corner CH=row
    mov cl, 2 ; Upper left corner CL=column
    mov dh, 11 ; lower right corner DH=row
    MOV dl, 28  ; lower right corner DL=column 
    MOV BH, 60h    ; COLOR
    INT 10H         
ret

RightBox2:

    MOV AH, 06h    ; Scroll down function
    XOR AL, AL    

    mov ch, 15      ; Upper left corner CH=row
    mov cl, 2 ; Upper left corner CL=column
    mov dh, 24 ; lower right corner DH=row
    MOV dl, 28  ; lower right corner DL=column 
    MOV BH, 60h    ; COLOR
    INT 10H         
ret

MiddleBox:

    MOV AH, 06h    ; Scroll down function
    XOR AL, AL    

    mov ch, 7      ; Upper left corner CH=row
    mov cl, 29 ; Upper left corner CL=column
    mov dh, 19 ; lower right corner DH=row
    MOV dl, 53  ; lower right corner DL=column 
    MOV BH, 60h    ; COLOR
    INT 10H         
ret

LeftBox1:

    MOV AH, 06h    ; Scroll down function
    XOR AL, AL    

    mov ch, 2      ; Upper left corner CH=row
    mov cl, 53 ; Upper left corner CL=column
    mov dh, 11 ; lower right corner DH=row
    MOV dl, 78  ; lower right corner DL=column 
    MOV BH, 60h    ; COLOR
    INT 10H         
ret

LeftBox2:

    MOV AH, 06h    ; Scroll down function
    XOR AL, AL    

    mov ch, 15      ; Upper left corner CH=row
    mov cl, 53 ; Upper left corner CL=column
    mov dh, 24 ; lower right corner DH=row
    MOV dl, 78  ; lower right corner DL=column 
    MOV BH, 60h    ; COLOR
    INT 10H         
ret

printinpo1:
	mov cx,0
    	mov cl, [inpo1+1]; calculate message size.
    
   	mov al, 1    
 	mov bh, 0
  	mov bl, 07  ; color the text and background
  	  
    	mov dh, 19        ; Row number 12
    	mov dl , 12        ; Column No 20
    	push cs
    	pop es
    	mov bp,  inpo1+2
    	mov ah , 13h      ; To print string on screen we use 13h function
    	int  10h
        
ret
printinpo2:
	mov cx,0
    	mov cl, [inpo2+1]; calculate message size.
    
   	mov al, 1    
 	mov bh, 0
  	mov bl, 07  ; color the text and background
  	  
    	mov dh, 13        ; Row number 12
    	mov dl , 38       ; Column No 20
    	push cs
    	pop es
    	mov bp,  inpo2+2
    	mov ah , 13h      ; To print string on screen we use 13h function
    	int  10h
        
ret
printinpo3:
	mov cx,0
    	mov cl, [inpo3+1]; calculate message size.
    
   	mov al, 1    
 	mov bh, 0
  	mov bl, 07  ; color the text and background
  	  
    	mov dh, 5       ; Row number 12
    	mov dl , 62       ; Column No 20
    	push cs
    	pop es
    	mov bp,  inpo3+2
    	mov ah , 13h      ; To print string on screen we use 13h function
    	int  10h
        
ret

get1:
	mov cx, 15
	mov dx, inpo1
	mov ah, 0x0a
	int 21h
ret
get2:
	mov cx, 15
	mov dx, inpo2
	mov ah, 0x0a
	int 21h
ret
get3:
	mov cx, 15
	mov dx, inpo3
	mov ah, 0x0a
	int 21h
ret


start:
	
	
	mov dx, msg1
	mov ah, 09
	int 21h
	call get1
	mov dx, msg2
	mov ah, 09
	int 21h
	call get2
	mov dx, msg3
	mov ah, 09
	int 21h
	call get3
	
	call RightBox1
	call RightBox2
	call MiddleBox
	call LeftBox1
	call LeftBox2
	
	call printinpo3
	call printinpo2
	call printinpo1


mov ax, 0x4c00
int 0x21