	.text
	.globl factorial
	.type factorial, @function
factorial:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
.factorial_label_entry:
# %op1 = alloca i32
	addi.d $t1, $fp, -36
	st.d $t1, $fp, -32
# store i32 %arg0, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -40
# %op3 = icmp eq i32 %op2, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -41
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -41
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -48
# %op5 = icmp eq i32 %op4, 0
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -49
# br i1 %op5, label %label_eefalseBB, label %label_etrueBB
	ld.b $t0, $fp, -49
	andi $t0, $t0, 1
	beqz $t0, .factorial_label_etrueBB
	b .factorial_label_eefalseBB
.factorial_label_etrueBB:
# ret i32 1
	addi.w $a0, $zero, 1
	b factorial_exit
.factorial_label_eefalseBB:
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op7 = sub i32 %op6, 1
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op8 = call i32 @factorial(i32 %op7)
	ld.w $a0, $fp, -60
	bl factorial
	st.w $a0, $fp, -64
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op10 = mul i32 %op9, %op8
	ld.w $t0, $fp, -68
	ld.w $t1, $fp, -64
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# ret i32 %op10
	ld.w $a0, $fp, -72
	b factorial_exit
factorial_exit:
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
# %op0 = alloca i32
	addi.d $t1, $fp, -28
	st.d $t1, $fp, -24
# %op1 = call i32 @factorial(i32 10)
	addi.w $a0, $zero, 10
	bl factorial
	st.w $a0, $fp, -32
# store i32 %op1, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -36
# ret i32 %op2
	ld.w $a0, $fp, -36
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 48
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
