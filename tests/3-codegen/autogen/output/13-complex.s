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
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = alloca i32
	addi.d $t1, $fp, -36
	st.d $t1, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t1, $fp, -52
	st.d $t1, $fp, -48
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -60
# %op6 = icmp sgt i32 %op4, %op5
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -60
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -61
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -61
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -68
# %op8 = icmp eq i32 %op7, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -69
# br i1 %op8, label %label_eefalseBB, label %label_etrueBB
	ld.b $t0, $fp, -69
	andi $t0, $t0, 1
	beqz $t0, .max_label_etrueBB
	b .max_label_eefalseBB
.max_label_etrueBB:
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -76
# ret i32 %op9
	ld.w $a0, $fp, -76
	b max_exit
.max_label_eefalseBB:
# %op10 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# ret i32 %op10
	ld.w $a0, $fp, -80
	b max_exit
.max_label_eeeretBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b max_exit
max_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 80
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
	addi.d $sp, $sp, -368
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = alloca i32
	addi.d $t1, $fp, -36
	st.d $t1, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t1, $fp, -52
	st.d $t1, $fp, -48
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t1, $fp, -68
	st.d $t1, $fp, -64
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op6 = icmp sle i32 %op5, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	bge $t1, $t0, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -73
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -73
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -80
# %op8 = icmp eq i32 %op7, 0
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -81
# br i1 %op8, label %label_eeeeeretBB, label %label_eeeetrueBB
	ld.b $t0, $fp, -81
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeetrueBB
	b .knapsack_label_eeeeeretBB
.knapsack_label_eeeetrueBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label_eeeeeretBB:
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op10 = icmp eq i32 %op9, 0
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -89
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -89
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaa
	addi.w $t1, $zero, 1
	b .toendaaaa
.store_0aaaa:
	addi.w $t1, $zero, 0
.toendaaaa:
	st.w $t1, $fp, -96
# %op12 = icmp eq i32 %op11, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -97
# br i1 %op12, label %label_eeeeeeeretBB, label %label_eeeeeetrueBB
	ld.b $t0, $fp, -97
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeetrueBB
	b .knapsack_label_eeeeeeeretBB
.knapsack_label_eeeeeetrueBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label_eeeeeeeretBB:
# %op13 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -104
# %op14 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# %op15 = mul i32 %op14, 11
	ld.w $t0, $fp, -108
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op16 = add i32 %op15, %op13
	ld.w $t0, $fp, -112
	ld.w $t1, $fp, -104
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op17 = icmp sge i32 %op16, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbb
.store_1bbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbb:
	st.b $t2, $fp, -117
# br i1 %op17, label %label_eeeeeeeetrueBB, label %label_eeeeeeeeefalseBB
	ld.b $t0, $fp, -117
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeetrueBB
.knapsack_label_eeeeeeeetrueBB:
# br label %label_eeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeretBB
.knapsack_label_eeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeretBB:
# %op18 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op16
	la.local $t0, dp
	ld.w $t2, $fp, -116
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -128
# %op19 = load i32, i32* %op18
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# %op20 = icmp sge i32 %op19, 0
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbb
.store_1bbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbb:
	st.b $t2, $fp, -133
# %op21 = zext i1 %op20 to i32
	ld.b $t0, $fp, -133
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaaa
	addi.w $t1, $zero, 1
	b .toendaaaaa
.store_0aaaaa:
	addi.w $t1, $zero, 0
.toendaaaaa:
	st.w $t1, $fp, -140
# %op22 = icmp eq i32 %op21, 0
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbb
.store_1bbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbb:
	st.b $t2, $fp, -141
# br i1 %op22, label %label_eeeeeeeeeeeeretBB, label %label_eeeeeeeeeeetrueBB
	ld.b $t0, $fp, -141
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeetrueBB
	b .knapsack_label_eeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeetrueBB:
# %op23 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -148
# %op24 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -152
# %op25 = mul i32 %op24, 11
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -156
# %op26 = add i32 %op25, %op23
	ld.w $t0, $fp, -156
	ld.w $t1, $fp, -148
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op27 = icmp sge i32 %op26, 0
	ld.w $t0, $fp, -160
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbb
.store_1bbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbb:
	st.b $t2, $fp, -161
