; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv3/complex3.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @gcd(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op3
  %op5 = icmp eq i32 %op4, 0
  %op6 = zext i1 %op5 to i32
  %op7 = icmp eq i32 %op6, 0
  br i1 %op7, label %label_eefalseBB, label %label_etrueBB
label_etrueBB:                                                ; preds = %label_entry
  %op8 = load i32, i32* %op2
  ret i32 %op8
label_eefalseBB:                                                ; preds = %label_entry
  %op9 = load i32, i32* %op3
  %op10 = load i32, i32* %op3
  %op11 = load i32, i32* %op3
  %op12 = load i32, i32* %op2
  %op13 = sdiv i32 %op12, %op11
  %op14 = mul i32 %op13, %op10
  %op15 = load i32, i32* %op2
  %op16 = sub i32 %op15, %op14
  %op17 = call i32 @gcd(i32 %op9, i32 %op16)
  ret i32 %op17
label_eeeretBB:
}
define void @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = alloca i32
  %op3 = call i32 @input()
  store i32 %op3, i32* %op0
  %op4 = call i32 @input()
  store i32 %op4, i32* %op1
  %op5 = load i32, i32* %op0
  %op6 = load i32, i32* %op1
  %op7 = icmp slt i32 %op5, %op6
  %op8 = zext i1 %op7 to i32
  %op9 = icmp eq i32 %op8, 0
  br i1 %op9, label %label_eeeeeretBB, label %label_eeeetrueBB
label_eeeetrueBB:                                                ; preds = %label_entry
  %op10 = load i32, i32* %op0
  store i32 %op10, i32* %op2
  %op11 = load i32, i32* %op1
  store i32 %op11, i32* %op0
  %op12 = load i32, i32* %op2
  store i32 %op12, i32* %op1
  br label %label_eeeeeretBB
label_eeeeeretBB:                                                ; preds = %label_entry, %label_eeeetrueBB
  %op13 = load i32, i32* %op0
  %op14 = load i32, i32* %op1
  %op15 = call i32 @gcd(i32 %op13, i32 %op14)
  store i32 %op15, i32* %op2
  %op16 = load i32, i32* %op2
  call void @output(i32 %op16)
  ret void
}
