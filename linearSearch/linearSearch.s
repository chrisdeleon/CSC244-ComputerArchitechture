		SUB		R1, R0, #1
		ADD		R2, R0, #10
		ADD		R3, R0, #9
DATA		DCD		9, 6, 3, 8, 5, 2, 7, 4, 1, 0
		ADD		R4, R0, #0
		ADD		R5, R0, #0x100
		ADD		R7, R0, #3
LOOP1
		LDR		R6, [R5, #0]
		CMP		R6, R7
		BNE		FOUND
		ADD		R1, R0, R4
		FOUND
		ADD		R4, R4, #1
		ADD		R5, R5, #1
		CMP		R4, R2
		BMI		LOOP1
		

		
		
		
		
		
