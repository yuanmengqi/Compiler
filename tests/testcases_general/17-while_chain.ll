; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/testcases_general/17-while_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 10, i32* %op0
  br label %label_ewhileBB
label_ewhileBB:                                                ; preds = %label_entry, %label_eeeeeefalseBB
  %op2 = load i32, i32* %op0
  %op3 = icmp sgt i32 %op2, zeroinitializer
  br i1 %op3, label %label_eetrueBB, label %label_eeefalseBB
label_eetrueBB:                                                ; preds = %label_ewhileBB
  %op4 = load i32, i32* %op0
  %op5 = sub i32 %op4, 1
  store i32 %op5, i32* %op0
  %op6 = load i32, i32* %op0
  store i32 %op6, i32* %op1
  br label %label_eeeewhileBB
label_eeefalseBB:                                                ; preds = %label_ewhileBB
  %op7 = load i32, i32* %op1
  %op8 = load i32, i32* %op0
  %op9 = add i32 %op8, %op7
  ret i32 %op9
label_eeeewhileBB:                                                ; preds = %label_eetrueBB, %label_eeeeetrueBB
  %op10 = load i32, i32* %op1
  %op11 = icmp sgt i32 %op10, zeroinitializer
  br i1 %op11, label %label_eeeeetrueBB, label %label_eeeeeefalseBB
label_eeeeetrueBB:                                                ; preds = %label_eeeewhileBB
  %op12 = load i32, i32* %op1
  %op13 = sub i32 %op12, 1
  store i32 %op13, i32* %op1
  br label %label_eeeewhileBB
label_eeeeeefalseBB:                                                ; preds = %label_eeeewhileBB
  br label %label_ewhileBB
}
