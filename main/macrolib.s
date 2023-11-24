.macro sleep(%x)
    	li a0, %x
    	li a7, 32
    	ecall
.end_macro

.macro stop
	li a7, 10
	ecall
.end_macro

.macro print_hex(%num, %block)
	mv a0, %num
	mv a1, %block # break point
	jal hexPrinter
.end_macro

.macro empty_block(%block)
	lui t3, 0xffff0
	addi t3, t3, %block
	sb zero, (t3)
.end_macro