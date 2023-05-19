@ Count the number of 1s and 0s in a word

.data
	num:.word 0xFFFFFFFF

.text
.global _start
_start:
	LDR R0, =num
	LDR R0, [R0]
	MOV R1, #0
	
LOOP:
	LSRS R0,R0,#1
	ADDCS R1,R1,#1
	CMP R0,#0x0
	BNE LOOP
	
	RSB R2,R1,#32
	
stop: BAL stop
.end
