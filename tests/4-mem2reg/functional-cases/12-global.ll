; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/12-global.cminus"

@seed = global i32 zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @randomLCG() {
label_entry:
  %op0 = load i32, i32* @seed
  %op1 = mul i32 %op0, 1103515245
  %op2 = add i32 %op1, 12345
  store i32 %op2, i32* @seed
  %op3 = load i32, i32* @seed
  ret i32 %op3
}
define i32 @randBin() {
label_entry:
  %op0 = call i32 @randomLCG()
  %op1 = icmp sgt i32 %op0, 0
  %op2 = zext i1 %op1 to i32
  %op3 = icmp eq i32 %op2, 0
  br i1 %op3, label %label_eefalseBB, label %label_etrueBB
label_etrueBB:                                                ; preds = %label_entry
  ret i32 1
label_eefalseBB:                                                ; preds = %label_entry
  ret i32 0
}
define i32 @returnToZeroSteps() {
label_entry:
  br label %label_eeewhileBB
label_eeewhileBB:                                                ; preds = %label_entry, %label_eeeeeeeeeeretBB
  %op0 = phi i32 [ 0, %label_entry ], [ %op10, %label_eeeeeeeeeeretBB ]
  %op1 = phi i32 [ 0, %label_entry ], [ %op9, %label_eeeeeeeeeeretBB ]
  %op2 = icmp slt i32* %op0, i32 20
  %op3 = zext i1 %op2 to i32
  %op4 = icmp sgt i32 %op3, zeroinitializer
  br i1 %op4, label %label_eeeetrueBB, label %label_eeeeefalseBB
label_eeeetrueBB:                                                ; preds = %label_eeewhileBB
  %op5 = call i32 @randBin()
  %op6 = icmp eq i32 %op5, 0
  br i1 %op6, label %label_eeeeeeefalseBB, label %label_eeeeeetrueBB
label_eeeeefalseBB:                                                ; preds = %label_eeewhileBB
  ret i32 20
label_eeeeeetrueBB:                                                ; preds = %label_eeeetrueBB
  %op7 = add i32* %op1, i32 1
  br label %label_eeeeeeeeretBB
label_eeeeeeefalseBB:                                                ; preds = %label_eeeetrueBB
  %op8 = sub i32 %op7, 1
  br label %label_eeeeeeeeretBB
label_eeeeeeeeretBB:                                                ; preds = %label_eeeeeetrueBB, %label_eeeeeeefalseBB
  %op9 = phi i32 [ %op7, %label_eeeeeetrueBB ], [ %op8, %label_eeeeeeefalseBB ]
  %op10 = add i32* %op0, i32 1
  %op11 = icmp eq i32* %op9, i32 0
  %op12 = zext i1 %op11 to i32
  %op13 = icmp eq i32 %op12, 0
  br i1 %op13, label %label_eeeeeeeeeeretBB, label %label_eeeeeeeeetrueBB
label_eeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeeretBB
  ret i32 %op10
label_eeeeeeeeeeretBB:                                                ; preds = %label_eeeeeeeeretBB
  br label %label_eeewhileBB
}
define i32 @main() {
label_entry:
  store i32 3407, i32* @seed
  br label %label_eeeeeeeeeeewhileBB
label_eeeeeeeeeeewhileBB:                                                ; preds = %label_entry, %label_eeeeeeeeeeeetrueBB
  %op0 = phi i32 [ 0, %label_entry ], [ %op5, %label_eeeeeeeeeeeetrueBB ]
  %op1 = icmp slt i32* %op0, i32 20
  %op2 = zext i1 %op1 to i32
  %op3 = icmp sgt i32 %op2, zeroinitializer
  br i1 %op3, label %label_eeeeeeeeeeeetrueBB, label %label_eeeeeeeeeeeeefalseBB
label_eeeeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeeeeewhileBB
  %op4 = call i32 @returnToZeroSteps()
  call void @output(i32 %op4)
  %op5 = add i32* %op0, i32 1
  br label %label_eeeeeeeeeeewhileBB
label_eeeeeeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeeeeeewhileBB
  ret i32 0
}
