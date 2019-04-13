		;		ARM Programming Assignment #1: 32 bit multiplier
		;
		;		Write a 32-bit multiplier.
		;		Use the standard shift-and-add operation.
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		ADR		R0, numbers
		LDR		R1, [R0]     ;LOW ORDER MULTIPICANT
		MOV		R3, #0       ;hIGH ORDER MULTIPICANT
		LDR		R2, [R0, #4] ; MULTIPYER
		MOV		R5, #0       ; LOW ORDER RESULT
		MOV		R6, #1       ; HIGH ORDER RESULT
		ADR		R10, result
		
		
loop		TST		R2, #1    ; IS MULTIPLYER 1
		ADDSNE	R5,R5,R1  ; ADD AND SET CARRY FLAG IF R2 IS 1
		TST		R2, #1    ; Previously add may change the flag
		ADCNE	R6, R6, R3 ; add carry flag if multiplyer is 1
		LSLS		R1, R1, #1 ; shift low of the multiplicant
		LSL		R3, R3, #1 ; make room for the carry bit in high order multiplicant
		ADC		R3, R3, #0 ; add carry bit to the high order of multiplicant
		LSRS		R2, R2, #1 ; shift multiplier to the right
		BNE		loop
		MOV		R10, R5
		
Done
		
		
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA
result	FILL		8
carry	FILL		4
