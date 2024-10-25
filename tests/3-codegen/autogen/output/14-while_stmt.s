	.text
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
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# br label %label_ewhileBB
	b .main_label_ewhileBB
.main_label_ewhileBB:
# %op1 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -32
# %op2 = icmp sgt i32 %op1, zeroinitializer
	ld.w $t0, $fp, -32
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -33
# br i1 %op2, label %label_eetrueBB, label %label_eeefalseBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeefalseBB
	b .main_label_eetrueBB
.main_label_eetrueBB:
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -40
# %op4 = sub i32 %op3, 1
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# store i32 %op4, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -44
	st.w $t1, $t0, 0
# br label %label_ewhileBB
	b .main_label_ewhileBB
.main_label_eeefalseBB:
# ret void
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 48
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
