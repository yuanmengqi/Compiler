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
# store i32 2, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op1 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -32
# %op2 = icmp eq i32 %op1, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -33
# br i1 %op2, label %label_eeretBB, label %label_etrueBB
	ld.b $t0, $fp, -33
	andi $t0, $t0, 1
	beqz $t0, .main_label_etrueBB
	b .main_label_eeretBB
.main_label_etrueBB:
# store i32 3, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# br label %label_eeretBB
	b .main_label_eeretBB
.main_label_eeretBB:
# store i32 4, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
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
