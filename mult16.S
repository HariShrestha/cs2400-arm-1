		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		ADR		R0, numbers
		LDR		R1, [R0]     ;LOW ORDER MULTIPICANT
		LDR		R2, [R0, #4] ; MULTIPYER
		MOV		R5, #0       ;  RESULT
		LSRS		R2, R2, #1   ; RIGHT SHIFT MULTIPLYER INTO CARRY FLAG
		ADR		R6, result
		
		
loop		ADDCS	R5, R5, R1 ;ADD IF CARRY IS SET
		LSL		R1, R1, #1 ; LEFT SHIFT THE MULTIPLICANT BY 1 EACH TIME EVEN IF IT IS 0 MULTIPLYER
		LSRS		R2, R2, #1 ; RIGHT SHIFT MULTIPLYER UNTIL IT BECOMES 0
		BNE		loop
		MOV		R6, R5     ; Store the multiplication result
		
		
DONE
		
numbers	DCD		0b1100101010010001, 0b1111010101000011
result	FILL		4
carry	FILL		4
