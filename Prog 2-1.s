@ Add 2 words of data

.data
	num1: .word 0x80000555, 0xFFFFFFFF
	num2: .word 0xFFFFFFFF, 0x80000555
	res: .space 4*2, 1 @ 4 -> bytes, minimum -> 1 byte

.text
.global _start
_start:
	LDR R0,=num1
	LDR R1,=num2
	LDR R2,=res
	LDR R3,[R0],#0x4
	LDR R4,[R1],#0x4
	MOV R7,#1
	
	ADDS R5,R3,R4
	LDR R3,[R0]
	LDR R4,[R1]
	ADCS R6,R3,R4
	STMEA R2!,{R5,R6}
	STRCS R7,[R2]
	
stop:
	BAL stop
.end
