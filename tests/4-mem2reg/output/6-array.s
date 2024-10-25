	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -176
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t1, $fp, -64
	st.d $t1, $fp, -24
# %op1 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
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
# %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -80
# store i32 11, i32* %op2
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# %op3 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
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
# %op4 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -96
# store i32 22, i32* %op4
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# %op5 = icmp sge i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -97
# br i1 %op5, label %label_eeeeeeetrueBB, label %label_eeeeeeeefalseBB
	ld.b $t0, $fp, -97
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeefalseBB
	b .main_label_eeeeeeetrueBB
.main_label_eeeeeeetrueBB:
# br label %label_eeeeeeeeeretBB
	b .main_label_eeeeeeeeeretBB
.main_label_eeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeretBB
	b .main_label_eeeeeeeeeretBB
.main_label_eeeeeeeeeretBB:
# %op6 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 9
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -112
# store i32 33, i32* %op6
	ld.d $t0, $fp, -112
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op7 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -113
# br i1 %op7, label %label_eeeeeeeeeetrueBB, label %label_eeeeeeeeeeefalseBB
	ld.b $t0, $fp, -113
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeetrueBB
.main_label_eeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeretBB:
# %op8 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -128
# %op9 = load i32, i32* %op8
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# call void @output(i32 %op9)
	ld.w $a0, $fp, -132
	bl output
# %op10 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -133
# br i1 %op10, label %label_eeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -133
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeretBB:
# %op11 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -144
# %op12 = load i32, i32* %op11
	ld.d $t0, $fp, -144
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# call void @output(i32 %op12)
	ld.w $a0, $fp, -148
	bl output
# %op13 = icmp sge i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -149
# br i1 %op13, label %label_eeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -149
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeretBB:
# %op14 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 9
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -160
# %op15 = load i32, i32* %op14
	ld.d $t0, $fp, -160
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -164
# call void @output(i32 %op15)
	ld.w $a0, $fp, -164
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 176
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
