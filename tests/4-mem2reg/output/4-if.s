	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# %op0 = icmp sgt i32 11, 22
	addi.w $t0, $zero, 11
	addi.w $t1, $zero, 22
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -17
# %op1 = zext i1 %op0 to i32
	ld.b $t0, $fp, -17
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -24
# %op2 = icmp eq i32 %op1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -25
# br i1 %op2, label %label_eefalseBB, label %label_etrueBB
	ld.b $t0, $fp, -25
	andi $t0, $t0, 1
	beqz $t0, .main_label_etrueBB
	b .main_label_eefalseBB
.main_label_etrueBB:
# %op3 = icmp sgt i32 11, 33
	addi.w $t0, $zero, 11
	addi.w $t1, $zero, 33
	blt $t1, $t0, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -26
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -26
	andi $t0, $t0, 1
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -32
# %op5 = icmp eq i32 %op4, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbb
.store_1bbbbb:
	addi.w $t2, $zero, 1
.toendbbbbb:
	st.b $t2, $fp, -33
# br i1 %op5, label %label_eeeefalseBB, label %label_eeetrueBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeetrueBB
	b .main_label_eeeefalseBB
.main_label_eefalseBB:
# %op6 = icmp slt i32 33, 22
	addi.w $t0, $zero, 33
	addi.w $t1, $zero, 22
	blt $t0, $t1, .store_1bbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbb
.store_1bbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbb:
	st.b $t2, $fp, -34
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -34
	andi $t0, $t0, 1
	beqz $t0, .store_0aaaa
	addi.w $t1, $zero, 1
	b .toendaaaa
.store_0aaaa:
	addi.w $t1, $zero, 0
.toendaaaa:
	st.w $t1, $fp, -40
# %op8 = icmp eq i32 %op7, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbb
	addi.w $t2, $zero, 0
	b .toendbbbbbbb
.store_1bbbbbbb:
	addi.w $t2, $zero, 1
.toendbbbbbbb:
	st.b $t2, $fp, -41
# br i1 %op8, label %label_eeeeeeeefalseBB, label %label_eeeeeeetrueBB
	ld.b $t0, $fp, -41
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeeetrueBB
	b .main_label_eeeeeeeefalseBB
.main_label_eeetrueBB:
# call void @output(i32 11)
	addi.w $a0, $zero, 11
	bl output
# br label %label_eeeeeretBB
	b .main_label_eeeeeretBB
.main_label_eeeefalseBB:
# call void @output(i32 33)
	addi.w $a0, $zero, 33
	bl output
# br label %label_eeeeeretBB
	b .main_label_eeeeeretBB
.main_label_eeeeeretBB:
# br label %label_eeeeeeretBB
	b .main_label_eeeeeeretBB
.main_label_eeeeeeretBB:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label_eeeeeeetrueBB:
# call void @output(i32 22)
	addi.w $a0, $zero, 22
	bl output
# br label %label_eeeeeeeeeretBB
	b .main_label_eeeeeeeeeretBB
.main_label_eeeeeeeefalseBB:
# call void @output(i32 33)
	addi.w $a0, $zero, 33
	bl output
# br label %label_eeeeeeeeeretBB
	b .main_label_eeeeeeeeeretBB
.main_label_eeeeeeeeeretBB:
# br label %label_eeeeeeretBB
	b .main_label_eeeeeeretBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 48
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
