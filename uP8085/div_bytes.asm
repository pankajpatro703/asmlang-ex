;Division of 2 bytes
jmp START

num1:	DB	41H	;dividend
num2:	DB	1AH	;divisor
result:	DB	00H,00H	;quotient & remainder

START:	lda num2
	mvi c,00H	;clear quotient
	cmp c		;check if division by zero
	jz ERR		;skip calculation if divison by zero

	mov b,a		;get divisor(n)
	lda num1	;get dividend(m)

LOOP:	cmp b		;check if m>n
	jc SKIP		;exit loop if m<n
	sub b		;repeated subtraction(m=m-n)
	inr c		;increment quotient value
	jmp LOOP	;repeat loop

ERR:	mvi a,0FFH	;handle division by zero

SKIP:	lxi h,result	;set pointer location to result
	mov m,c		;store quotient
	inx h
	mov m,a		;store remainder

hlt
