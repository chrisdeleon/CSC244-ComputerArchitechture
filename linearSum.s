		SUB		R1, R0, #1
		ADD		R2, R0, #10
		ADD		R3, R0, #9
DATA		DCD		9, 6, 3, 8, 5, 2, 7, 4, 1, 0
		ADD		R4, R0, #0
		ADD		R5, R0, #0x100
LOOP1
		LDR		R6, [R5, #0]
		ADD		R7, R7, R6
		ADD		R4, R4, #1
		ADD		R5, R5, #4
		CMP		R4, R2
		BMI		LOOP1
		
