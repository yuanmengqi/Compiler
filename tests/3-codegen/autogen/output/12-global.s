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
.randBin_label_eeeretBB:
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
	addi.d $sp, $sp, -112
.returnToZeroSteps_label_entry:
# %op0 = alloca i32
	addi.d $t1, $fp, -28
	st.d $t1, $fp, -24
# %op1 = alloca i32
	addi.d $t1, $fp, -44
	st.d $t1, $fp, -40
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_eeeewhileBB
	b .returnToZeroSteps_label_eeeewhileBB
.returnToZeroSteps_label_eeeewhileBB:
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# %op3 = icmp slt i32 %op2, 20
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 20
	blt $t0, $t1, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -49
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -49
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -56
# %op5 = icmp sgt i32 %op4, zeroinitializer
	ld.w $t0, $fp, -56
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -57
# br i1 %op5, label %label_eeeeetrueBB, label %label_eeeeeefalseBB
	ld.b $t0, $fp, -57
	andi $t0, $t0, 1
	beqz $t0, .returnToZeroSteps_label_eeeeeefalseBB
	b .returnToZeroSteps_label_eeeeetrueBB
.returnToZeroSteps_label_eeeeetrueBB:
# %op6 = call i32 @randBin()
	bl randBin
	st.w $a0, $fp, -64
# %op7 = icmp eq i32 %op6, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -65
# br i1 %op7, label %label_eeeeeeeefalseBB, label %label_eeeeeeetrueBB
	ld.b $t0, $fp, -65
	andi $t0, $t0, 1
	beqz $t0, .returnToZeroSteps_label_eeeeeeetrueBB
	b .returnToZeroSteps_label_eeeeeeeefalseBB
.returnToZeroSteps_label_eeeeeefalseBB:
# ret i32 20
	addi.w $a0, $zero, 20
	b returnToZeroSteps_exit
.returnToZeroSteps_label_eeeeeeetrueBB:
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op9 = add i32 %op8, 1
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# store i32 %op9, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -76
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeretBB
	b .returnToZeroSteps_label_eeeeeeeeeretBB
.returnToZeroSteps_label_eeeeeeeefalseBB:
# %op10 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op11 = sub i32 %op10, 1
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# store i32 %op11, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -84
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeretBB
	b .returnToZeroSteps_label_eeeeeeeeeretBB
.returnToZeroSteps_label_eeeeeeeeeretBB:
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op13 = add i32 %op12, 1
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# store i32 %op13, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -92
	st.w $t1, $t0, 0
# %op14 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -96
# %op15 = icmp eq i32 %op14, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -97
# %op16 = zext i1 %op15 to i32
	ld.b $t0, $fp, -97
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaa
	addi.w $t1, $zero, 1
	b .toendaaaa
.store_0aaaa:
	addi.w $t1, $zero, 0
.toendaaaa:
	st.w $t1, $fp, -104
# %op17 = icmp eq i32 %op16, 0
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbb
.store_1bbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbb:
	st.b $t2, $fp, -105
# br i1 %op17, label %label_eeeeeeeeeeeretBB, label %label_eeeeeeeeeetrueBB
	ld.b $t0, $fp, -105
	andi $t0, $t0, 1
	beqz $t0, .returnToZeroSteps_label_eeeeeeeeeetrueBB
	b .returnToZeroSteps_label_eeeeeeeeeeeretBB
.returnToZeroSteps_label_eeeeeeeeeetrueBB:
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -112
# ret i32 %op18
	ld.w $a0, $fp, -112
	b returnToZeroSteps_exit
.returnToZeroSteps_label_eeeeeeeeeeeretBB:
# br label %label_eeeewhileBB
	b .returnToZeroSteps_label_eeeewhileBB
returnToZeroSteps_exit:
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
	addi.d $sp, $sp, -64
.main_label_entry:
# %op0 = alloca i32
	addi.d $t1, $fp, -28
	st.d $t1, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 3407, i32* @seed
	la.local $t0, seed
	lu12i.w $t1, 0
	ori $t1, $t1, 3407
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeeeewhileBB
	b .main_label_eeeeeeeeeeeewhileBB
.main_label_eeeeeeeeeeeewhileBB:
# %op1 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -32
# %op2 = icmp slt i32 %op1, 20
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 20
	blt $t0, $t1, .store_1bbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbb
.store_1bbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbb:
	st.b $t2, $fp, -33
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaaa
	addi.w $t1, $zero, 1
	b .toendaaaaa
.store_0aaaaa:
	addi.w $t1, $zero, 0
.toendaaaaa:
	st.w $t1, $fp, -40
# %op4 = icmp sgt i32 %op3, zeroinitializer
	ld.w $t0, $fp, -40
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbbbbb
.store_1bbbbbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbbbbb:
	st.b $t2, $fp, -41
# br i1 %op4, label %label_eeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeefalseBB
	ld.b $t0, $fp, -41
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeeeeeeefalseBB
	b .main_label_eeeeeeeeeeeeetrueBB
.main_label_eeeeeeeeeeeeetrueBB:
# %op5 = call i32 @returnToZeroSteps()
	bl returnToZeroSteps
	st.w $a0, $fp, -48
# call void @output(i32 %op5)
	ld.w $a0, $fp, -48
	bl output
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -52
# %op7 = add i32 %op6, 1
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# store i32 %op7, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -56
	st.w $t1, $t0, 0
# br label %label_eeeeeeeeeeeewhileBB
	b .main_label_eeeeeeeeeeeewhileBB
.main_label_eeeeeeeeeeeeeefalseBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 64
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
