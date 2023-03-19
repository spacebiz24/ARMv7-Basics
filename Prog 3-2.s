@ Check if positive or negative and store in different locations

.data
	num: .word 0x05555, 0x80000555,0xf0000fff,0x1111,0x9999,0x99999999
	pos: .space 24
	neg: .space 24

.text
.global _start
_start:
	LDR R0,=num
	LDR R1,=pos
	LDR R2,=neg
	MOV R3,#0x6
	
LOOP:	
	LDR R4,[R0],#4
	MOVS R4,R4
	STRPL R4,[R1],#4
	STRMI R4,[R2],#4
	SUBS R3,R3,#1
	BNE LOOP
	
STOP: BAL STOP
.end
