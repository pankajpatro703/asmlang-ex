;Factorial of user entered number
.MODEL SMALL
.STACK 100H

.DATA
prompt 	DB 'Enter $'			;prompt message for user
num 	DB 00h				;memory for number
result 	DB 'Factorial is $'		;messgae for displaying result

.CODE
START:  mov ax,@DATA
	mov ds,ax

	mov dx,OFFSET prompt
	mov ah,09h
	int 21h				;display prompt message

	mov ah,01h
	int 21h				;get user input

	sub al,30h			;get number from ascii
	mov num,al			;store number(n)
	mov cx,0001h			;i=1
UP:	cmp num,ch			;check if n==0
	jz STAR
	inc ch
	mov al,ch
	mul cl
	mov cl,al			;i=i+1 if n!=0
	jmp UP				;repeat until n==0
STAR:	add cl,30h
	mov num,cl			;convert back to ascii

	mov ah,02h
	mov dl,0dh
	int 21h
	mov dl,0ah
	int 21h				;print newline

	mov dx,OFFSET result
	mov ah,09h
	int 21h				;print message

	mov ah,02h
	mov dl,num
	int 21h				;display factorial

	mov ah,4ch
	int 21h				;return to dos
END START
END
