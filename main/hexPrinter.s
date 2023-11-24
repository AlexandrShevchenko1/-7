.include "macrolib.s"

.global hexPrinter

.data
zeroMy: .byte 0x3f 
one: .byte 0x06
two: .byte 0x5b
three: .byte 0x4f
four: .byte 0x66
five: .byte  0x6d
six: .byte 0x7d
seven: .byte 0x07
eight: .byte 0x7f
nine: .byte 0x6f
ten: .byte 0x77
eleven: .byte 0x7f
twelve: .byte 0x39
thirteen: .byte 0x3f
fourteen: .byte 0x79
fifteen: .byte 0x71
point: .byte 0x80
end:


.text 
hexPrinter:
	addi sp sp -20
	sw ra (sp) # for code scalabillity
	sw s0 4(sp)
	sw s1 8(sp)
	sw s2 12(sp)
	sw s3 16(sp)
	
	lui t3, 0xffff0
	add t3, t3, a1
	la s0, zeroMy
	lb s1, point
	li s2, 0xf
	mv s3, a0
	
	and s3, s3, s2 # take two last
	add s0,s0, s3
	lb t1, (s0)
	bne a0, s3, require_p
	j no_point
	require_p:
	or t1, t1, s1
	no_point:
	sb t1, (t3)
	
	lw ra (sp) 
	lw s0 4(sp)
	lw s1 8(sp)
	lw s2 12(sp)
	lw s3 16(sp)
	addi sp sp 20
	ret