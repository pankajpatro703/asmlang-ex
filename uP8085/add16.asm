;Addition of 2 16-bit numbers
jmp START

num1:	DB	00H,03H		;1st 16-bit number
num2:	DB	05H,06H		;2nd 16-bit number
result:	DB	00H,00H,00H	;16-bit result

START:	xra a
	lhld num1		;get number 1
	xchg
	lhld num2		;get number 2
	dad d			;add the numbers
	jnc NEXT		;skip if no carry is generated
	inr a			;increment if carry is generated

NEXT:	shld result		;store lower 16-bit result
	sta result+2		;store carry if generated

hlt
