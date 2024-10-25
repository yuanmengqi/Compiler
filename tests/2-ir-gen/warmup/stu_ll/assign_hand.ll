define dso_local i32 @main() #0 {
    %a = alloca [10 x i32]
    %address = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 0
    store i32 10, i32* %address
    %address0 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 0
    %1 = load i32, i32* %address0
    %2 = mul i32 %1, 2
    %address1 = getelementptr [10 x i32], [10 x i32]* %a, i32 0, i32 1
    store i32 %2, i32* %address1
    ret i32 %2
}