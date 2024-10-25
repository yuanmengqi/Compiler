	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# br label %label_ewhileBB
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -20
	addi.w $t0, $zero, 10
	st.w $t0, $fp, -24
	addi.w $t0, $zero, 0
	st.w $t0, $fp, -28
	b .main_label_ewhileBB
.main_label_ewhileBB:
# %op0 = phi i32 [ 0, %label_entry ], [ %op11, %label_eeeeeeretBB ]
# %op1 = phi i32 [ 10, %label_entry ], [ %op4, %label_eeeeeeretBB ]
# %op2 = phi i32 [ 0, %label_entry ], [ %op12, %label_eeeeeeretBB ]
# %op3 = icmp sgt i32 %op1, zeroinitializer
	ld.w $t0, $fp, -24
	lu12i.w $t1, 0
	ori $t1, $t1, 0
	blt $t1, $t0, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -29
# br i1 %op3, label %label_eetrueBB, label %label_eeefalseBB
	ld.b $t0, $fp, -29
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeefalseBB
	b .main_label_eetrueBB
.main_label_eetrueBB:
# %op4 = sub i32 %op1, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# %op5 = icmp slt i32 %op4, 5
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 5
	blt $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -37
# %op6 = zext i1 %op5 to i32
	ld.b $t0, $fp, -37
	andi $t0, $t0, 1
	beqz $t0, .store_0aa
	addi.w $t1, $zero, 1
	b .toendaa
.store_0aa:
	addi.w $t1, $zero, 0
.toendaa:
	st.w $t1, $fp, -44
# %op7 = icmp eq i32 %op6, 0
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbbb
	addi.w $t2, $zero, 0
	b .toendbbbb
.store_1bbbb:
	addi.w $t2, $zero, 1
.toendbbbb:
	st.b $t2, $fp, -45
# br i1 %op7, label %label_eeeeefalseBB, label %label_eeeetrueBB
	ld.b $t0, $fp, -45
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeeetrueBB
	b .main_label_eeeeefalseBB
.main_label_eeefalseBB:
# %op8 = add i32 %op0, %op2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -28
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# ret i32 %op8
	ld.w $a0, $fp, -52
	b main_exit
.main_label_eeeetrueBB:
# %op9 = add i32 %op0, %op4
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -36
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# br label %label_eeeeeeretBB
	ld.w $t0, $fp, -56
	st.w $t0, $fp, -64
	ld.w $t0, $fp, -28
	st.w $t0, $fp, -68
	b .main_label_eeeeeeretBB
.main_label_eeeeefalseBB:
# %op10 = add i32 %op2, %op4
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -36
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# br label %label_eeeeeeretBB
	ld.w $t0, $fp, -20
	st.w $t0, $fp, -64
	ld.w $t0, $fp, -60
	st.w $t0, $fp, -68
	b .main_label_eeeeeeretBB
.main_label_eeeeeeretBB:
# %op11 = phi i32 [ %op9, %label_eeeetrueBB ], [ %op0, %label_eeeeefalseBB ]
# %op12 = phi i32 [ %op2, %label_eeeetrueBB ], [ %op10, %label_eeeeefalseBB ]
# br label %label_ewhileBB
	ld.w $t0, $fp, -64
	st.w $t0, $fp, -20
	ld.w $t0, $fp, -36
	st.w $t0, $fp, -24
	ld.w $t0, $fp, -68
	st.w $t0, $fp, -28
	b .main_label_ewhileBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 80
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
