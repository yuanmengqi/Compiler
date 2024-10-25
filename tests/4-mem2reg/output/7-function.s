	.text
	.globl min
	.type min, @function
min:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.min_label_entry:
# %op2 = icmp sle i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	bge $t1, $t0, .store_1bb
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
	beqz $t0, .min_label_etrueBB
	b .min_label_eefalseBB
.min_label_etrueBB:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	b min_exit
.min_label_eefalseBB:
# ret i32 %arg1
	ld.w $a0, $fp, -24
	b min_exit
min_exit:
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
# %op0 = call i32 @min(i32 11, i32 22)
	addi.w $a0, $zero, 11
	addi.w $a1, $zero, 22
	bl min
	st.w $a0, $fp, -20
# call void @output(i32 %op0)
	ld.w $a0, $fp, -20
	bl output
# %op1 = call i32 @min(i32 22, i32 33)
	addi.w $a0, $zero, 22
	addi.w $a1, $zero, 33
	bl min
	st.w $a0, $fp, -24
# call void @output(i32 %op1)
	ld.w $a0, $fp, -24
	bl output
# %op2 = call i32 @min(i32 33, i32 11)
	addi.w $a0, $zero, 33
	addi.w $a1, $zero, 11
	bl min
	st.w $a0, $fp, -28
# call void @output(i32 %op2)
	ld.w $a0, $fp, -28
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 32
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
