	.text
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
# br label %label_ewhileBB
	b .main_label_ewhileBB
.main_label_ewhileBB:
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
	blt $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -53
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -53
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -60
# %op6 = icmp sgt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -60
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -61
# br i1 %op6, label %label_eetrueBB, label %label_eeefalseBB
	ld.b $t0, $fp, -61
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeefalseBB
	b .main_label_eetrueBB
.main_label_eetrueBB:
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# call void @output(i32 %op7)
	ld.w $a0, $fp, -68
	bl output
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op9 = add i32 %op8, 1
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# store i32 %op9, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -76
	st.w $t1, $t0, 0
# br label %label_ewhileBB
	b .main_label_ewhileBB
.main_label_eeefalseBB:
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
