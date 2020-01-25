;Ascending order
.MODEL SMALL
.STACK 100

.DATA
array DB 43H, 12H, 07H, 36H, 11H
arrsize DB 05H

.CODE
start:  MOV AX,@DATA
        MOV DS,AX
        MOV CH,arrsize
        DEC CH
up:     LEA SI,array
        MOV CL,CH
loopit: MOV AL,[SI]
        CMP AL,[SI+1]
        JC star
        MOV BL,[SI+1]
        MOV [SI],BL
        MOV [SI+1],AL
star:   INC SI
        DEC CL
        JNZ loopit
        DEC CH
        JNZ up
        MOV AH,4CH
        INT 21H
        END START
        END
