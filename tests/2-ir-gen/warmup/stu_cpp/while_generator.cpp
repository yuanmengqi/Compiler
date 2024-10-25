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

    auto aAlloca = builder->create_alloca(Int32Type);
    auto iAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(10), aAlloca);
    builder->create_store(CONST_INT(0), iAlloca);
    
    //创建while循环
    auto whileBB = BasicBlock::create(module, "whileBB", mainFun);
    auto trueBB = BasicBlock::create(module, "trueBB", mainFun);
    auto falseBB = BasicBlock::create(module, "falseBB", mainFun);
    builder->create_br(whileBB);
    builder->set_insert_point(whileBB);
    auto iLoad = builder->create_load(iAlloca);
    auto icmp = builder->create_icmp_lt(iLoad, CONST_INT(10));
    builder->create_cond_br(icmp, trueBB, falseBB);

    builder->set_insert_point(trueBB);
    iLoad = builder->create_load(iAlloca);
    auto add = builder->create_iadd(iLoad, CONST_INT(1));
    builder->create_store(add, iAlloca);
    auto aLoad = builder->create_load(aAlloca);
    iLoad = builder->create_load(iAlloca);
    add = builder->create_iadd(aLoad, iLoad);
    builder->create_store(add, aAlloca);
    builder->create_br(whileBB);

    builder->set_insert_point(falseBB);
    aLoad = builder->create_load(aAlloca);
    builder->create_store(aLoad, retAlloca);
    builder->create_ret(aLoad);//此处不能传retAlloca，因为retAlloca是指针，而ret指令需要的是值（否则报错已放弃，核心已转储）
    /*builder->create_br(bb);

    builder->set_insert_point(bb);
    aLoad = builder->create_load(aAlloca);
    builder->create_store(aLoad, retAlloca);
    builder->create_ret(retAlloca);*/

    std::cout << module->print();
    delete module;
    return 0;
}
