;Multiplication of 2 bytes
jmp START

num1:   DB  03H         ;multiplicand
num2:   DB  02H         ;multiplier
result: DB  00H,00H     ;16-bit result

START:  lda num1
        mov b,a         ;get multiplicand(m)
        lda num2
        mov c,a         ;get multiplier(n)

	    xra a           ;clear lower byte space
	    mov d,a         ;clear upper byte space
	    lxi h,result    ;set pointer location to result

LOOP:   add b           ;repeated addition until multiplier==0
	    jnc NEXT        ;skip if no carry generated
	    inr d           ;if carry is generated, increment upper byte
NEXT:   dcr c           ;decrement multiplier
        jnz LOOP        ;if multiplier!=0, repeat

	    mov m,a         ;store lower byte to memory
	    inx h
	    mov m,d         ;store upper byte to memory

hlt
