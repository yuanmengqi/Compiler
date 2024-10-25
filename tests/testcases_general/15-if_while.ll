; ModuleID = 'cminus'
source_filename = "/home/yuanmengqi/2023ustc-jianmu-compiler/tests/testcases_general/15-if_while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  br label %label_ewhileBB
label_ewhileBB:                                                ; preds = %label_entry, %label_eeeeeeretBB
  %op0 = phi i32 [ 0, %label_entry ], [ %op11, %label_eeeeeeretBB ]
  %op1 = phi i32 [ 10, %label_entry ], [ %op4, %label_eeeeeeretBB ]
  %op2 = phi i32 [ 0, %label_entry ], [ %op12, %label_eeeeeeretBB ]
  %op3 = icmp sgt i32 %op1, zeroinitializer
  br i1 %op3, label %label_eetrueBB, label %label_eeefalseBB
label_eetrueBB:                                                ; preds = %label_ewhileBB
  %op4 = sub i32 %op1, 1
  %op5 = icmp slt i32 %op4, 5
  %op6 = zext i1 %op5 to i32
  %op7 = icmp eq i32 %op6, 0
  br i1 %op7, label %label_eeeeefalseBB, label %label_eeeetrueBB
label_eeefalseBB:                                                ; preds = %label_ewhileBB
  %op8 = add i32 %op9, %op12
  ret i32 %op8
label_eeeetrueBB:                                                ; preds = %label_eetrueBB
  %op9 = add i32 %op0, %op4
  br label %label_eeeeeeretBB
label_eeeeefalseBB:                                                ; preds = %label_eetrueBB
  %op10 = add i32 %op12, %op4
  br label %label_eeeeeeretBB
label_eeeeeeretBB:                                                ; preds = %label_eeeetrueBB, %label_eeeeefalseBB
  %op11 = phi i32 [ %op9, %label_eeeetrueBB ], [ %op9, %label_eeeeefalseBB ]
  %op12 = phi i32 [ %op2, %label_eeeetrueBB ], [ %op10, %label_eeeeefalseBB ]
  br label %label_ewhileBB
}
