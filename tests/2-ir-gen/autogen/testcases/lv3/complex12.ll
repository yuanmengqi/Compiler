; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv3/complex1.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @mod(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op3
  %op5 = load i32, i32* %op2
  %op6 = sub i32 %op5, %op4
  ret i32 %op6
}
define void @printfour(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = alloca i32
  %op3 = alloca i32
  %op4 = alloca i32
  %op5 = alloca i32
  %op6 = load i32, i32* %op1
  %op7 = call i32 @mod(i32 %op6, i32 10000)
  store i32 %op7, i32* %op1
  %op8 = load i32, i32* %op1
  %op9 = call i32 @mod(i32 %op8, i32 10)
  store i32 %op9, i32* %op5
  %op10 = load i32, i32* %op1
  %op11 = sdiv i32 %op10, 10
  store i32 %op11, i32* %op1
  %op12 = load i32, i32* %op1
  %op13 = call i32 @mod(i32 %op12, i32 10)
  store i32 %op13, i32* %op4
  %op14 = load i32, i32* %op1
  %op15 = sdiv i32 %op14, 10
  store i32 %op15, i32* %op1
  %op16 = load i32, i32* %op1
  %op17 = call i32 @mod(i32 %op16, i32 10)
  store i32 %op17, i32* %op3
  %op18 = load i32, i32* %op1
  %op19 = sdiv i32 %op18, 10
  store i32 %op19, i32* %op1
  %op20 = load i32, i32* %op1
  store i32 %op20, i32* %op2
  %op21 = load i32, i32* %op2
  call void @output(i32 %op21)
  %op22 = load i32, i32* %op3
  call void @output(i32 %op22)
  %op23 = load i32, i32* %op4
  call void @output(i32 %op23)
  %op24 = load i32, i32* %op5
  call void @output(i32 %op24)
  ret void
}
define void @main() {
label_entry:
  %op0 = alloca [2801 x i32]
  %op1 = alloca i32
  %op2 = alloca i32
  %op3 = alloca i32
  %op4 = alloca i32
  %op5 = alloca i32
  store i32 0, i32* %op5
  store i32 1234, i32* %op4
  %op6 = alloca i32
  store i32 0, i32* %op6
  br label %label_ewhileBB
label_ewhileBB:                                                ; preds = %label_entry, %label_eeeeeeretBB
  %op7 = load i32, i32* %op6
  %op8 = icmp slt i32 %op7, 2800
  %op9 = zext i1 %op8 to i32
  %op10 = icmp sgt i32 %op9, zeroinitializer
  br i1 %op10, label %label_eetrueBB, label %label_eeefalseBB
label_eetrueBB:                                                ; preds = %label_ewhileBB
  %op11 = load i32, i32* %op6
  %op12 = icmp sge i32 %op11, 0
  br i1 %op12, label %label_eeeetrueBB, label %label_eeeeefalseBB
label_eeefalseBB:                                                ; preds = %label_ewhileBB
  store i32 2800, i32* %op2
  br label %label_eeeeeeewhileBB
label_eeeetrueBB:                                                ; preds = %label_eetrueBB
  br label %label_eeeeeeretBB
label_eeeeefalseBB:                                                ; preds = %label_eetrueBB
  call void @neg_idx_except()
  br label %label_eeeeeeretBB
label_eeeeeeretBB:                                                ; preds = %label_eeeetrueBB, %label_eeeeefalseBB
  %op13 = getelementptr [2801 x i32], [2801 x i32]* %op0, i32 0, i32 %op11
  store i32 2000, i32* %op13
  %op14 = load i32, i32* %op6
  %op15 = add i32 %op14, 1
  store i32 %op15, i32* %op6
  br label %label_ewhileBB
label_eeeeeeewhileBB:                                                ; preds = %label_eeefalseBB, %label_eeeeeeeeeeeefalseBB
  %op16 = load i32, i32* %op2
  %op17 = icmp sgt i32 %op16, zeroinitializer
  br i1 %op17, label %label_eeeeeeeetrueBB, label %label_eeeeeeeeefalseBB
label_eeeeeeeetrueBB:                                                ; preds = %label_eeeeeeewhileBB
  %op18 = alloca i32
  store i32 0, i32* %op18
  %op19 = load i32, i32* %op2
  store i32 %op19, i32* %op1
  br label %label_eeeeeeeeeewhileBB
label_eeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeewhileBB
  ret void
label_eeeeeeeeeewhileBB:                                                ; preds = %label_eeeeeeeetrueBB, %label_eeeeeeeeeeeeeeeeeeeeretBB
  %op20 = load i32, i32* %op1
  %op21 = icmp ne i32 %op20, 0
  %op22 = zext i1 %op21 to i32
  %op23 = icmp sgt i32 %op22, zeroinitializer
  br i1 %op23, label %label_eeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeefalseBB
label_eeeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeeeewhileBB
  %op24 = load i32, i32* %op1
  %op25 = icmp sge i32 %op24, 0
  br i1 %op25, label %label_eeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeefalseBB
label_eeeeeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeeeeewhileBB
  %op26 = load i32, i32* %op18
  %op27 = sdiv i32 %op26, 10000
  %op28 = load i32, i32* %op5
  %op29 = add i32 %op28, %op27
  call void @printfour(i32 %op29)
  %op30 = load i32, i32* %op18
  %op31 = call i32 @mod(i32 %op30, i32 10000)
  store i32 %op31, i32* %op5
  %op32 = load i32, i32* %op2
  %op33 = sub i32 %op32, 14
  store i32 %op33, i32* %op2
  br label %label_eeeeeeewhileBB
label_eeeeeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeeeeetrueBB
  br label %label_eeeeeeeeeeeeeeeretBB
label_eeeeeeeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeeeeeetrueBB
  call void @neg_idx_except()
  br label %label_eeeeeeeeeeeeeeeretBB
label_eeeeeeeeeeeeeeeretBB:                                                ; preds = %label_eeeeeeeeeeeeetrueBB, %label_eeeeeeeeeeeeeefalseBB
  %op34 = getelementptr [2801 x i32], [2801 x i32]* %op0, i32 0, i32 %op24
  %op35 = load i32, i32* %op34
  %op36 = mul i32 %op35, 10000
  %op37 = load i32, i32* %op18
  %op38 = add i32 %op37, %op36
  store i32 %op38, i32* %op18
  %op39 = load i32, i32* %op1
  %op40 = sub i32 %op39, 1
  store i32 %op40, i32* %op3
  %op41 = load i32, i32* %op1
  %op42 = icmp sge i32 %op41, 0
  br i1 %op42, label %label_eeeeeeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeeeeeefalseBB
label_eeeeeeeeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeeeeeeeeeretBB
  br label %label_eeeeeeeeeeeeeeeeeeretBB
label_eeeeeeeeeeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeeeeeeeeeeretBB
  call void @neg_idx_except()
  br label %label_eeeeeeeeeeeeeeeeeeretBB
label_eeeeeeeeeeeeeeeeeeretBB:                                                ; preds = %label_eeeeeeeeeeeeeeeetrueBB, %label_eeeeeeeeeeeeeeeeefalseBB
  %op43 = getelementptr [2801 x i32], [2801 x i32]* %op0, i32 0, i32 %op41
  %op44 = load i32, i32* %op18
  %op45 = load i32, i32* %op3
  %op46 = call i32 @mod(i32 %op44, i32 %op45)
  store i32 %op46, i32* %op43
  %op47 = load i32, i32* %op3
  store i32 %op47, i32* %op18
  %op48 = load i32, i32* %op1
  %op49 = sub i32 %op48, 1
  store i32 %op49, i32* %op1
  %op50 = load i32, i32* %op1
  %op51 = icmp ne i32 %op50, 0
  %op52 = zext i1 %op51 to i32
  %op53 = icmp eq i32 %op52, 0
  br i1 %op53, label %label_eeeeeeeeeeeeeeeeeeeeretBB, label %label_eeeeeeeeeeeeeeeeeeetrueBB
label_eeeeeeeeeeeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeeeeeeeeeeeeretBB
  %op54 = load i32, i32* %op1
  store i32 %op54, i32* %op18
  br label %label_eeeeeeeeeeeeeeeeeeeeretBB
label_eeeeeeeeeeeeeeeeeeeeretBB:                                                ; preds = %label_eeeeeeeeeeeeeeeeeeretBB, %label_eeeeeeeeeeeeeeeeeeetrueBB
  br label %label_eeeeeeeeeewhileBB
}
