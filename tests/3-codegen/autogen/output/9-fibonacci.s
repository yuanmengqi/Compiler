	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
	st.w $a0, $fp, -20
.fibonacci_label_entry:
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
	beqz $t0, .fibonacci_label_etrueBB
	b .fibonacci_label_eefalseBB
.fibonacci_label_etrueBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_exit
.fibonacci_label_eefalseBB:
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op7 = icmp eq i32 %op6, 1
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 1
	beq $t0, $t1, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -57
# %op8 = zext i1 %op7 to i32
	ld.b $t0, $fp, -57
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -64
# %op9 = icmp eq i32 %op8, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -65
# br i1 %op9, label %label_eeeeefalseBB, label %label_eeeetrueBB
	ld.b $t0, $fp, -65
	andi $t0, $t0, 1
	beqz $t0, .fibonacci_label_eeeetrueBB
	b .fibonacci_label_eeeeefalseBB
.fibonacci_label_eeeretBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_exit
.fibonacci_label_eeeetrueBB:
# ret i32 1
	addi.w $a0, $zero, 1
	b fibonacci_exit
.fibonacci_label_eeeeefalseBB:
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op11 = sub i32 %op10, 2
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op12 = call i32 @fibonacci(i32 %op11)
	ld.w $a0, $fp, -76
	bl fibonacci
	st.w $a0, $fp, -80
# %op13 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -84
# %op14 = sub i32 %op13, 1
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -88
# %op15 = call i32 @fibonacci(i32 %op14)
	ld.w $a0, $fp, -88
	bl fibonacci
	st.w $a0, $fp, -92
# %op16 = add i32 %op15, %op12
	ld.w $t0, $fp, -92
	ld.w $t1, $fp, -80
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# ret i32 %op16
	ld.w $a0, $fp, -96
	b fibonacci_exit
.fibonacci_label_eeeeeeretBB:
# br label %label_eeeretBB
	b .fibonacci_label_eeeretBB
fibonacci_exit:
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
# %op0 = alloca i32
	addi.d $t1, $fp, -28
	st.d $t1, $fp, -24
# %op1 = alloca i32
	addi.d $t1, $fp, -44
	st.d $t1, $fp, -40
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label_eeeeeeewhileBB
	b .main_label_eeeeeeewhileBB
.main_label_eeeeeeewhileBB:
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -52
# %op4 = icmp slt i32 %op2, %op3
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -52
	blt $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -53
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -53
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaa
	addi.w $t1, $zero, 1
	b .toendaaaa
.store_0aaaa:
	addi.w $t1, $zero, 0
.toendaaaa:
	st.w $t1, $fp, -60
# %op6 = icmp sgt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -60
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -61
# br i1 %op6, label %label_eeeeeeeetrueBB, label %label_eeeeeeeeefalseBB
	ld.b $t0, $fp, -61
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeeeefalseBB
	b .main_label_eeeeeeeetrueBB
.main_label_eeeeeeeetrueBB:
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op8 = call i32 @fibonacci(i32 %op7)
	ld.w $a0, $fp, -68
	bl fibonacci
	st.w $a0, $fp, -72
# call void @output(i32 %op8)
	ld.w $a0, $fp, -72
	bl output
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -76
# %op10 = add i32 %op9, 1
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# store i32 %op10, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -80
	st.w $t1, $t0, 0
# br label %label_eeeeeeewhileBB
	b .main_label_eeeeeeewhileBB
.main_label_eeeeeeeeefalseBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 80
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
