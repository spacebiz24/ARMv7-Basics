@ Moving 32 32-bit words from source to destination

.data
	src:.word 0x11111111, 0x22222222, 0x33333333, 0x44444444
        .word 0x55555555, 0x66666666, 0x77777777, 0x88888888
        .word 0x99999999, 0xAAAAAAAA, 0xBBBBBBBB, 0xCCCCCCCC
        .word 0xDDDDDDDD, 0xEEEEEEEE, 0xFFFFFFFF, 0x00000000
        .word 0x01234567, 0x89ABCDEF, 0xFEDCBA98, 0x76543210
        .word 0xABCDEF01, 0x23456789, 0x3210FEDC, 0xBA987654
        .word 0x5555AAAA, 0xCCCC3333, 0xF0F0F0F0, 0x0F0F0F0F
        .word 0x55555555, 0xAAAAAAAA, 0xCCCCCCCC, 0xFFFFFFFF
	dstn: .word


.text
.global _start
_start:
	LDR R0, =src
	LDR R5, =dstn
	MOV R6, #0x8
	
CPY:	
	LDMED R0!, {R1-R4}
	STMEA R5!, {R1-R4}
	SUBS R6,R6,#1
	BNE CPY

stop: BAL stop
.end
