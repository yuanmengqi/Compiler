# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl n
	.type n, @object
	.size n, 4
n:
	.space 4
	.globl m
	.type m, @object
	.size m, 4
m:
	.space 4
	.globl w
	.type w, @object
	.size w, 20
w:
	.space 20
	.globl v
	.type v, @object
	.size v, 20
v:
	.space 20
	.globl dp
	.type dp, @object
	.size dp, 264
dp:
	.space 264
	.text
	.globl max
	.type max, @function
max:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = icmp sgt i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -32
# %op4 = icmp eq i32 %op3, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -33
# br i1 %op4, label %label_eefalseBB, label %label_etrueBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .max_label_etrueBB
	b .max_label_eefalseBB
.max_label_etrueBB:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	b max_exit
.max_label_eefalseBB:
# ret i32 %arg1
	ld.w $a0, $fp, -24
	b max_exit
max_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 48
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -256
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = icmp sle i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	bge $t1, $t0, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -32
# %op4 = icmp eq i32 %op3, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -33
# br i1 %op4, label %label_eeeeretBB, label %label_eeetrueBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeetrueBB
	b .knapsack_label_eeeeretBB
.knapsack_label_eeetrueBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label_eeeeretBB:
# %op5 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -34
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -34
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaa
	addi.w $t1, $zero, 1
	b .toendaaaa
.store_0aaaa:
	addi.w $t1, $zero, 0
.toendaaaa:
	st.w $t1, $fp, -40
# %op7 = icmp eq i32 %op6, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -41
# br i1 %op7, label %label_eeeeeeretBB, label %label_eeeeetrueBB
	ld.b $t0, $fp, -41
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeetrueBB
	b .knapsack_label_eeeeeeretBB
.knapsack_label_eeeeetrueBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label_eeeeeeretBB:
# %op8 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op9 = add i32 %op8, %arg1
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op10 = icmp sge i32 %op9, 0
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbb
.store_1bbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbb:
	st.b $t2, $fp, -53
# br i1 %op10, label %label_eeeeeeetrueBB, label %label_eeeeeeeefalseBB
	ld.b $t0, $fp, -53
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeefalseBB
	b .knapsack_label_eeeeeeetrueBB
.knapsack_label_eeeeeeetrueBB:
# br label %label_eeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeretBB
.knapsack_label_eeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeretBB
.knapsack_label_eeeeeeeeeretBB:
# %op11 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op9
	la.local $t0, dp
	ld.w $t2, $fp, -52
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -64
# %op12 = load i32, i32* %op11
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op13 = icmp sge i32 %op12, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbb
.store_1bbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbb:
	st.b $t2, $fp, -69
# %op14 = zext i1 %op13 to i32
	ld.b $t0, $fp, -69
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaaa
	addi.w $t1, $zero, 1
	b .toendaaaaa
.store_0aaaaa:
	addi.w $t1, $zero, 0
.toendaaaaa:
	st.w $t1, $fp, -76
# %op15 = icmp eq i32 %op14, 0
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbb
.store_1bbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbb:
	st.b $t2, $fp, -77
# br i1 %op15, label %label_eeeeeeeeeeeretBB, label %label_eeeeeeeeeetrueBB
	ld.b $t0, $fp, -77
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeetrueBB
	b .knapsack_label_eeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeetrueBB:
# %op16 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# %op17 = add i32 %op16, %arg1
	ld.w $t0, $fp, -84
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -88
# %op18 = icmp sge i32 %op17, 0
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbb
.store_1bbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbb:
	st.b $t2, $fp, -89
# br i1 %op18, label %label_eeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -89
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeretBB:
# %op19 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op20 = icmp sge i32 %op19, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbb
.store_1bbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbb:
	st.b $t2, $fp, -97
# br i1 %op20, label %label_eeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -97
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeretBB:
# %op21 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op17
	la.local $t0, dp
	ld.w $t2, $fp, -88
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -112
# %op22 = load i32, i32* %op21
	ld.d $t0, $fp, -112
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -116
# ret i32 %op22
	ld.w $a0, $fp, -116
	b knapsack_exit
.knapsack_label_eeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeretBB:
# %op23 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op19
	la.local $t0, w
	ld.w $t2, $fp, -96
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -128
# %op24 = load i32, i32* %op23
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op25 = icmp slt i32 %arg1, %op24
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -132
	blt $t0, $t1, .store_1bbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbb:
	st.b $t2, $fp, -133
# %op26 = zext i1 %op25 to i32
	ld.b $t0, $fp, -133
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaaaa
	addi.w $t1, $zero, 1
	b .toendaaaaaa
.store_0aaaaaa:
	addi.w $t1, $zero, 0
.toendaaaaaa:
	st.w $t1, $fp, -140
# %op27 = icmp eq i32 %op26, 0
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbb:
	st.b $t2, $fp, -141
