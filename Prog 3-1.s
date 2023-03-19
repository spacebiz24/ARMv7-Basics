@ Check if the given words are even or odd and store in different locations

.data
	num: .word 0x0055, 0x0020, 0x1234, 0xFFFF
	even: .space 4*4
	odd: .space 4*4

.text
.global _start
_start:
	LDR R0, =num
	LDR R1, =even
	LDR R2, =odd
	MOV R3, #0x4
	
loop:
	LDR R4,[R0],#0x4
	TST R4,#1
	STREQ R4,[R1],#0x4
	STRNE R4, [R2],#0x4
	SUBS R3,R3,#1
	BNE loop

stop:
	BAL stop
.end
