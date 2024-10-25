	.text
	.globl factorial
	.type factorial, @function
factorial:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
.factorial_label_entry:
# %op1 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bb
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
	beqz $t0, .factorial_label_etrueBB
	b .factorial_label_eefalseBB
.factorial_label_etrueBB:
# ret i32 1
	addi.w $a0, $zero, 1
	b factorial_exit
.factorial_label_eefalseBB:
# %op4 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# %op5 = call i32 @factorial(i32 %op4)
	ld.w $a0, $fp, -36
	bl factorial
	st.w $a0, $fp, -40
# %op6 = mul i32 %arg0, %op5
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# ret i32 %op6
	ld.w $a0, $fp, -44
	b factorial_exit
factorial_exit:
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
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = call i32 @factorial(i32 10)
	addi.w $a0, $zero, 10
	bl factorial
	st.w $a0, $fp, -20
# ret i32 %op0
	ld.w $a0, $fp, -20
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 32
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
