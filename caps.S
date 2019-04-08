		;		ARM Programming Assignment #1: Capitalizer
		;
		;		Write a program that goes through the characters in chars,
		;		and Capitalizes every lower-case letter that it finds..
		;		Write the number of capitalizations the program performed
		;		In the caps "fill" memory provided.
		
		;		Your code here
		ADR		R1, chars   ; Adding data into register
		ADR		R2, caps    ; Adding memory address to register R2
		MOV		R8, #11     ; Length of array
		ADR		R3, upper
		ADR		R4, lower
		sub		R5, R4, R3
		MOV		R9, #0
		ADR		R6, last
		
loop
		LDR		R3, [R1]
		CMP		R3, R6
		SUBGT	R3, R3, R5 ; if R3>R6 , R3 = R3 -R5
		ADDGT	R9, R9, #1 ; if R3>R6, R9 = R9 + 1
		STR		R3,[R1], #8
		SUBS		R8, R8, #1
		
		BNE		loop
		MOV		R2, R9
		
		
		END
		
		
		
		
		
		
		
chars	DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
caps		FILL		4
upper	DCD		'A'
lower	DCD		'a'
last		DCD		'Z'
