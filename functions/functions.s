MAIN
DATA		DCD		9, 6, 3, 8, 5, 2, 7, 4, 1, 0
		ADD		R1, R0, #0
		ADD		R2, R0, #3 ; target = 3
		STR		R2, [SP] ; store R2 in stack
		STR		R1, [SP] ; store R1 in stack
		BL		SORT ; call sort function
		LDR		R3, [SP] ; load R3 from the stack
		BL		SEARCH  ; call search function
		ADD		SP, SP, #4
		ADD		SP, SP, #4
		;		end main
		
SORT
		AND		R0, R0, #0
		LDR		R12, [SP] ; load R12 from the stack
		ADD		R1, R0, #10
		ADD		R2, R0, #9
		ADD		R3, R0, #0
SORTLOOP1
		ADD		R4, R0, #0
		ADD		R5, R12, #0
SORTLOOP2
		LDR		R6, [R5, #0]
		LDR		R7, [R5, #4]
		;		start of if-statement
		CMP		R6, R7
		BGE		SORTELSE
		STR		R7, [R5, #0]
		STR		R6, [R5, #4]
SORTELSE
		ADD		R4, R4, #1
		ADD		R5, R5, #4
		;		inner-while check
		CMP		R4, R2
		BLT		SORTLOOP2
		ADD		R3, R3, #1
		;		outer-while check
		CMP		R3, R1
		BLT		SORTLOOP1
		MOV		PC, LR
		
		;		end sort
		
		
SEARCH
		SUB		R1, R0, #1
		LDR		R2, [SP, #4] ; load R2 from stack
		LDR		R3, [SP, #8] ; load R3 from stack
		ADD		R5, R0, #0
		ADD		R6, R0, #9
LOOP1
		ADD		R7, R5, R6
		ASR		R7, R7, #1
		LSL		R8, R7, #2
		ADD		R8, R8, R3
		ADD		R4, R8, #0x100
		CMP		R2, R4
		BNE		ELSE ;  if comparison above is not equal then branch to elsewhere
		ADD		R1, R0, R7
		ADD		R2, R0, #0
ELSE
		CMP		R2, R4
		BGE		ELSE2 ; if R2 is greater than R4 branch to elsewhere
		ADD		R5, R7, #1
ELSE2
		SUB		R6, R7, #1
		SUB		SP, SP, #4
		STR		R1, [SP] ; store R1 on the stack
		CMP		R6, R5
		BLT		LOOP1
		MOV		PC, LR
