; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/8-store.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @store(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op3 = icmp sge i32 %arg1, 0
  br i1 %op3, label %label_etrueBB, label %label_eefalseBB
label_etrueBB:                                                ; preds = %label_entry
  br label %label_eeeretBB
label_eefalseBB:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label_eeeretBB
label_eeeretBB:                                                ; preds = %label_etrueBB, %label_eefalseBB
  %op4 = getelementptr i32, i32* %arg0, i32 %arg1
  store i32 %arg2, i32* %op4
  ret i32 %arg2
}
define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  br label %label_eeeewhileBB
label_eeeewhileBB:                                                ; preds = %label_entry, %label_eeeeetrueBB
  %op1 = phi i32 [ 0, %label_entry ], [ %op8, %label_eeeeetrueBB ]
  %op2 = icmp slt i32* %op1, i32 10
  %op3 = zext i1 %op2 to i32
  %op4 = icmp sgt i32 %op3, zeroinitializer
  br i1 %op4, label %label_eeeeetrueBB, label %label_eeeeeefalseBB
label_eeeeetrueBB:                                                ; preds = %label_eeeewhileBB
  %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op6 = mul i32* %op1, i32 2
  %op7 = call i32 @store(i32* %op5, i32* %op1, i32 %op6)
  %op8 = add i32* %op1, i32 1
  br label %label_eeeewhileBB
label_eeeeeefalseBB:                                                ; preds = %label_eeeewhileBB
  br label %label_eeeeeeewhileBB
label_eeeeeeewhileBB:                                                ; preds = %label_eeeeeefalseBB, %label_eeeeeeeeeeeeretBB
  %op9 = phi i32 [ 0, %label_eeeeeefalseBB ], [ %op17, %label_eeeeeeeeeeeeretBB ]
  %op10 = phi i32 [ 0, %label_eeeeeefalseBB ], [ %op18, %label_eeeeeeeeeeeeretBB ]
  %op11 = icmp slt i32* %op10, i32 10
  %op12 = zext i1 %op11 to i32
  %op13 = icmp sgt i32 %op12, zeroinitializer
  br i1 %op13, label %label_eeeeeeeetrueBB, label %label_eeeeeeeeefalseBB
label_eeeeeeeetrueBB:                                                ; preds = %label_eeeeeeewhileBB
  %op14 = icmp sge i32* %op10, i32 0
  br i1 %op14, label %label_eeeeeeeeeetrueBB, label %label_eeeeeeeeeeefalseBB
label_eeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeewhileBB
  call void @output(i32* %op9)
  ret i32 0
label_eeeeeeeeeetrueBB:                                                ; preds = %label_eeeeeeeetrueBB
  br label %label_eeeeeeeeeeeeretBB
label_eeeeeeeeeeefalseBB:                                                ; preds = %label_eeeeeeeetrueBB
  call void @neg_idx_except()
  br label %label_eeeeeeeeeeeeretBB
label_eeeeeeeeeeeeretBB:                                                ; preds = %label_eeeeeeeeeetrueBB, %label_eeeeeeeeeeefalseBB
  %op15 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32* %op10
  %op16 = load i32, i32* %op15
  %op17 = add i32* %op9, i32 %op16
  %op18 = add i32* %op10, i32 1
  br label %label_eeeeeeewhileBB
}
