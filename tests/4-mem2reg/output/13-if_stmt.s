	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = icmp eq i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -17
# br i1 %op0, label %label_eeretBB, label %label_etrueBB
	ld.b $t0, $fp, -17
	andi $t0, $t0, 1
	beqz $t0, .main_label_etrueBB
	b .main_label_eeretBB
.main_label_etrueBB:
# br label %label_eeretBB
	b .main_label_eeretBB
.main_label_eeretBB:
# ret void
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 32
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
