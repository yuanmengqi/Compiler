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
# %op2 = alloca i32
	addi.d $t1, $fp, -60
	st.d $t1, $fp, -56
# store i32 0, i32* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 2, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# store i32 1, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -64
# %op4 = icmp eq i32 %op3, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bb
	addi.w $t2, $zero, 0
	b .toendbb
.store_1bb:
	addi.w $t2, $zero, 1
.toendbb:
	st.b $t2, $fp, -65
# br i1 %op4, label %label_eeretBB, label %label_etrueBB
	ld.b $t0, $fp, -65
	andi $t0, $t0, 1
	beqz $t0, .main_label_etrueBB
	b .main_label_eeretBB
.main_label_etrueBB:
# %op5 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -72
# %op6 = icmp eq i32 %op5, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	beq $t0, $t1, .store_1bbb
	addi.w $t2, $zero, 0
	b .toendbbb
.store_1bbb:
	addi.w $t2, $zero, 1
.toendbbb:
	st.b $t2, $fp, -73
# br i1 %op6, label %label_eeeefalseBB, label %label_eeetrueBB
	ld.b $t0, $fp, -73
	andi $t0, $t0, 1
	beqz $t0, .main_label_eeetrueBB
	b .main_label_eeeefalseBB
.main_label_eeretBB:
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $t0, 0
	st.w $t1, $fp, -80
# ret i32 %op7
	ld.w $a0, $fp, -80
	b main_exit
.main_label_eeetrueBB:
# store i32 4, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# br label %label_eeeeeretBB
	b .main_label_eeeeeretBB
.main_label_eeeefalseBB:
# store i32 3, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# br label %label_eeeeeretBB
	b .main_label_eeeeeretBB
.main_label_eeeeeretBB:
# br label %label_eeretBB
	b .main_label_eeretBB
main_exit:
	lu12i.w $t0, 0
	ori $t0, $t0, 80
	add.d $sp, $sp, $t0
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
