.data
	num1: .word 0x80000555, 0xFFFFFFFF
	num2: .word 0xFFFFFFFF, 0x80000555
	res: .space 4 * 4

.global _start
_start:
	LDR R7, =num1
	LDR R6, =num2
	LDR R5, [R7]
	LDR R4, [R6]
	UMULL R0, R1, R4, R5
	
	LDR R5, [R7, #0x4]
	LDR R4, [R6, #0x4]
	UMULL R2, R3, R4, R5
	
	LDR R5, [R7, #0x4]
	LDR R4, [R6]
	UMLALS R1, R2, R4, R5
	ADDCS R3, R3, #0x1
	
	LDR R5, [R7]
	LDR R4, [R6, #0x4]
	UMLALS R1, R2, R4, R5
	ADDCS R3, R3, #0x1
	
	LDR SP, =res
	STMEA SP!, {R3-R0}
	
stop:
	BAL stop
.end
