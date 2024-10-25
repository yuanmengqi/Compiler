; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/4-if.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 11, i32* %op0
  store i32 22, i32* %op1
  store i32 33, i32* %op2
  %op3 = load i32, i32* %op0
  %op4 = load i32, i32* %op1
  %op5 = icmp sgt i32 %op3, %op4
  %op6 = zext i1 %op5 to i32
  %op7 = icmp eq i32 %op6, 0
  br i1 %op7, label %label_eefalseBB, label %label_etrueBB
label_etrueBB:                                                ; preds = %label_entry
  %op8 = load i32, i32* %op0
  %op9 = load i32, i32* %op2
  %op10 = icmp sgt i32 %op8, %op9
  %op11 = zext i1 %op10 to i32
  %op12 = icmp eq i32 %op11, 0
  br i1 %op12, label %label_eeeeefalseBB, label %label_eeeetrueBB
label_eefalseBB:                                                ; preds = %label_entry
  %op13 = load i32, i32* %op2
  %op14 = load i32, i32* %op1
  %op15 = icmp slt i32 %op13, %op14
  %op16 = zext i1 %op15 to i32
  %op17 = icmp eq i32 %op16, 0
  br i1 %op17, label %label_eeeeeeeefalseBB, label %label_eeeeeeetrueBB
label_eeeretBB:                                                ; preds = %label_eeeeeeretBB, %label_eeeeeeeeeretBB
  ret i32 0
label_eeeetrueBB:                                                ; preds = %label_etrueBB
  %op18 = load i32, i32* %op0
  call void @output(i32 %op18)
  br label %label_eeeeeeretBB
label_eeeeefalseBB:                                                ; preds = %label_etrueBB
  %op19 = load i32, i32* %op2
  call void @output(i32 %op19)
  br label %label_eeeeeeretBB
label_eeeeeeretBB:                                                ; preds = %label_eeeetrueBB, %label_eeeeefalseBB
  br label %label_eeeretBB
label_eeeeeeetrueBB:                                                ; preds = %label_eefalseBB
  %op20 = load i32, i32* %op1
  call void @output(i32 %op20)
  br label %label_eeeeeeeeeretBB
label_eeeeeeeefalseBB:                                                ; preds = %label_eefalseBB
  %op21 = load i32, i32* %op2
  call void @output(i32 %op21)
  br label %label_eeeeeeeeeretBB
label_eeeeeeeeeretBB:                                                ; preds = %label_eeeeeeetrueBB, %label_eeeeeeeefalseBB
  br label %label_eeeretBB
}
