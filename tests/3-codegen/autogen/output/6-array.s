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
# %op1 = alloca i32
	addi.d $t1, $fp, -76
	st.d $t1, $fp, -72
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op2 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -77
# br i1 %op2, label %label_etrueBB, label %label_eefalseBB
	ld.b $t0, $fp, -77
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
# %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -88
# store i32 11, i32* %op3
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# %op4 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -89
# br i1 %op4, label %label_eeeetrueBB, label %label_eeeeefalseBB
	ld.b $t0, $fp, -89
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
# %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -104
# store i32 22, i32* %op5
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# %op6 = icmp sge i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -105
# br i1 %op6, label %label_eeeeeeetrueBB, label %label_eeeeeeeefalseBB
	ld.b $t0, $fp, -105
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
# %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 9
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -120
# store i32 33, i32* %op7
	ld.d $t0, $fp, -120
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op8 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -121
# br i1 %op8, label %label_eeeeeeeeeetrueBB, label %label_eeeeeeeeeeefalseBB
	ld.b $t0, $fp, -121
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
# %op9 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -136
# %op10 = load i32, i32* %op9
	ld.d $t0, $fp, -136
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -140
# call void @output(i32 %op10)
	ld.w $a0, $fp, -140
	bl output
# %op11 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -141
# br i1 %op11, label %label_eeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -141
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
# %op12 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -152
# %op13 = load i32, i32* %op12
	ld.d $t0, $fp, -152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# call void @output(i32 %op13)
	ld.w $a0, $fp, -156
	bl output
# %op14 = icmp sge i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -157
# br i1 %op14, label %label_eeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -157
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
# %op15 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 9
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -168
# %op16 = load i32, i32* %op15
	ld.d $t0, $fp, -168
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# call void @output(i32 %op16)
	ld.w $a0, $fp, -172
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