# br i1 %op27, label %label_eeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -161
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeeretBB:
# %op28 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -168
# %op29 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -172
# %op30 = sub i32 %op29, 1
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op31 = icmp sge i32 %op30, 0
	ld.w $t0, $fp, -176
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbb
.store_1bbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbb:
	st.b $t2, $fp, -177
# br i1 %op31, label %label_eeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -177
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeretBB:
# %op32 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op26
	la.local $t0, dp
	ld.w $t2, $fp, -160
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -192
# %op33 = load i32, i32* %op32
	ld.d $t0, $fp, -192
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# ret i32 %op33
	ld.w $a0, $fp, -196
	b knapsack_exit
.knapsack_label_eeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeretBB:
# %op34 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op30
	la.local $t0, w
	ld.w $t2, $fp, -176
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -208
# %op35 = load i32, i32* %op34
	ld.d $t0, $fp, -208
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -212
# %op36 = icmp slt i32 %op28, %op35
	ld.w $t0, $fp, -168
	ld.w $t1, $fp, -212
	blt $t0, $t1, .store_1bbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbb:
	st.b $t2, $fp, -213
# %op37 = zext i1 %op36 to i32
	ld.b $t0, $fp, -213
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaaaa
	addi.w $t1, $zero, 1
	b .toendaaaaaa
.store_0aaaaaa:
	addi.w $t1, $zero, 0
.toendaaaaaa:
	st.w $t1, $fp, -220
# %op38 = icmp eq i32 %op37, 0
	ld.w $t0, $fp, -220
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbb:
	st.b $t2, $fp, -221
# br i1 %op38, label %label_eeeeeeeeeeeeeeeeeeeefalseBB, label %label_eeeeeeeeeeeeeeeeeeetrueBB
	ld.b $t0, $fp, -221
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeeeeetrueBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeefalseBB
.knapsack_label_eeeeeeeeeeeeeeeeeeetrueBB:
# %op39 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -228
# %op40 = sub i32 %op39, 1
	ld.w $t0, $fp, -228
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -232
# %op41 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -236
# %op42 = call i32 @knapsack(i32 %op40, i32 %op41)
	ld.w $a0, $fp, -232
	ld.w $a1, $fp, -236
	bl knapsack
	st.w $a0, $fp, -240
# store i32 %op42, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -240
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeefalseBB:
# %op43 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -244
# %op44 = sub i32 %op43, 1
	ld.w $t0, $fp, -244
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -248
# %op45 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -252
# %op46 = call i32 @knapsack(i32 %op44, i32 %op45)
	ld.w $a0, $fp, -248
	ld.w $a1, $fp, -252
	bl knapsack
	st.w $a0, $fp, -256
# %op47 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -260
# %op48 = sub i32 %op47, 1
	ld.w $t0, $fp, -260
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -264
# %op49 = icmp sge i32 %op48, 0
	ld.w $t0, $fp, -264
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -265
# br i1 %op49, label %label_eeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -265
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeretBB:
# %op50 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -272
# %op51 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -276
# %op52 = mul i32 %op51, 11
	ld.w $t0, $fp, -276
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -280
# %op53 = add i32 %op52, %op50
	ld.w $t0, $fp, -280
	ld.w $t1, $fp, -272
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -284
# %op54 = icmp sge i32 %op53, 0
	ld.w $t0, $fp, -284
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -285
# br i1 %op54, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -285
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op55 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op48
	la.local $t0, v
	ld.w $t2, $fp, -264
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -296
# %op56 = load i32, i32* %op55
	ld.d $t0, $fp, -296
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -300
# %op57 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -304
# %op58 = sub i32 %op57, 1
	ld.w $t0, $fp, -304
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -308
# %op59 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -312
# %op60 = sub i32 %op59, 1
	ld.w $t0, $fp, -312
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -316
# %op61 = icmp sge i32 %op60, 0
	ld.w $t0, $fp, -316
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -317
# br i1 %op61, label %label_eeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -317
	andi $t0, $t0, 1
	beqz $t0, .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op62 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op60
	la.local $t0, w
	ld.w $t2, $fp, -316
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -328
# %op63 = load i32, i32* %op62
	ld.d $t0, $fp, -328
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -332
# %op64 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -336
# %op65 = sub i32 %op64, %op63
	ld.w $t0, $fp, -336
	ld.w $t1, $fp, -332
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -340
# %op66 = call i32 @knapsack(i32 %op58, i32 %op65)
	ld.w $a0, $fp, -308
	ld.w $a1, $fp, -340
	bl knapsack
	st.w $a0, $fp, -344
