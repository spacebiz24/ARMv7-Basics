@ Clear/ set/ Compliment /Test a bit

.data
	num: .word 0x0055

.text
.global _start
_start:
	LDR R0, =num
	LDR R0,[R0]
	MOV R1,#0x1
	
	BIC R0,R0,R1,LSL #0x2 @ Clearing the 4th bit
	ORR R0,R0,R1,LSL #0x8 @ Setting the 7th bit
	EOR R0,R0,R1,LSL #0x1 @ Complimenting the 2nd bit
	TST R0,#0xA @ Testing if R0 is 0xA
	MOVEQ R2,#0xFF

stop:
	BAL stop
.end
