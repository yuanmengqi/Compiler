	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
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
# br label %label_ewhileBB
	b .main_label_ewhileBB
.main_label_ewhileBB:
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -48
# %op3 = icmp sgt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -48
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -49
# br i1 %op3, label %label_eetrueBB, label %label_eeefalseBB
	ld.b $t0, $fp, -49
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeefalseBB
	b .main_label_eetrueBB
.main_label_eetrueBB:
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -56
# %op5 = sub i32 %op4, 1
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# store i32 %op5, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -60
	st.w $t1, $t0, 0
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -64
# store i32 %op6, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -64
	st.w $t1, $t0, 0
# br label %label_eeeewhileBB
	b .main_label_eeeewhileBB
.main_label_eeefalseBB:
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -68
# %op8 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op9 = add i32 %op8, %op7
	ld.w $t0, $fp, -72
	ld.w $t1, $fp, -68
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# ret i32 %op9
	ld.w $a0, $fp, -76
	b main_exit
.main_label_eeeewhileBB:
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# %op11 = icmp sgt i32 %op10, zeroinitializer
	ld.w $t0, $fp, -80
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -81
# br i1 %op11, label %label_eeeeetrueBB, label %label_eeeeeefalseBB
	ld.b $t0, $fp, -81
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeefalseBB
	b .main_label_eeeeetrueBB
.main_label_eeeeetrueBB:
# %op12 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -88
# %op13 = sub i32 %op12, 1
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# store i32 %op13, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -92
	st.w $t1, $t0, 0
# br label %label_eeeewhileBB
	b .main_label_eeeewhileBB
.main_label_eeeeeefalseBB:
# br label %label_ewhileBB
	b .main_label_ewhileBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 96
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
