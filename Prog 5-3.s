@ Calculate the factorial of a number using a lookup table

.data
	lookup: .word 1,1,2,6,24,120

.text
.global _start
_start:
	MOV R0, #0x3
	LDR R1,=lookup
	MOV R2,[R1,R0,LSL #2]

stop:
	BAL stop
.end
