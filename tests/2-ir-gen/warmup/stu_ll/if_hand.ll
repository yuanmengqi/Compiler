define dso_local i32 @main() #0 {
    %a = alloca float
    store float 0x40163851E0000000, float* %a
    %1 = load float, float* %a
    %com = fcmp ugt float %1, 1.000000e+00
    br i1 %com, label %if, label %else
if: 
    ret i32 233
else: 
    ret i32 0
}