	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# br label %label_ewhileBB
	addi.w $t0, $zero, 10
	st.w $t0, $fp, -24
	b .main_label_ewhileBB
.main_label_ewhileBB:
# %op0 = phi i32 [ %op5, %label_eeeeeefalseBB ], [ undef, %label_entry ]
# %op1 = phi i32 [ 10, %label_entry ], [ %op3, %label_eeeeeefalseBB ]
# %op2 = icmp sgt i32 %op1, zeroinitializer
	ld.w $t0, $fp, -24
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -25
# br i1 %op2, label %label_eetrueBB, label %label_eeefalseBB
	ld.b $t0, $fp, -25
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeefalseBB
	b .main_label_eetrueBB
.main_label_eetrueBB:
# %op3 = sub i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -32
# br label %label_eeeewhileBB
	ld.w $t0, $fp, -32
	st.w $t0, $fp, -40
	b .main_label_eeeewhileBB
.main_label_eeefalseBB:
# %op4 = add i32 %op1, %op0
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -20
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# ret i32 %op4
	ld.w $a0, $fp, -36
	b main_exit
.main_label_eeeewhileBB:
# %op5 = phi i32 [ %op3, %label_eetrueBB ], [ %op7, %label_eeeeetrueBB ]
# %op6 = icmp sgt i32 %op5, zeroinitializer
	ld.w $t0, $fp, -40
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -41
# br i1 %op6, label %label_eeeeetrueBB, label %label_eeeeeefalseBB
	ld.b $t0, $fp, -41
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeeeefalseBB
	b .main_label_eeeeetrueBB
.main_label_eeeeetrueBB:
# %op7 = sub i32 %op5, 1
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# br label %label_eeeewhileBB
	ld.w $t0, $fp, -48
	st.w $t0, $fp, -40
	b .main_label_eeeewhileBB
.main_label_eeeeeefalseBB:
# br label %label_ewhileBB
	ld.w $t0, $fp, -40
	st.w $t0, $fp, -20
	ld.w $t0, $fp, -32
	st.w $t0, $fp, -24
	b .main_label_ewhileBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 48
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