# br i1 %op27, label %label_eeeeeeeeeeeeeeeeeeefalseBB, label %label_eeeeeeeeeeeeeeeeeetrueBB
	ld.b $t0, $fp, -141
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeeeetrueBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeefalseBB
.knapsack_label_eeeeeeeeeeeeeeeeeetrueBB:
# %op28 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op29 = call i32 @knapsack(i32 %op28, i32 %arg1)
	ld.w $a0, $fp, -148
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -152
# br label %label_eeeeeeeeeeeeeeeeeeeeretBB
	ld.w $t0, $fp, -152
	st.w $t0, $fp, -172
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeefalseBB:
# %op30 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -156
# %op31 = call i32 @knapsack(i32 %op30, i32 %arg1)
	ld.w $a0, $fp, -156
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -160
# %op32 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -164
# %op33 = icmp sge i32 %op32, 0
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -165
# br i1 %op33, label %label_eeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -165
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeretBB:
# %op34 = phi i32 [ %op29, %label_eeeeeeeeeeeeeeeeeetrueBB ], [ %op48, %label_eeeeeeeeeeeeeeeeeeeeeeeeeeretBB ]
# %op35 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op36 = add i32 %op35, %arg1
	ld.w $t0, $fp, -176
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op37 = icmp sge i32 %op36, 0
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -181
# br i1 %op37, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -181
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op38 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op32
	la.local $t0, v
	ld.w $t2, $fp, -164
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -192
# %op39 = load i32, i32* %op38
	ld.d $t0, $fp, -192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# %op40 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# %op41 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# %op42 = icmp sge i32 %op41, 0
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -205
# br i1 %op42, label %label_eeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -205
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op43 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op41
	la.local $t0, w
	ld.w $t2, $fp, -204
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -216
# %op44 = load i32, i32* %op43
	ld.d $t0, $fp, -216
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -220
# %op45 = sub i32 %arg1, %op44
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -220
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# %op46 = call i32 @knapsack(i32 %op40, i32 %op45)
	ld.w $a0, $fp, -200
	ld.w $a1, $fp, -224
	bl knapsack
	st.w $a0, $fp, -228
# %op47 = add i32 %op46, %op39
	ld.w $t0, $fp, -228
	ld.w $t1, $fp, -196
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -232
# %op48 = call i32 @max(i32 %op31, i32 %op47)
	ld.w $a0, $fp, -160
	ld.w $a1, $fp, -232
	bl max
	st.w $a0, $fp, -236
# br label %label_eeeeeeeeeeeeeeeeeeeeretBB
	ld.w $t0, $fp, -236
	st.w $t0, $fp, -172
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op49 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op36
	la.local $t0, dp
	ld.w $t2, $fp, -180
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -248
# store i32 %op34, i32* %op49
	ld.d $t0, $fp, -248
	ld.w $t1, $fp, -172
	st.w $t1, $t0, 0
# ret i32 %op34
	ld.w $a0, $fp, -172
	b knapsack_exit
knapsack_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 256
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
	addi.d $sp, $sp, -224
.main_label_entry:
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op0 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -17
# br i1 %op0, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -17
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op1 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -32
# store i32 2, i32* %op1
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op2 = icmp sge i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -33
# br i1 %op2, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t2, $zero, 1
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -48
# store i32 2, i32* %op3
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op4 = icmp sge i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -49
# br i1 %op4, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -49
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op5 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t2, $zero, 2
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -64
# store i32 6, i32* %op5
	ld.d $t0, $fp, -64
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op6 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -65
# br i1 %op6, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -65
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op7 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t2, $zero, 3
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -80
# store i32 5, i32* %op7
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op8 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -81
# br i1 %op8, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -81
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op9 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -96
# store i32 4, i32* %op9
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op10 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -97
# br i1 %op10, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -97
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op11 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -112
# store i32 6, i32* %op11
	ld.d $t0, $fp, -112
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op12 = icmp sge i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -113
# br i1 %op12, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -113
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op13 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t2, $zero, 1
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -128
# store i32 3, i32* %op13
	ld.d $t0, $fp, -128
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op14 = icmp sge i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -129
# br i1 %op14, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -129
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op15 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t2, $zero, 2
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -144
# store i32 5, i32* %op15
	ld.d $t0, $fp, -144
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op16 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -145
# br i1 %op16, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -145
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op17 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t2, $zero, 3
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -160
# store i32 4, i32* %op17
	ld.d $t0, $fp, -160
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op18 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -161
# br i1 %op18, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -161
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op19 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -176
# store i32 6, i32* %op19
	ld.d $t0, $fp, -176
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -180
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB:
# %op20 = phi i32 [ 0, %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB ], [ %op30, %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB ]
# %op21 = icmp slt i32 %op20, 66
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 66
	blt $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -181
# %op22 = zext i1 %op21 to i32
	ld.b $t0, $fp, -181
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaaaaa
	addi.w $t1, $zero, 1
	b .toendaaaaaaa
.store_0aaaaaaa:
	addi.w $t1, $zero, 0
.toendaaaaaaa:
	st.w $t1, $fp, -188
# %op23 = icmp sgt i32 %op22, zeroinitializer
	ld.w $t0, $fp, -188
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -189
# br i1 %op23, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -189
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# %op24 = icmp sge i32 %op20, 0
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -190
# br i1 %op24, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -190
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# %op25 = load i32, i32* @n
	la.local $t0, n
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# %op26 = load i32, i32* @m
	la.local $t0, m
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -200
# %op27 = call i32 @knapsack(i32 %op25, i32 %op26)
	ld.w $a0, $fp, -196
	ld.w $a1, $fp, -200
	bl knapsack
	st.w $a0, $fp, -204
# call void @output(i32 %op27)
	ld.w $a0, $fp, -204
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op28 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op20
	la.local $t0, dp
	ld.w $t2, $fp, -180
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -216
# %op29 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -220
# store i32 %op29, i32* %op28
	ld.d $t0, $fp, -216
	ld.w $t1, $fp, -220
	st.w $t1, $t0, 0
# %op30 = add i32 %op20, 1
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB
	ld.w $t0, $fp, -224
	st.w $t0, $fp, -180
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 224
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
