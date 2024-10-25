	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = alloca i32*
	addi.d $t1, $fp, -48
	st.d $t1, $fp, -40
# store i32* %arg0, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t1, $fp, -60
	st.d $t1, $fp, -56
# store i32 %arg1, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op5 = alloca i32
	addi.d $t1, $fp, -76
	st.d $t1, $fp, -72
# store i32 %arg2, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op6 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op7 = icmp sge i32 %op6, 0
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -81
# br i1 %op7, label %label_etrueBB, label %label_eefalseBB
	ld.b $t0, $fp, -81
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
# %op8 = load i32*, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -96
# %op9 = getelementptr i32, i32* %op8, i32 %op6
	ld.d $t0, $fp, -96
	ld.w $t2, $fp, -80
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -104
# %op10 = load i32, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# store i32 %op10, i32* %op9
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -108
	st.w $t1, $t0, 0
# %op11 = load i32, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -112
# ret i32 %op11
	ld.w $a0, $fp, -112
	b store_exit
store_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 112
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
	addi.d $sp, $sp, -208
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t1, $fp, -64
	st.d $t1, $fp, -24
# %op1 = alloca i32
	addi.d $t1, $fp, -76
	st.d $t1, $fp, -72
# %op2 = alloca i32
	addi.d $t1, $fp, -92
	st.d $t1, $fp, -88
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_eeeewhileBB
	b .main_label_eeeewhileBB
.main_label_eeeewhileBB:
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -96
# %op4 = icmp slt i32 %op3, 10
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 10
	blt $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -97
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -97
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -104
# %op6 = icmp sgt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -104
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -105
# br i1 %op6, label %label_eeeeetrueBB, label %label_eeeeeefalseBB
	ld.b $t0, $fp, -105
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeefalseBB
	b .main_label_eeeeetrueBB
.main_label_eeeeetrueBB:
# %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -120
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -128
# %op10 = mul i32 %op9, 2
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op11 = call i32 @store(i32* %op7, i32 %op8, i32 %op10)
	ld.d $a0, $fp, -120
	ld.w $a1, $fp, -124
	ld.w $a2, $fp, -132
	bl store
	st.w $a0, $fp, -136
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -140
# %op13 = add i32 %op12, 1
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -144
# store i32 %op13, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -144
	st.w $t1, $t0, 0
# br label %label_eeeewhileBB
	b .main_label_eeeewhileBB
.main_label_eeeeeefalseBB:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_eeeeeeewhileBB
	b .main_label_eeeeeeewhileBB
.main_label_eeeeeeewhileBB:
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# %op15 = icmp slt i32 %op14, 10
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 10
	blt $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -149
# %op16 = zext i1 %op15 to i32
	ld.b $t0, $fp, -149
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -156
# %op17 = icmp sgt i32 %op16, zeroinitializer
	ld.w $t0, $fp, -156
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -157
# br i1 %op17, label %label_eeeeeeeetrueBB, label %label_eeeeeeeeefalseBB
	ld.b $t0, $fp, -157
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeefalseBB
	b .main_label_eeeeeeeetrueBB
.main_label_eeeeeeeetrueBB:
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -164
# %op19 = icmp sge i32 %op18, 0
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -165
# br i1 %op19, label %label_eeeeeeeeeetrueBB, label %label_eeeeeeeeeeefalseBB
	ld.b $t0, $fp, -165
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeetrueBB
.main_label_eeeeeeeeefalseBB:
# %op20 = load i32, i32* %op2
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# call void @output(i32 %op20)
	ld.w $a0, $fp, -172
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
# %op21 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op18
	ld.d $t0, $fp, -24
	ld.w $t2, $fp, -164
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -184
# %op22 = load i32, i32* %op21
	ld.d $t0, $fp, -184
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -188
# %op23 = load i32, i32* %op2
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -192
# %op24 = add i32 %op23, %op22
	ld.w $t0, $fp, -192
	ld.w $t1, $fp, -188
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# store i32 %op24, i32* %op2
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -196
	st.w $t1, $t0, 0
# %op25 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -200
# %op26 = add i32 %op25, 1
	ld.w $t0, $fp, -200
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# store i32 %op26, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -204
	st.w $t1, $t0, 0
# br label %label_eeeeeeewhileBB
	b .main_label_eeeeeeewhileBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 208
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
