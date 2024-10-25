	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = alloca i32
	addi.d $t1, $fp, -28
	st.d $t1, $fp, -24
# %op1 = alloca i32
	addi.d $t1, $fp, -44
	st.d $t1, $fp, -40
# %op2 = alloca i32
	addi.d $t1, $fp, -60
	st.d $t1, $fp, -56
# store i32 11, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# store i32 22, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# store i32 33, i32* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -64
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op5 = icmp sgt i32 %op3, %op4
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -68
	blt $t1, $t0, .store_1bb
.store_1bb:
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -69
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -76
# %op7 = icmp eq i32 %op6, 0
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbb
.store_1bbb:
# br i1 %op7, label %label_eefalseBB, label %label_etrueBB
	ld.b $t0, $fp, -77
	bnez $t0, .main_label_etrueBB
	b .main_label_eefalseBB
.main_label_etrueBB:
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -84
# %op9 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op10 = icmp sgt i32 %op8, %op9
	ld.w $t0, $fp, -84
	ld.w $t1, $fp, -88
	blt $t1, $t0, .store_1bbbb
.store_1bbbb:
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -89
	beqz $t0, .store_0aaa
	addi.w $t1, $zero, 1
	b .toendaaa
.store_0aaa:
	addi.w $t1, $zero, 0
.toendaaa:
	st.w $t1, $fp, -96
# %op12 = icmp eq i32 %op11, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbb
.store_1bbbbb:
# br i1 %op12, label %label_eeeeefalseBB, label %label_eeeetrueBB
	ld.b $t0, $fp, -97
	bnez $t0, .main_label_eeeetrueBB
	b .main_label_eeeeefalseBB
.main_label_eefalseBB:
# %op13 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -104
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# %op15 = icmp slt i32 %op13, %op14
	ld.w $t0, $fp, -104
	ld.w $t1, $fp, -108
	blt $t0, $t1, .store_1bbbbbb
.store_1bbbbbb:
# %op16 = zext i1 %op15 to i32
	ld.b $t0, $fp, -109
	beqz $t0, .store_0aaaa
	addi.w $t1, $zero, 1
	b .toendaaaa
.store_0aaaa:
	addi.w $t1, $zero, 0
.toendaaaa:
	st.w $t1, $fp, -116
# %op17 = icmp eq i32 %op16, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbbbbb
.store_1bbbbbbb:
# br i1 %op17, label %label_eeeeeeeefalseBB, label %label_eeeeeeetrueBB
	ld.b $t0, $fp, -117
	bnez $t0, .main_label_eeeeeeetrueBB
	b .main_label_eeeeeeeefalseBB
.main_label_eeeretBB:
# ret i32 0
	addi.w $a0, $zero, 0
.main_label_eeeetrueBB:
# %op18 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# call void @output(i32 %op18)
	ld.w $a0, $fp, -124
	bl output
# br label %label_eeeeeeretBB
	b .main_label_eeeeeeretBB
.main_label_eeeeefalseBB:
# %op19 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -128
# call void @output(i32 %op19)
	ld.w $a0, $fp, -128
	bl output
# br label %label_eeeeeeretBB
	b .main_label_eeeeeeretBB
.main_label_eeeeeeretBB:
# br label %label_eeeretBB
	b .main_label_eeeretBB
.main_label_eeeeeeetrueBB:
# %op20 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -132
# call void @output(i32 %op20)
	ld.w $a0, $fp, -132
	bl output
# br label %label_eeeeeeeeeretBB
	b .main_label_eeeeeeeeeretBB
.main_label_eeeeeeeefalseBB:
# %op21 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -136
# call void @output(i32 %op21)
	ld.w $a0, $fp, -136
	bl output
# br label %label_eeeeeeeeeretBB
	b .main_label_eeeeeeeeeretBB
.main_label_eeeeeeeeeretBB:
# br label %label_eeeretBB
	b .main_label_eeeretBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 144
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
