	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t1, $fp, -64
	st.d $t1, $fp, -24
# %op1 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -65
# br i1 %op1, label %label_etrueBB, label %label_eefalseBB
	ld.b $t0, $fp, -65
	andi $t0, $t0, 1
	beqz $t0, .main_label_eefalseBB
	b .main_label_etrueBB
.main_label_etrueBB:
# br label %label_eeeretBB
	b .main_label_eeeretBB
.main_label_eefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeretBB
	b .main_label_eeeretBB
.main_label_eeeretBB:
# %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 3
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -80
# store i32 1234, i32* %op2
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 1234
	st.w $t1, $t0, 0
# %op3 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -81
# br i1 %op3, label %label_eeeetrueBB, label %label_eeeeefalseBB
	ld.b $t0, $fp, -81
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeefalseBB
	b .main_label_eeeetrueBB
.main_label_eeeetrueBB:
# br label %label_eeeeeeretBB
	b .main_label_eeeeeeretBB
.main_label_eeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeretBB
	b .main_label_eeeeeeretBB
.main_label_eeeeeeretBB:
# %op4 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 3
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -96
# %op5 = load i32, i32* %op4
	ld.d $t0, $fp, -96
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# ret i32 %op5
	ld.w $a0, $fp, -100
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 112
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
