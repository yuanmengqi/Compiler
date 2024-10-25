#pragma once

#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"
#include "ast.hpp"

#include <map>
#include <memory>

//根据语义调用enter/exit；根据变量声明和使用调用push/find
class Scope {
  public:
    // enter a new scope
    void enter() { inner.emplace_back(); }

    // exit a scope
    void exit() { inner.pop_back(); }

    //判断当前作用域是不是全局作用域
    bool in_global() { return inner.size() == 1; }

    // push a name to scope
    // return true if successful
    // return false if this name already exits
    bool push(const std::string& name, Value *val) {
        auto result = inner[inner.size() - 1].insert({name, val});
        return result.second;
    }

    //根据名字寻找值
    Value *find(const std::string& name) {
        for (auto s = inner.rbegin(); s != inner.rend(); s++) {
            auto iter = s->find(name);
            if (iter != s->end()) {
                return iter->second;
            }
        }

        // Name not found: handled here?
        assert(false && "Name not found in scope");

        return nullptr;
    }

  private:
    std::vector<std::map<std::string, Value *>> inner;
};

//访问抽象语法树不同结点的visit函数
//定义类cminusfBuilder，继承自ASTVisitor
class CminusfBuilder : public ASTVisitor {
  //ciminusfBuilder类的成员变量和成员函数都可以在class外部访问
  public:
    //cminusfBuilder是CminusfBuilder类的构造函数，用于初始化cminusfBuilder类的成员变量
    CminusfBuilder() {
        module = std::make_unique<Module>();
        builder = std::make_unique<IRBuilder>(nullptr, module.get());
        auto *TyVoid = module->get_void_type();
        auto *TyInt32 = module->get_int32_type();
        auto *TyFloat = module->get_float_type();

        //创建输入函数input_fun
        auto *input_type = FunctionType::get(TyInt32, {});//无参数，返回类型为int32
        auto *input_fun = Function::create(input_type, "input", module.get());          
        //input_fun是函数指针，指向一个函数，函数名为input，函数类型为input_type，函数所在模块为module

        //创建输出整数函数output_fun
        std::vector<Type *> output_params;
        output_params.push_back(TyInt32);
        auto *output_type = FunctionType::get(TyVoid, output_params);
        auto *output_fun = Function::create(output_type, "output", module.get());

        //创建输出浮点数函数output_float_fun
        std::vector<Type *> output_float_params;
        output_float_params.push_back(TyFloat);
        auto *output_float_type = FunctionType::get(TyVoid, output_float_params);
        auto *output_float_fun =
            Function::create(output_float_type, "outputFloat", module.get());

        //创建越界异常函数neg_idx_except_fun
        auto *neg_idx_except_type = FunctionType::get(TyVoid, {});
        auto *neg_idx_except_fun = Function::create(
            neg_idx_except_type, "neg_idx_except", module.get());

        scope.enter();
        scope.push("input", input_fun);
        scope.push("output", output_fun);
        scope.push("outputFloat", output_float_fun);
        scope.push("neg_idx_except", neg_idx_except_fun);
    }

    std::unique_ptr<Module> getModule() { return std::move(module); }
    //一旦调用getModule函数，module就会被移动，不再属于cminusfBuilder类，而属于调用者

  private:
    //从基类继承的函数，用于访问抽象语法树的不同结点，返回指向目标值的指针
    virtual Value *visit(ASTProgram &) override final;
    virtual Value *visit(ASTNum &) override final;
    virtual Value *visit(ASTVarDeclaration &) override final;
    virtual Value *visit(ASTFunDeclaration &) override final;
    virtual Value *visit(ASTParam &) override final;
    virtual Value *visit(ASTCompoundStmt &) override final;
    virtual Value *visit(ASTExpressionStmt &) override final;
    virtual Value *visit(ASTSelectionStmt &) override final;
    virtual Value *visit(ASTIterationStmt &) override final;
    virtual Value *visit(ASTReturnStmt &) override final;
    virtual Value *visit(ASTAssignExpression &) override final;
    virtual Value *visit(ASTSimpleExpression &) override final;
    virtual Value *visit(ASTAdditiveExpression &) override final;
    virtual Value *visit(ASTVar &) override final;
    virtual Value *visit(ASTTerm &) override final;
    virtual Value *visit(ASTCall &) override final;

    std::unique_ptr<IRBuilder> builder;
    Scope scope;
    std::unique_ptr<Module> module;

    //存储翻译时状态
    struct {
        // function that is being built
        //创建指针func，指向当前正在翻译的函数（初始化为nullptr）
        Function *func = nullptr;
        std::string mark = "";
        Value *return_value = nullptr;
        bool change_to_value = true;//将获取到的地址转化成指针
        int i=0;
    } context;
};
