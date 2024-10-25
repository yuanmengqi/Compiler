; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/5-while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  br label %label_ewhileBB
label_ewhileBB:                                                ; preds = %label_entry, %label_eetrueBB
  %op0 = phi i32 [ 0, %label_entry ], [ %op4, %label_eetrueBB ]
  %op1 = icmp slt i32* %op0, i32 10
  %op2 = zext i1 %op1 to i32
  %op3 = icmp sgt i32 %op2, zeroinitializer
  br i1 %op3, label %label_eetrueBB, label %label_eeefalseBB
label_eetrueBB:                                                ; preds = %label_ewhileBB
  call void @output(i32* %op0)
  %op4 = add i32* %op0, i32 1
  br label %label_ewhileBB
label_eeefalseBB:                                                ; preds = %label_ewhileBB
  ret i32 0
}
