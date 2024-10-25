# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl x
	.type x, @object
	.size x, 4
x:
	.space 4
	.globl y
	.type y, @object
	.size y, 4
y:
	.space 4
	.text
	.globl gcd
	.type gcd, @function
gcd:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.gcd_label_entry:
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
# %op4 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op5 = icmp eq i32 %op4, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -57
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -57
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -64
# %op7 = icmp eq i32 %op6, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -65
# br i1 %op7, label %label_eefalseBB, label %label_etrueBB
	ld.b $t0, $fp, -65
	andi $t0, $t0, 1
	beqz $t0, .gcd_label_etrueBB
	b .gcd_label_eefalseBB
.gcd_label_etrueBB:
# %op8 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# ret i32 %op8
	ld.w $a0, $fp, -72
	b gcd_exit
.gcd_label_eefalseBB:
# %op9 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -76
# %op10 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op11 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -84
# %op12 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op13 = sdiv i32 %op12, %op11
	ld.w $t0, $fp, -88
	ld.w $t1, $fp, -84
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op14 = mul i32 %op13, %op10
	ld.w $t0, $fp, -92
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op15 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# %op16 = sub i32 %op15, %op14
	ld.w $t0, $fp, -100
	ld.w $t1, $fp, -96
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -104
# %op17 = call i32 @gcd(i32 %op9, i32 %op16)
	ld.w $a0, $fp, -76
	ld.w $a1, $fp, -104
	bl gcd
	st.w $a0, $fp, -108
# ret i32 %op17
	ld.w $a0, $fp, -108
	b gcd_exit
gcd_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 112
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl funArray
	.type funArray, @function
funArray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -208
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.funArray_label_entry:
# %op2 = alloca i32*
	addi.d $t1, $fp, -48
	st.d $t1, $fp, -40
# store i32* %arg0, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op3 = alloca i32*
	addi.d $t1, $fp, -64
	st.d $t1, $fp, -56
# store i32* %arg1, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $fp, -32
	st.d $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t1, $fp, -76
	st.d $t1, $fp, -72
# %op5 = alloca i32
	addi.d $t1, $fp, -92
	st.d $t1, $fp, -88
# %op6 = alloca i32
	addi.d $t1, $fp, -108
	st.d $t1, $fp, -104
# %op7 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -109
# br i1 %op7, label %label_eeetrueBB, label %label_eeeefalseBB
	ld.b $t0, $fp, -109
	andi $t0, $t0, 1
	beqz $t0, .funArray_label_eeeefalseBB
	b .funArray_label_eeetrueBB
.funArray_label_eeetrueBB:
# br label %label_eeeeeretBB
	b .funArray_label_eeeeeretBB
.funArray_label_eeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeretBB
	b .funArray_label_eeeeeretBB
.funArray_label_eeeeeretBB:
# %op8 = load i32*, i32** %op2
	ld.d $t0, $fp, -40
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -120
# %op9 = getelementptr i32, i32* %op8, i32 0
	ld.d $t0, $fp, -120
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -128
# %op10 = load i32, i32* %op9
	ld.d $t0, $fp, -128
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# store i32 %op10, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -132
	st.w $t1, $t0, 0
# %op11 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -133
# br i1 %op11, label %label_eeeeeetrueBB, label %label_eeeeeeefalseBB
	ld.b $t0, $fp, -133
	andi $t0, $t0, 1
	beqz $t0, .funArray_label_eeeeeeefalseBB
	b .funArray_label_eeeeeetrueBB
.funArray_label_eeeeeetrueBB:
# br label %label_eeeeeeeeretBB
	b .funArray_label_eeeeeeeeretBB
.funArray_label_eeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeretBB
	b .funArray_label_eeeeeeeeretBB
.funArray_label_eeeeeeeeretBB:
# %op12 = load i32*, i32** %op3
	ld.d $t0, $fp, -56
	ld.d $t1, $t0, 0
	st.d $t1, $fp, -144
# %op13 = getelementptr i32, i32* %op12, i32 0
	ld.d $t0, $fp, -144
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -152
# %op14 = load i32, i32* %op13
	ld.d $t0, $fp, -152
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -156
# store i32 %op14, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -156
	st.w $t1, $t0, 0
# %op15 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -160
# %op16 = load i32, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -164
# %op17 = icmp slt i32 %op15, %op16
	ld.w $t0, $fp, -160
	ld.w $t1, $fp, -164
	blt $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -165
# %op18 = zext i1 %op17 to i32
	ld.b $t0, $fp, -165
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -172
# %op19 = icmp eq i32 %op18, 0
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -173
# br i1 %op19, label %label_eeeeeeeeeeretBB, label %label_eeeeeeeeetrueBB
	ld.b $t0, $fp, -173
	andi $t0, $t0, 1
	beqz $t0, .funArray_label_eeeeeeeeetrueBB
	b .funArray_label_eeeeeeeeeeretBB
.funArray_label_eeeeeeeeetrueBB:
# %op20 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -180
# store i32 %op20, i32* %op6
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -180
	st.w $t1, $t0, 0
# %op21 = load i32, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -184
# store i32 %op21, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -184
	st.w $t1, $t0, 0
# %op22 = load i32, i32* %op6
	ld.d $t0, $fp, -104
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -188
# store i32 %op22, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -188
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeeretBB
	b .funArray_label_eeeeeeeeeeretBB
.funArray_label_eeeeeeeeeeretBB:
# %op23 = load i32, i32* %op4
	ld.d $t0, $fp, -72
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -192
# %op24 = load i32, i32* %op5
	ld.d $t0, $fp, -88
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -196
# %op25 = call i32 @gcd(i32 %op23, i32 %op24)
	ld.w $a0, $fp, -192
	ld.w $a1, $fp, -196
	bl gcd
	st.w $a0, $fp, -200
# ret i32 %op25
	ld.w $a0, $fp, -200
	b funArray_exit
funArray_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 208
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
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbb
.store_1bbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbb:
	st.b $t2, $fp, -17
# br i1 %op0, label %label_eeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -17
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeretBB:
# %op1 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -32
# store i32 90, i32* %op1
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 90
	st.w $t1, $t0, 0
# %op2 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbb
.store_1bbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbb:
	st.b $t2, $fp, -33
# br i1 %op2, label %label_eeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeefalseBB:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label_eeeeeeeeeeeeeeeeretBB
	b .main_label_eeeeeeeeeeeeeeeeretBB
.main_label_eeeeeeeeeeeeeeeeretBB:
# %op3 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -48
# store i32 18, i32* %op3
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 18
	st.w $t1, $t0, 0
# %op4 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -56
# %op5 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -64
# %op6 = call i32 @funArray(i32* %op4, i32* %op5)
	ld.d $a0, $fp, -56
	ld.d $a1, $fp, -64
	bl funArray
	st.w $a0, $fp, -68
# ret i32 %op6
	ld.w $a0, $fp, -68
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 80
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
