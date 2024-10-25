; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/5-while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 10, i32* %op0
  store i32 0, i32* %op1
  br label %label_ewhileBB
label_ewhileBB:                                                ; preds = %label_entry, %label_eetrueBB
  %op2 = load i32, i32* %op1
  %op3 = load i32, i32* %op0
  %op4 = icmp slt i32 %op2, %op3
  %op5 = zext i1 %op4 to i32
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_eetrueBB, label %label_eeefalseBB
label_eetrueBB:                                                ; preds = %label_ewhileBB
  %op7 = load i32, i32* %op1
  call void @output(i32 %op7)
  %op8 = load i32, i32* %op1
  %op9 = add i32 %op8, 1
  store i32 %op9, i32* %op1
  br label %label_ewhileBB
label_eeefalseBB:                                                ; preds = %label_ewhileBB
  ret i32 0
}
