.MODEL SMALL
.STACK 100
.DATA
prompt1 DB "Enter size: $"
prompt2 DB "Enter string: $"
m1 DB "Not palindrome$"
m2 DB "Palindrome$"
array DB ?
.CODE
START: MOV AX,@DATA
MOV DS,AX

MOV AH,09H
MOV DX,OFFSET prompt1
INT 21H

MOV AH,01H
INT 21H
SUB AL,30H
INC AL		
MOV CL,AL

mov ah,02h
mov dl,0dh
int 21h
mov dl,0ah
int 21h

MOV AH,09H
MOV DX,OFFSET prompt2
INT 21H

MOV BYTE PTR array,CL
MOV AH,0AH
MOV DX,OFFSET array
INT 21H

mov ah,02h
mov dl,0dh
int 21h
mov dl,0ah
int 21h

MOV CH,00H
MOV DI,CX
MOV SI,0002H

up: MOV AL,array[SI]
MOV AH,array[DI]
CMP SI,DI
JNS outit
INC SI
DEC DI
CMP AL,AH
JZ up

MOV AH,09H
MOV DX,OFFSET m1
INT 21H

JMP next

outit: MOV AH,09H
MOV DX,OFFSET m2
INT 21H

next: MOV AH,4CH
INT 21H
END START
END
