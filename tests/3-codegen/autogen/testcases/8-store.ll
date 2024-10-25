; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/8-store.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @store(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op3 = alloca i32*
  store i32* %arg0, i32** %op3
  %op4 = alloca i32
  store i32 %arg1, i32* %op4
  %op5 = alloca i32
  store i32 %arg2, i32* %op5
  %op6 = load i32, i32* %op4
  %op7 = icmp sge i32 %op6, 0
  br i1 %op7, label %label_etrueBB, label %label_eefalseBB
label_etrueBB:                                                ; preds = %label_entry
  br label %label_eeeretBB
label_eefalseBB:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_eeeretBB
label_eeeretBB:                                                ; preds = %label_etrueBB, %label_eefalseBB
  %op8 = load i32*, i32** %op3
  %op9 = getelementptr i32, i32* %op8, i32 %op6
  %op10 = load i32, i32* %op5
  store i32 %op10, i32* %op9
  %op11 = load i32, i32* %op5
  ret i32 %op11
}
define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 0, i32* %op1
  br label %label_eeeewhileBB
label_eeeewhileBB:                                                ; preds = %label_entry, %label_eeeeetrueBB
  %op3 = load i32, i32* %op1
  %op4 = icmp slt i32 %op3, 10
  %op5 = zext i1 %op4 to i32
  %op6 = icmp sgt i32 %op5, zeroinitializer
  br i1 %op6, label %label_eeeeetrueBB, label %label_eeeeeefalseBB
label_eeeeetrueBB:                                                ; preds = %label_eeeewhileBB
  %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op8 = load i32, i32* %op1
  %op9 = load i32, i32* %op1
  %op10 = mul i32 %op9, 2
  %op11 = call i32 @store(i32* %op7, i32 %op8, i32 %op10)
  %op12 = load i32, i32* %op1
  %op13 = add i32 %op12, 1
  store i32 %op13, i32* %op1
  br label %label_eeeewhileBB
label_eeeeeefalseBB:                                                ; preds = %label_eeeewhileBB
  store i32 0, i32* %op2
  store i32 0, i32* %op1
  br label %label_eeeeeeewhileBB
label_eeeeeeewhileBB:                                                ; preds = %label_eeeeeefalseBB, %label_eeeeeeeeeeeeretBB
  %op14 = load i32, i32* %op1
  %op15 = icmp slt i32 %op14, 10
  %op16 = zext i1 %op15 to i32
  %op17 = icmp sgt i32 %op16, zeroinitializer
  br i1 %op17, label %label_eeeeeeeetrueBB, label %label_eeeeeeeeefalseBB
label_eeeeeeeetrueBB:                                                ; preds = %label_eeeeeeewhileBB
  %op18 = load i32, i32* %op1
  %op19 = icmp sge i32 %op18, 0
  br i1 %op19, label %label_eeeeeeeeeetrueBB, label %label_eeeeeeeeeeefalseBB
label_eeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeewhileBB
  %op20 = load i32, i32* %op2
  call void @output(i32 %op20)
  ret i32 0
label_eeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeetrueBB
  br label %label_eeeeeeeeeeeeretBB
label_eeeeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeeetrueBB
  call void @neg_idx_except()
  br label %label_eeeeeeeeeeeeretBB
label_eeeeeeeeeeeeretBB:                                                ; preds = %label_eeeeeeeeeetrueBB, %label_eeeeeeeeeeefalseBB
  %op21 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op18
  %op22 = load i32, i32* %op21
  %op23 = load i32, i32* %op2
  %op24 = add i32 %op23, %op22
  store i32 %op24, i32* %op2
  %op25 = load i32, i32* %op1
  %op26 = add i32 %op25, 1
  store i32 %op26, i32* %op1
  br label %label_eeeeeeewhileBB
}
