	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = icmp sge i32 %arg1, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -33
# br i1 %op3, label %label_etrueBB, label %label_eefalseBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .store_label_eefalseBB
	b .store_label_etrueBB
.store_label_etrueBB:
# br label %label_eeeretBB
	b .store_label_eeeretBB
.store_label_eefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeretBB
	b .store_label_eeeretBB
.store_label_eeeretBB:
# %op4 = getelementptr i32, i32* %arg0, i32 %arg1
	ld.d $t0, $fp, -24
	ld.w $t2, $fp, -28
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -48
# store i32 %arg2, i32* %op4
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# ret i32 %arg2
	ld.w $a0, $fp, -32
	b store_exit
store_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 48
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
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t1, $fp, -64
	st.d $t1, $fp, -24
# br label %label_eeeewhileBB
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -68
	b .main_label_eeeewhileBB
.main_label_eeeewhileBB:
# %op1 = phi i32 [ 0, %label_entry ], [ %op8, %label_eeeeetrueBB ]
# %op2 = icmp slt i32 %op1, 10
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 10
	blt $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -69
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -69
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -76
# %op4 = icmp sgt i32 %op3, zeroinitializer
	ld.w $t0, $fp, -76
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -77
# br i1 %op4, label %label_eeeeetrueBB, label %label_eeeeeefalseBB
	ld.b $t0, $fp, -77
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeefalseBB
	b .main_label_eeeeetrueBB
.main_label_eeeeetrueBB:
# %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -88
# %op6 = mul i32 %op1, 2
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op7 = call i32 @store(i32* %op5, i32 %op1, i32 %op6)
	ld.d $a0, $fp, -88
	ld.w $a1, $fp, -68
	ld.w $a2, $fp, -92
	bl store
	st.w $a0, $fp, -96
# %op8 = add i32 %op1, 1
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# br label %label_eeeewhileBB
	ld.w $t0, $fp, -100
	st.w $t0, $fp, -68
	b .main_label_eeeewhileBB
.main_label_eeeeeefalseBB:
# br label %label_eeeeeeewhileBB
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -104
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -108
	b .main_label_eeeeeeewhileBB
.main_label_eeeeeeewhileBB:
# %op9 = phi i32 [ 0, %label_eeeeeefalseBB ], [ %op17, %label_eeeeeeeeeeeeretBB ]
# %op10 = phi i32 [ 0, %label_eeeeeefalseBB ], [ %op18, %label_eeeeeeeeeeeeretBB ]
# %op11 = icmp slt i32 %op10, 10
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 10
	blt $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -109
# %op12 = zext i1 %op11 to i32
	ld.b $t0, $fp, -109
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -116
# %op13 = icmp sgt i32 %op12, zeroinitializer
	ld.w $t0, $fp, -116
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -117
# br i1 %op13, label %label_eeeeeeeetrueBB, label %label_eeeeeeeeefalseBB
	ld.b $t0, $fp, -117
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeefalseBB
	b .main_label_eeeeeeeetrueBB
.main_label_eeeeeeeetrueBB:
# %op14 = icmp sge i32 %op10, 0
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -118
# br i1 %op14, label %label_eeeeeeeeeetrueBB, label %label_eeeeeeeeeeefalseBB
	ld.b $t0, $fp, -118
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeetrueBB
.main_label_eeeeeeeeefalseBB:
# call void @output(i32 %op9)
	ld.w $a0, $fp, -104
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label_eeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeretBB:
# %op15 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op10
	ld.d $t0, $fp, -24
	ld.w $t2, $fp, -108
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -128
# %op16 = load i32, i32* %op15
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op17 = add i32 %op9, %op16
	ld.w $t0, $fp, -104
	ld.w $t1, $fp, -132
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op18 = add i32 %op10, 1
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# br label %label_eeeeeeewhileBB
	ld.w $t0, $fp, -136
	st.w $t0, $fp, -104
	ld.w $t0, $fp, -140
	st.w $t0, $fp, -108
	b .main_label_eeeeeeewhileBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 144
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
