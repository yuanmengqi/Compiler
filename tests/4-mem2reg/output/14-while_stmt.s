	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# br label %label_ewhileBB
	addi.w $t0, $zero, 10
	st.w $t0, $fp, -20
	b .main_label_ewhileBB
.main_label_ewhileBB:
# %op0 = phi i32 [ 10, %label_entry ], [ %op2, %label_eetrueBB ]
# %op1 = icmp sgt i32 %op0, zeroinitializer
	ld.w $t0, $fp, -20
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -21
# br i1 %op1, label %label_eetrueBB, label %label_eeefalseBB
	ld.b $t0, $fp, -21
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeefalseBB
	b .main_label_eetrueBB
.main_label_eetrueBB:
# %op2 = sub i32 %op0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# br label %label_ewhileBB
	ld.w $t0, $fp, -28
	st.w $t0, $fp, -20
	b .main_label_ewhileBB
.main_label_eeefalseBB:
# ret void
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 32
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
