@ Calculate the factorial of a number

.data
	num: .word #0x4
	fact: .word

.text
.global _start
_start:
	LDR R0, =num
	LDR R0,[R0]
	LDR R1, =fact
	MOV R2, R0
	
loop:
	SUBS R0,R0,#1
	MULNE R2,R2,R0
	BNE loop
	
	STR R2,[R1]
	
stop:
	BAL stop
.end
