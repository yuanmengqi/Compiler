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

    //创建main函数
    auto mainFun = Function::create(FunctionType::get(Int32Type, {}), "main", module);
    auto bb = BasicBlock::create(module, "entry", mainFun);
    builder->set_insert_point(bb);
    auto retAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(0), retAlloca);

    auto *arrayType = ArrayType::get(Int32Type, 10);
    auto aAlloca = builder->create_alloca(arrayType);
    auto a0GEP = builder->create_gep(aAlloca, {CONST_INT(0), CONST_INT(0)});
    builder->create_store(CONST_INT(10), a0GEP);
    
    auto a0Load = builder->create_load(a0GEP);
    auto mul = builder->create_imul(a0Load, CONST_INT(2));
    auto a1GEP = builder->create_gep(aAlloca, {CONST_INT(0), CONST_INT(1)});
    builder->create_store(mul, a1GEP);
    builder->create_ret(mul);
    std::cout << module->print();
    delete module;
    return 0;
}
