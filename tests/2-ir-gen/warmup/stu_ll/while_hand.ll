define dso_local i32 @main() #0 {
    %a = alloca i32
    %i = alloca i32
    store i32 10, i32* %a
    store i32 0, i32* %i
    br label %cycle

cycle:
    %1 = load i32, i32* %i
    %com = icmp slt i32 %1, 10
    br i1 %com, label %loop, label %afterloop

loop:
    %2 = load i32, i32* %i
    %3 = add i32 %2, 1
    store i32 %3, i32* %i
    %4 = load i32, i32* %a
    %5 = load i32, i32* %i
    %6 = add i32 %5, %4
    store i32 %6, i32* %a
    br label %cycle
afterloop:
    %7 = load i32, i32* %a
    ret i32 %7
}