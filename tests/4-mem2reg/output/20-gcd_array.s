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
	addi.d $sp, $sp, -64
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.gcd_label_entry:
# %op2 = icmp eq i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bb
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
	beqz $t0, .gcd_label_etrueBB
	b .gcd_label_eefalseBB
.gcd_label_etrueBB:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	b gcd_exit
.gcd_label_eefalseBB:
# %op5 = sdiv i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# %op6 = mul i32 %op5, %arg1
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -24
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op7 = sub i32 %arg0, %op6
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -44
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op8 = call i32 @gcd(i32 %arg1, i32 %op7)
	ld.w $a0, $fp, -24
	ld.w $a1, $fp, -48
	bl gcd
	st.w $a0, $fp, -52
# ret i32 %op8
	ld.w $a0, $fp, -52
	b gcd_exit
gcd_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 64
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
	addi.d $sp, $sp, -96
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.funArray_label_entry:
# %op2 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -33
# br i1 %op2, label %label_eeetrueBB, label %label_eeeefalseBB
	ld.b $t0, $fp, -33
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
# %op3 = getelementptr i32, i32* %arg0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -48
# %op4 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -52
# %op5 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	bge $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -53
# br i1 %op5, label %label_eeeeeetrueBB, label %label_eeeeeeefalseBB
	ld.b $t0, $fp, -53
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
# %op6 = getelementptr i32, i32* %arg1, i32 0
	ld.d $t0, $fp, -32
	addi.w $t2, $zero, 0
	lu12i.w $t1, 0
	ori $t1, $t1, 4
	mul.w $t3, $t2, $t1
	add.d $t4, $t0, $t3
	st.d $t4, $fp, -64
# %op7 = load i32, i32* %op6
	ld.d $t0, $fp, -64
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op8 = icmp slt i32 %op4, %op7
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -68
	blt $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -69
# %op9 = zext i1 %op8 to i32
	ld.b $t0, $fp, -69
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -76
# %op10 = icmp eq i32 %op9, 0
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -77
# br i1 %op10, label %label_eeeeeeeeeeretBB, label %label_eeeeeeeeetrueBB
	ld.w $t0, $fp, -68
	st.w $t0, $fp, -84
	ld.w $t0, $fp, -52
	st.w $t0, $fp, -88
	ld.b $t0, $fp, -77
	andi $t0, $t0, 1
	beqz $t0, .funArray_label_eeeeeeeeetrueBB
	b .funArray_label_eeeeeeeeeeretBB
.funArray_label_eeeeeeeeetrueBB:
# br label %label_eeeeeeeeeeretBB
	ld.w $t0, $fp, -52
	st.w $t0, $fp, -84
	ld.w $t0, $fp, -68
	st.w $t0, $fp, -88
	b .funArray_label_eeeeeeeeeeretBB
.funArray_label_eeeeeeeeeeretBB:
# %op11 = phi i32 [ %op7, %label_eeeeeeeeretBB ], [ %op4, %label_eeeeeeeeetrueBB ]
# %op12 = phi i32 [ %op4, %label_eeeeeeeeretBB ], [ %op7, %label_eeeeeeeeetrueBB ]
# %op13 = call i32 @gcd(i32 %op12, i32 %op11)
	ld.w $a0, $fp, -88
	ld.w $a1, $fp, -84
	bl gcd
	st.w $a0, $fp, -92
# ret i32 %op13
	ld.w $a0, $fp, -92
	b funArray_exit
funArray_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 96
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
