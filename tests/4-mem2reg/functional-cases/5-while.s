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
	addi.w $t0, $zero, 0
	st.d $t0, $fp, -24
	b .main_label_ewhileBB
.main_label_ewhileBB:
# %op0 = phi i32 [ 0, %label_entry ], [ %op4, %label_eetrueBB ]
# %op1 = icmp slt i32* %op0, i32 10
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	blt $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -25
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -25
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -32
# %op3 = icmp sgt i32 %op2, zeroinitializer
	ld.w $t0, $fp, -32
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -33
# br i1 %op3, label %label_eetrueBB, label %label_eeefalseBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeefalseBB
	b .main_label_eetrueBB
.main_label_eetrueBB:
# call void @output(i32* %op0)
	ld.d $a0, $fp, -24
	bl output
# %op4 = add i32* %op0, i32 1
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# br label %label_ewhileBB
	ld.w $t0, $fp, -40
	st.d $t0, $fp, -24
	b .main_label_ewhileBB
.main_label_eeefalseBB:
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
