define dso_local i32 @callee(i32 %a) #0 {
    %1 = mul i32 %a, 2
    ret i32 %1
}

define dso_local i32 @main() #0 {
    %1 = call i32 @callee(i32 110)
    ret i32 %1
}