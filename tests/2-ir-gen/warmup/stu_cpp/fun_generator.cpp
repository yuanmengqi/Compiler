#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"

#include <iostream>
#include <memory>

#define CONST_INT(num) \
    ConstantInt::get(num, module)
    
int main() {
    auto module = new Module();
    auto builder = new IRBuilder(nullptr, module);
    Type *Int32Type = module->get_int32_type();

    //创建callee函数
    //auto Int32PtrType = module->get_int32_ptr_type();
    std::vector<Type *> Ints(1, Int32Type);
    auto calleeFunTy = FunctionType::get(Int32Type, Ints);
    auto calleeFun = Function::create(calleeFunTy, "callee", module);
    auto bb = BasicBlock::create(module, "entry", calleeFun);
    builder->set_insert_point(bb);
    auto aAlloca = builder->create_alloca(Int32Type);
    // 获取 callee 函数的形参，通过 Function 中的 iterator
    std::vector<Value *> args;
    for (auto &arg: calleeFun->get_args()) {
        args.push_back(&arg);
    }
    builder->create_store(args[0], aAlloca);
    auto aLoad = builder->create_load(aAlloca);
    auto mul = builder->create_imul(aLoad, CONST_INT(2));
    //auto retAlloca = builder->create_alloca(Int32Type);
    //builder->create_store(mul, retAlloca);
    builder->create_ret(mul);

    //创建main函数
    auto mainFun = Function::create(FunctionType::get(Int32Type, {}), "main", module);
    bb = BasicBlock::create(module, "entry", mainFun);
    builder->set_insert_point(bb);
    //调用
    auto mainretAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(0), mainretAlloca);
    auto call = builder->create_call(calleeFun, {CONST_INT(110)});
    builder->create_ret(call);
    
    std::cout << module->print();
    delete module;
    return 0;
}


