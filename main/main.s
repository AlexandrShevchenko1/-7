.include "macrolib.s"

.text 
main:
	empty_block(0x10)
	empty_block(0x11)
	li s0, 0 # from 0 to 15
	li s1, 16
	li s2, 0x10 # adjust the right block's mode
	loop_one:
		beq s0, s1, finish
		print_hex(s0,s2)
		sleep(1000)
		addi s0, s0, 1
		j loop_one
	finish:
	empty_block(0x10)
	li s0, 0
	li s2, 0x11
	loop_two:
		beq s0, s1, terminate
		print_hex(s0,s2)
		sleep(1000)
		addi s0, s0, 1
		j loop_two
	terminate:
	empty_block(0x11)
	stop 
	