# %op67 = add i32 %op66, %op56
	ld.w $t0, $fp, -344
	ld.w $t1, $fp, -300
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -348
# %op68 = call i32 @max(i32 %op46, i32 %op67)
	ld.w $a0, $fp, -256
	ld.w $a1, $fp, -348
	bl max
	st.w $a0, $fp, -352
# store i32 %op68, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -352
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.knapsack_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op69 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op53
	la.local $t0, dp
	ld.w $t2, $fp, -284
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -360
# %op70 = load i32, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -364
# store i32 %op70, i32* %op69
	ld.d $t0, $fp, -360
	ld.w $t1, $fp, -364
	st.w $t1, $t0, 0
# %op71 = load i32, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -368
# ret i32 %op71
	ld.w $a0, $fp, -368
	b knapsack_exit
knapsack_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 368
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
	addi.d $sp, $sp, -256
.main_label_entry:
# %op0 = alloca i32
	addi.d $t1, $fp, -28
	st.d $t1, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op1 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -29
# br i1 %op1, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -29
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op2 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -40
# store i32 2, i32* %op2
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op3 = icmp sge i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -41
# br i1 %op3, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -41
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op4 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t2, $zero, 1
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -56
# store i32 2, i32* %op4
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op5 = icmp sge i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -57
# br i1 %op5, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -57
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op6 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t2, $zero, 2
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -72
# store i32 6, i32* %op6
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op7 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -73
# br i1 %op7, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -73
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op8 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t2, $zero, 3
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -88
# store i32 5, i32* %op8
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op9 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -89
# br i1 %op9, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -89
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op10 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -104
# store i32 4, i32* %op10
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op11 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -105
# br i1 %op11, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -105
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op12 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -120
# store i32 6, i32* %op12
	ld.d $t0, $fp, -120
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op13 = icmp sge i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -121
# br i1 %op13, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -121
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op14 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t2, $zero, 1
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -136
# store i32 3, i32* %op14
	ld.d $t0, $fp, -136
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op15 = icmp sge i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -137
# br i1 %op15, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -137
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op16 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t2, $zero, 2
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -152
# store i32 5, i32* %op16
	ld.d $t0, $fp, -152
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op17 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -153
# br i1 %op17, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -153
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op18 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t2, $zero, 3
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -168
# store i32 4, i32* %op18
	ld.d $t0, $fp, -168
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op19 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -169
# br i1 %op19, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -169
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op20 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t2, $zero, 4
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -184
# store i32 6, i32* %op20
	ld.d $t0, $fp, -184
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB:
# %op21 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -188
# %op22 = icmp slt i32 %op21, 66
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 66
	blt $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -189
# %op23 = zext i1 %op22 to i32
	ld.b $t0, $fp, -189
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaaaaa
	addi.w $t1, $zero, 1
	b .toendaaaaaaa
.store_0aaaaaaa:
	addi.w $t1, $zero, 0
.toendaaaaaaa:
	st.w $t1, $fp, -196
# %op24 = icmp sgt i32 %op23, zeroinitializer
	ld.w $t0, $fp, -196
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -197
# br i1 %op24, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -197
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# %op25 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -204
# %op26 = icmp sge i32 %op25, 0
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
.store_1bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb:
	st.b $t2, $fp, -205
# br i1 %op26, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -205
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# %op27 = load i32, i32* @n
	la.local $t0, n
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -212
# %op28 = load i32, i32* @m
	la.local $t0, m
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -216
# %op29 = call i32 @knapsack(i32 %op27, i32 %op28)
	ld.w $a0, $fp, -212
	ld.w $a1, $fp, -216
	bl knapsack
	st.w $a0, $fp, -220
# call void @output(i32 %op29)
	ld.w $a0, $fp, -220
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeretBB:
# %op30 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op25
	la.local $t0, dp
	ld.w $t2, $fp, -204
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -232
# %op31 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -236
# store i32 %op31, i32* %op30
	ld.d $t0, $fp, -232
	ld.w $t1, $fp, -236
	st.w $t1, $t0, 0
# %op32 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -240
# %op33 = add i32 %op32, 1
	ld.w $t0, $fp, -240
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -244
# store i32 %op33, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -244
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB
	b .main_label_eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeewhileBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 256
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
