; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv2/funcall_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @addone(i32 %arg0) {
label_entry:
  store i32 %arg0, i32* %
  %op1 = load i32, i32* %
  %op2 = add i32 %op1, 1
  ret i32 %op2
}
define void @main() {
label_entry:
  %op0 = alloca i32
  %op1 = call i32 @addone(i32 1230)
  %op2 = call i32 @addone(i32 %op1)
  %op3 = call i32 @addone(i32 %op2)
  %op4 = call i32 @addone(i32 %op3)
  store i32 %op4, i32* %op0
  %op5 = load i32, i32* %op0
  call void @output(i32 %op5)
  ret void
}
