	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
	st.w $a0, $fp, -20
.fibonacci_label_entry:
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
	beqz $t0, .fibonacci_label_etrueBB
	b .fibonacci_label_eefalseBB
.fibonacci_label_etrueBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_exit
.fibonacci_label_eefalseBB:
# %op4 = icmp eq i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	beq $t0, $t1, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -30
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -30
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -36
# %op6 = icmp eq i32 %op5, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -37
# br i1 %op6, label %label_eeeefalseBB, label %label_eeetrueBB
	ld.b $t0, $fp, -37
	andi $t0, $t0, 1
	beqz $t0, .fibonacci_label_eeetrueBB
	b .fibonacci_label_eeeefalseBB
.fibonacci_label_eeetrueBB:
# ret i32 1
	addi.w $a0, $zero, 1
	b fibonacci_exit
.fibonacci_label_eeeefalseBB:
# %op7 = sub i32 %arg0, 2
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op8 = call i32 @fibonacci(i32 %op7)
	ld.w $a0, $fp, -44
	bl fibonacci
	st.w $a0, $fp, -48
# %op9 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op10 = call i32 @fibonacci(i32 %op9)
	ld.w $a0, $fp, -52
	bl fibonacci
	st.w $a0, $fp, -56
# %op11 = add i32 %op10, %op8
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -48
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# ret i32 %op11
	ld.w $a0, $fp, -60
	b fibonacci_exit
fibonacci_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 64
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
# br label %label_eeeeewhileBB
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -20
	b .main_label_eeeeewhileBB
.main_label_eeeeewhileBB:
# %op0 = phi i32 [ 0, %label_entry ], [ %op5, %label_eeeeeetrueBB ]
# %op1 = icmp slt i32 %op0, 10
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 10
	blt $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -21
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -21
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaa
	addi.w $t1, $zero, 1
	b .toendaaaa
.store_0aaaa:
	addi.w $t1, $zero, 0
.toendaaaa:
	st.w $t1, $fp, -28
# %op3 = icmp sgt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -28
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -29
# br i1 %op3, label %label_eeeeeetrueBB, label %label_eeeeeeefalseBB
	ld.b $t0, $fp, -29
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeefalseBB
	b .main_label_eeeeeetrueBB
.main_label_eeeeeetrueBB:
# %op4 = call i32 @fibonacci(i32 %op0)
	ld.w $a0, $fp, -20
	bl fibonacci
	st.w $a0, $fp, -36
# call void @output(i32 %op4)
	ld.w $a0, $fp, -36
	bl output
# %op5 = add i32 %op0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# br label %label_eeeeewhileBB
	ld.w $t0, $fp, -40
	st.w $t0, $fp, -20
	b .main_label_eeeeewhileBB
.main_label_eeeeeeefalseBB:
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
