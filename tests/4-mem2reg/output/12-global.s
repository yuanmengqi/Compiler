# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl seed
	.type seed, @object
	.size seed, 4
seed:
	.space 4
	.text
	.globl randomLCG
	.type randomLCG, @function
randomLCG:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.randomLCG_label_entry:
# %op0 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -20
# %op1 = mul i32 %op0, 1103515245
	ld.w $t0, $fp, -20
	lu12i.w $t1, 269412
	ori $t1, $t1, 3693
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# %op2 = add i32 %op1, 12345
	ld.w $t0, $fp, -24
	lu12i.w $t1, 3
	ori $t1, $t1, 57
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# store i32 %op2, i32* @seed
	la.local $t0, seed
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op3 = load i32, i32* @seed
	la.local $t0, seed
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -32
# ret i32 %op3
	ld.w $a0, $fp, -32
	b randomLCG_exit
randomLCG_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 32
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl randBin
	.type randBin, @function
randBin:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.randBin_label_entry:
# %op0 = call i32 @randomLCG()
	bl randomLCG
	st.w $a0, $fp, -20
# %op1 = icmp sgt i32 %op0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -21
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -21
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -28
# %op3 = icmp eq i32 %op2, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -29
# br i1 %op3, label %label_eefalseBB, label %label_etrueBB
	ld.b $t0, $fp, -29
	andi $t0, $t0, 1
	beqz $t0, .randBin_label_etrueBB
	b .randBin_label_eefalseBB
.randBin_label_etrueBB:
# ret i32 1
	addi.w $a0, $zero, 1
	b randBin_exit
.randBin_label_eefalseBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b randBin_exit
randBin_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 32
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl returnToZeroSteps
	.type returnToZeroSteps, @function
returnToZeroSteps:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.returnToZeroSteps_label_entry:
# br label %label_eeewhileBB
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -20
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -24
	b .returnToZeroSteps_label_eeewhileBB
.returnToZeroSteps_label_eeewhileBB:
# %op0 = phi i32 [ 0, %label_entry ], [ %op10, %label_eeeeeeeeeeretBB ]
# %op1 = phi i32 [ 0, %label_entry ], [ %op9, %label_eeeeeeeeeeretBB ]
# %op2 = icmp slt i32 %op0, 20
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 20
	blt $t0, $t1, .store_1bbbb
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
# %op4 = icmp sgt i32 %op3, zeroinitializer
	ld.w $t0, $fp, -32
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -33
# br i1 %op4, label %label_eeeetrueBB, label %label_eeeeefalseBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .returnToZeroSteps_label_eeeeefalseBB
	b .returnToZeroSteps_label_eeeetrueBB
.returnToZeroSteps_label_eeeetrueBB:
# %op5 = call i32 @randBin()
	bl randBin
	st.w $a0, $fp, -40
# %op6 = icmp eq i32 %op5, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -41
# br i1 %op6, label %label_eeeeeeefalseBB, label %label_eeeeeetrueBB
	ld.b $t0, $fp, -41
	andi $t0, $t0, 1
	beqz $t0, .returnToZeroSteps_label_eeeeeetrueBB
	b .returnToZeroSteps_label_eeeeeeefalseBB
.returnToZeroSteps_label_eeeeefalseBB:
# ret i32 20
	addi.w $a0, $zero, 20
	b returnToZeroSteps_exit
.returnToZeroSteps_label_eeeeeetrueBB:
# %op7 = add i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# br label %label_eeeeeeeeretBB
	ld.w $t0, $fp, -48
	st.w $t0, $fp, -56
	b .returnToZeroSteps_label_eeeeeeeeretBB
.returnToZeroSteps_label_eeeeeeefalseBB:
# %op8 = sub i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# br label %label_eeeeeeeeretBB
	ld.w $t0, $fp, -52
	st.w $t0, $fp, -56
	b .returnToZeroSteps_label_eeeeeeeeretBB
.returnToZeroSteps_label_eeeeeeeeretBB:
# %op9 = phi i32 [ %op7, %label_eeeeeetrueBB ], [ %op8, %label_eeeeeeefalseBB ]
# %op10 = add i32 %op0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op11 = icmp eq i32 %op9, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -61
# %op12 = zext i1 %op11 to i32
	ld.b $t0, $fp, -61
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaa
	addi.w $t1, $zero, 1
	b .toendaaaa
.store_0aaaa:
	addi.w $t1, $zero, 0
.toendaaaa:
	st.w $t1, $fp, -68
# %op13 = icmp eq i32 %op12, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbb
.store_1bbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbb:
	st.b $t2, $fp, -69
# br i1 %op13, label %label_eeeeeeeeeeretBB, label %label_eeeeeeeeetrueBB
	ld.b $t0, $fp, -69
	andi $t0, $t0, 1
	beqz $t0, .returnToZeroSteps_label_eeeeeeeeetrueBB
	b .returnToZeroSteps_label_eeeeeeeeeeretBB
.returnToZeroSteps_label_eeeeeeeeetrueBB:
# ret i32 %op10
	ld.w $a0, $fp, -60
	b returnToZeroSteps_exit
.returnToZeroSteps_label_eeeeeeeeeeretBB:
# br label %label_eeewhileBB
	ld.w $t0, $fp, -60
	st.w $t0, $fp, -20
	ld.w $t0, $fp, -56
	st.w $t0, $fp, -24
	b .returnToZeroSteps_label_eeewhileBB
returnToZeroSteps_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 80
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
	addi.d $sp, $sp, -48
.main_label_entry:
# store i32 3407, i32* @seed
	la.local $t0, seed
	lu12i.w $t1, 0
	ori $t1, $t1, 3407
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeeewhileBB
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -20
	b .main_label_eeeeeeeeeeewhileBB
.main_label_eeeeeeeeeeewhileBB:
# %op0 = phi i32 [ 0, %label_entry ], [ %op5, %label_eeeeeeeeeeeetrueBB ]
# %op1 = icmp slt i32 %op0, 20
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 20
	blt $t0, $t1, .store_1bbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbb
.store_1bbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbb:
	st.b $t2, $fp, -21
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -21
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaaa
	addi.w $t1, $zero, 1
	b .toendaaaaa
.store_0aaaaa:
	addi.w $t1, $zero, 0
.toendaaaaa:
	st.w $t1, $fp, -28
# %op3 = icmp sgt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -28
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbb
.store_1bbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbb:
	st.b $t2, $fp, -29
# br i1 %op3, label %label_eeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -29
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeetrueBB:
# %op4 = call i32 @returnToZeroSteps()
	bl returnToZeroSteps
	st.w $a0, $fp, -36
# call void @output(i32 %op4)
	ld.w $a0, $fp, -36
	bl output
# %op5 = add i32 %op0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# br label %label_eeeeeeeeeeewhileBB
	ld.w $t0, $fp, -40
	st.w $t0, $fp, -20
	b .main_label_eeeeeeeeeeewhileBB
.main_label_eeeeeeeeeeeeefalseBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 48
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
