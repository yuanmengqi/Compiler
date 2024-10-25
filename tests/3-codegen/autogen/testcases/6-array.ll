; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/6-array.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = alloca i32
  store i32 0, i32* %op1
  %op2 = icmp sge i32 0, 0
  br i1 %op2, label %label_etrueBB, label %label_eefalseBB
label_etrueBB:                                                ; preds = %label_entry
  br label %label_eeeretBB
label_eefalseBB:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_eeeretBB
label_eeeretBB:                                                ; preds = %label_etrueBB, %label_eefalseBB
  %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  store i32 11, i32* %op3
  %op4 = icmp sge i32 4, 0
  br i1 %op4, label %label_eeeetrueBB, label %label_eeeeefalseBB
label_eeeetrueBB:                                                ; preds = %label_eeeretBB
  br label %label_eeeeeeretBB
label_eeeeefalseBB:                                                ; preds = %label_eeeretBB
  call void @neg_idx_except()
  br label %label_eeeeeeretBB
label_eeeeeeretBB:                                                ; preds = %label_eeeetrueBB, %label_eeeeefalseBB
  %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
  store i32 22, i32* %op5
  %op6 = icmp sge i32 9, 0
  br i1 %op6, label %label_eeeeeeetrueBB, label %label_eeeeeeeefalseBB
label_eeeeeeetrueBB:                                                ; preds = %label_eeeeeeretBB
  br label %label_eeeeeeeeeretBB
label_eeeeeeeefalseBB:                                                ; preds = %label_eeeeeeretBB
  call void @neg_idx_except()
  br label %label_eeeeeeeeeretBB
label_eeeeeeeeeretBB:                                                ; preds = %label_eeeeeeetrueBB, %label_eeeeeeeefalseBB
  %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
  store i32 33, i32* %op7
  %op8 = icmp sge i32 0, 0
  br i1 %op8, label %label_eeeeeeeeeetrueBB, label %label_eeeeeeeeeeefalseBB
label_eeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeeeretBB
  br label %label_eeeeeeeeeeeeretBB
label_eeeeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeeeeretBB
  call void @neg_idx_except()
  br label %label_eeeeeeeeeeeeretBB
label_eeeeeeeeeeeeretBB:                                                ; preds = %label_eeeeeeeeeetrueBB, %label_eeeeeeeeeeefalseBB
  %op9 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op10 = load i32, i32* %op9
  call void @output(i32 %op10)
  %op11 = icmp sge i32 4, 0
  br i1 %op11, label %label_eeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeefalseBB
label_eeeeeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeeeeeeretBB
  br label %label_eeeeeeeeeeeeeeeretBB
label_eeeeeeeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeeeeeeeretBB
  call void @neg_idx_except()
  br label %label_eeeeeeeeeeeeeeeretBB
label_eeeeeeeeeeeeeeeretBB:                                                ; preds = %label_eeeeeeeeeeeeetrueBB, %label_eeeeeeeeeeeeeefalseBB
  %op12 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
  %op13 = load i32, i32* %op12
  call void @output(i32 %op13)
  %op14 = icmp sge i32 9, 0
  br i1 %op14, label %label_eeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeefalseBB
label_eeeeeeeeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeeeeeeeeeretBB
  br label %label_eeeeeeeeeeeeeeeeeeretBB
label_eeeeeeeeeeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeeeeeeeeeeretBB
  call void @neg_idx_except()
  br label %label_eeeeeeeeeeeeeeeeeeretBB
label_eeeeeeeeeeeeeeeeeeretBB:                                                ; preds = %label_eeeeeeeeeeeeeeeetrueBB, %label_eeeeeeeeeeeeeeeeefalseBB
  %op15 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
  %op16 = load i32, i32* %op15
  call void @output(i32 %op16)
  ret i32 0
}
