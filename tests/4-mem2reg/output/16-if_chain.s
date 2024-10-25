	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = icmp eq i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -17
# br i1 %op0, label %label_eeretBB, label %label_etrueBB
	addi.w $t0, $zero, 2
	st.w $t0, $fp, -24
	ld.b $t0, $fp, -17
	andi $t0, $t0, 1
	beqz $t0, .main_label_etrueBB
	b .main_label_eeretBB
.main_label_etrueBB:
# %op1 = icmp eq i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -18
# br i1 %op1, label %label_eeeefalseBB, label %label_eeetrueBB
	ld.b $t0, $fp, -18
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeetrueBB
	b .main_label_eeeefalseBB
.main_label_eeretBB:
# %op2 = phi i32 [ 2, %label_entry ], [ %op3, %label_eeeeeretBB ]
# ret i32 %op2
	ld.w $a0, $fp, -24
	b main_exit
.main_label_eeetrueBB:
# br label %label_eeeeeretBB
	addi.w $t0, $zero, 4
	st.w $t0, $fp, -28
	b .main_label_eeeeeretBB
.main_label_eeeefalseBB:
# br label %label_eeeeeretBB
	addi.w $t0, $zero, 3
	st.w $t0, $fp, -28
	b .main_label_eeeeeretBB
.main_label_eeeeeretBB:
# %op3 = phi i32 [ 4, %label_eeetrueBB ], [ 3, %label_eeeefalseBB ]
# br label %label_eeretBB
	ld.w $t0, $fp, -28
	st.w $t0, $fp, -24
	b .main_label_eeretBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 32
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
