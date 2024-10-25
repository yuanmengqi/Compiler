	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
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
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# br label %label_ewhileBB
	b .main_label_ewhileBB
.main_label_ewhileBB:
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -64
# %op4 = icmp sgt i32 %op3, zeroinitializer
	ld.w $t0, $fp, -64
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -65
# br i1 %op4, label %label_eetrueBB, label %label_eeefalseBB
	ld.b $t0, $fp, -65
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeefalseBB
	b .main_label_eetrueBB
.main_label_eetrueBB:
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op6 = sub i32 %op5, 1
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# store i32 %op6, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -76
	st.w $t1, $t0, 0
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op8 = icmp slt i32 %op7, 5
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 5
	blt $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -81
# %op9 = zext i1 %op8 to i32
	ld.b $t0, $fp, -81
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -88
# %op10 = icmp eq i32 %op9, 0
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -89
# br i1 %op10, label %label_eeeeefalseBB, label %label_eeeetrueBB
	ld.b $t0, $fp, -89
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeetrueBB
	b .main_label_eeeeefalseBB
.main_label_eeefalseBB:
# %op11 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -96
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -100
# %op13 = add i32 %op12, %op11
	ld.w $t0, $fp, -100
	ld.w $t1, $fp, -96
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -104
# ret i32 %op13
	ld.w $a0, $fp, -104
	b main_exit
.main_label_eeeetrueBB:
# %op14 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -108
# %op15 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -112
# %op16 = add i32 %op15, %op14
	ld.w $t0, $fp, -112
	ld.w $t1, $fp, -108
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# store i32 %op16, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -116
	st.w $t1, $t0, 0
# br label %label_eeeeeeretBB
	b .main_label_eeeeeeretBB
.main_label_eeeeefalseBB:
# %op17 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -120
# %op18 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -124
# %op19 = add i32 %op18, %op17
	ld.w $t0, $fp, -124
	ld.w $t1, $fp, -120
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# store i32 %op19, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -128
	st.w $t1, $t0, 0
# br label %label_eeeeeeretBB
	b .main_label_eeeeeeretBB
.main_label_eeeeeeretBB:
# br label %label_ewhileBB
	b .main_label_ewhileBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 128
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
