# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl a
	.type a, @object
	.size a, 4
a:
	.space 4
	.text
	.globl GlobalAssign
	.type GlobalAssign, @function
GlobalAssign:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -16
.GlobalAssign_label_entry:
# store i32 10, i32* @a
	la.local $t0, a
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# ret void
	addi.w $a0, $zero, 0
	b GlobalAssign_exit
GlobalAssign_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 16
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -16
.main_label_entry:
# call void @GlobalAssign()
	bl GlobalAssign
# ret i32 20
	addi.w $a0, $zero, 20
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 16
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
