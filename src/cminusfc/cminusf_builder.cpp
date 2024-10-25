#include "cminusf_builder.hpp"

#define CONST_FP(num) ConstantFP::get((float)num, module.get())
#define CONST_INT(num) ConstantInt::get(num, module.get())

// types
Type *VOID_T;
Type *INT1_T;
Type *INT32_T;
Type *INT32PTR_T;
Type *FLOAT_T;
Type *FLOATPTR_T;

/*
 * use CMinusfBuilder::Scope to construct scopes
 * scope.enter: enter a new scope
 * scope.exit: exit current scope
 * scope.push: add a new binding to current scope
 * scope.find: find and return the value bound to the name
 */

//是一个成员函数的定义
Value* CminusfBuilder::visit(ASTProgram &node) {
    //为类的成员变量赋值，用于储存不同类型的数据
    VOID_T = module->get_void_type();
    INT1_T = module->get_int1_type();
    INT32_T = module->get_int32_type();
    INT32PTR_T = module->get_int32_ptr_type();
    FLOAT_T = module->get_float_type();
    FLOATPTR_T = module->get_float_ptr_type();

    Value *ret_val = nullptr;
    //遍历ASTProgram的成员变量declarations
    for (auto &decl : node.declarations) {
        //对每个声明，调用accept函数，传入*this，以便在AST中访问cminusfBuilder类的成员变量
        //this表示当前对象的指针，*this表示当前对象（当前类的实例）
        ret_val = decl->accept(*this);
    }
    return ret_val;
}

Value* CminusfBuilder::visit(ASTNum &node) {
    if (node.type == TYPE_INT)
        return CONST_INT(node.i_val);
    else if (node.type == TYPE_FLOAT)
        return CONST_FP(node.f_val);
    else
        return nullptr;
}

Value* CminusfBuilder::visit(ASTVarDeclaration &node) {
    Type *ret_type;
    if (node.type == TYPE_INT)
        ret_type = INT32_T;
    else if (node.type == TYPE_FLOAT)
        ret_type = FLOAT_T;
    if(!scope.in_global()){
        if(node.num != nullptr){//定义数组
            //判断数组下标是否非负
            auto *array = ArrayType::get(ret_type, node.num->i_val);
            auto arrayAlloca = builder->create_alloca(array);
            scope.push(node.id, arrayAlloca);
        }
        else{//定义变量
            auto var = builder->create_alloca(ret_type);
            scope.push(node.id, var);
        }
    }
    else{
        auto initializer = ConstantZero::get(ret_type, module.get());
        //constantzero和CONST_INT的区别：constantzero是一个类，CONST_INT是一个宏。此处不能用CONST_INT
        if(node.num != nullptr){//定义数组
            auto *array = ArrayType::get(ret_type, node.num->i_val);
            auto arrayAlloca = GlobalVariable::create(node.id, module.get(), array, false, initializer);
            scope.push(node.id, arrayAlloca);
        }
        else{//定义变量
            auto var = GlobalVariable::create(node.id, module.get(), ret_type, false, initializer);
            scope.push(node.id, var);
        }
    }

    return nullptr;
}

Value* CminusfBuilder::visit(ASTFunDeclaration &node) {
    FunctionType *fun_type;
    Type *ret_type;
    std::vector<Type *> param_types;
    //确定函数返回值类型
    if (node.type == TYPE_INT)
        ret_type = INT32_T;
    else if (node.type == TYPE_FLOAT)
        ret_type = FLOAT_T;
    else
        ret_type = VOID_T;

    for (auto &param : node.params) {
        //param_types.push_back(&param->type);
        if(param->isarray){//建立形参类型表
            if(param->type == TYPE_INT){
                /*auto *array = ArrayType::get(INT32_T, 0);
                auto arrayAlloca = builder->create_alloca(array);
                param_types.push_back(arrayAlloca->get_alloca_type());*/
                param_types.push_back(INT32PTR_T);
            }
            else if (param->type == TYPE_FLOAT){
                /*auto *array = ArrayType::get(FLOAT_T, 0);
                auto arrayAlloca = builder->create_alloca(array);
                param_types.push_back(arrayAlloca->get_alloca_type());*/
                param_types.push_back(FLOATPTR_T);
            }
        }
        else{
            if(param->type == TYPE_INT){
                /*auto val = builder->create_alloca(INT32_T);
                param_types.push_back(val->get_alloca_type());*/
                param_types.push_back(INT32_T);
            }
            else if (param->type == TYPE_FLOAT){
                /*auto val = builder->create_alloca(FLOAT_T);
                param_types.push_back(val->get_alloca_type());*/
                param_types.push_back(FLOAT_T);
            }
        }
        //param->accept(*this);
        //auto paramAlloca = builder->create_alloca(param_types.back());
        //param_types.push_back(scope.find(param->id));
    }

    //创建函数类型
    fun_type = FunctionType::get(ret_type, param_types);
    //创建函数
    auto func = Function::create(fun_type, node.id, module.get());
    //将函数添加到当前作用域scope中
    scope.push(node.id, func);
    context.func = func;
    auto funBB = BasicBlock::create(module.get(), "entry", func);
    builder->set_insert_point(funBB);
    scope.enter();
    std::vector<Value *> args;
    for (auto &arg : func->get_args()) {//遍历所有实参，将实参的值存入args中
        args.push_back(&arg);
    }
    for (int i = 0; i < node.params.size(); ++i) {//遍历所有形参
        //scope.push(node.params[i]->id, args[i]);
        node.params[i]->accept(*this);//访问每一个实参：每个param是下一个ASTParam的实例
        auto a = scope.find(node.params[i]->id);
        builder->create_store(args[i], a);

    }
    node.compound_stmt->accept(*this);
    if (not builder->get_insert_block()->is_terminated())
    {
        if (context.func->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (context.func->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));
    }
    scope.exit();
    return nullptr;
}

Value* CminusfBuilder::visit(ASTParam &node) {
    if(node.isarray){
        if(node.type == TYPE_INT){
            auto arrayAlloca = builder->create_alloca(INT32PTR_T);
            scope.push(node.id, arrayAlloca);
        }
        else if (node.type == TYPE_FLOAT){
            auto arrayAlloca = builder->create_alloca(FLOATPTR_T);
            scope.push(node.id, arrayAlloca);
        }
    }
    else{
        if(node.type == TYPE_INT){
            auto val = builder->create_alloca(INT32_T);
            scope.push(node.id, val);
        }
        else if (node.type == TYPE_FLOAT){
            auto val = builder->create_alloca(FLOAT_T);
            scope.push(node.id, val);
        }
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTCompoundStmt &node) {
    scope.enter();

    if(!node.local_declarations.empty()){
        for (auto &decl : node.local_declarations) {
            decl->accept(*this);
        }
    }
    if(!node.statement_list.empty()){
        for (auto &stmt : node.statement_list) {
            stmt->accept(*this);
            if (builder->get_insert_block()->is_terminated())
                break;
        }
    }
    scope.exit();
    return nullptr;
}

//type & id & isarray & expression
Value* CminusfBuilder::visit(ASTExpressionStmt &node) {
    if(node.expression == nullptr)
        return nullptr;
    else
        return node.expression->accept(*this);
}

//if
Value* CminusfBuilder::visit(ASTSelectionStmt &node) {
    auto judge = node.expression->accept(*this);

    if(node.else_statement == nullptr){
        auto trueBB = BasicBlock::create(module.get(), context.mark.append("e") + "trueBB", context.func);
        auto retBB = BasicBlock::create(module.get(), context.mark.append("e") + "retBB", context.func);
        if(judge->get_type()->is_integer_type()){
            auto icmp = builder->create_icmp_eq(judge, CONST_INT(0));
            builder->create_cond_br(icmp, retBB, trueBB);
        }
        else if(judge->get_type()->is_float_type()){
            auto fcmp = builder->create_fcmp_eq(judge, CONST_FP(0.0));
            builder->create_cond_br(fcmp, retBB, trueBB);
        }

        builder->set_insert_point(trueBB);
        node.if_statement->accept(*this);
        if(!builder->get_insert_block()->is_terminated())//判断if语段中有没有return语句
            builder->create_br(retBB);

        builder->set_insert_point(retBB);
        return nullptr;
    }
    else{
        auto trueBB = BasicBlock::create(module.get(), context.mark.append("e") + "trueBB", context.func);
        auto falseBB = BasicBlock::create(module.get(), context.mark.append("e") + "falseBB", context.func);
        if(judge->get_type()->is_integer_type()){
            auto icmp = builder->create_icmp_eq(judge, CONST_INT(0));
            builder->create_cond_br(icmp, falseBB, trueBB);
        }
        else if(judge->get_type()->is_float_type()){
            auto fcmp = builder->create_fcmp_eq(judge, CONST_FP(0.0));
            builder->create_cond_br(fcmp, falseBB, trueBB);
        }

        
        builder->set_insert_point(trueBB);
        node.if_statement->accept(*this);
        auto ret_in_true = builder->get_insert_block()->is_terminated();
        bool ret_exit = false;
        BasicBlock * retBB;
        if(!ret_in_true){
            retBB = BasicBlock::create(module.get(), context.mark.append("e") + "retBB", context.func);
            ret_exit = true;
            builder->create_br(retBB);
        }
        builder->set_insert_point(falseBB);
        node.else_statement->accept(*this);
        auto ret_in_false = builder->get_insert_block()->is_terminated();
        if(!ret_in_false){
            if(ret_exit == false)
                retBB = BasicBlock::create(module.get(), context.mark.append("e") + "retBB", context.func);
            ret_exit = true;
            builder->create_br(retBB);
        }
            

        /*if(!ret_in_true){
            builder->set_insert_point(retBB);
        }
        if(!ret_in_false){
            builder->set_insert_point(retBB);
        }*/
        if(ret_exit)
            builder->set_insert_point(retBB);  
        //如果按第一种方法写，则在if和else中都有return的时候，没有insert，
        //即原来的block都终止了，但没有创建新的block放接下来的指令
        return nullptr;
        
    }
}

//while
Value* CminusfBuilder::visit(ASTIterationStmt &node) {

    auto whileBB = BasicBlock::create(module.get(), context.mark.append("e") + "whileBB", context.func);
    auto trueBB = BasicBlock::create(module.get(), context.mark.append("e") + "trueBB", context.func);
    auto falseBB = BasicBlock::create(module.get(), context.mark.append("e") + "falseBB", context.func);
    builder->create_br(whileBB);

    builder->set_insert_point(whileBB);
    auto judge = node.expression->accept(*this);
    //judge应该在whileBB中，因此不能在whileBB之前创建，否则会出现judge未定义的情况
    if(judge->get_type()->is_integer_type()){
        if(judge->get_type()->is_int32_type()){
            auto cmp = builder->create_icmp_gt(judge, ConstantZero::get(INT32_T, module.get()));
            //std::cout << judge->print() <<std::endl;
            builder->create_cond_br(cmp, trueBB, falseBB);
        }
        else
            builder->create_cond_br(judge, trueBB, falseBB);
    }
    else if(judge->get_type()->is_float_type()){
        auto cmp = builder->create_fcmp_gt(judge, ConstantZero::get(FLOAT_T, module.get()));
        //std::cout << judge->print() <<std::endl;
        builder->create_cond_br(cmp, trueBB, falseBB);
    }

    builder->set_insert_point(trueBB);
    node.statement->accept(*this);
    if(!builder->get_insert_block()->is_terminated())//while中有无return语句
        builder->create_br(whileBB);

    builder->set_insert_point(falseBB);
    return nullptr;
}

//翻译return语句
Value* CminusfBuilder::visit(ASTReturnStmt &node) {
    if (node.expression == nullptr) {
        builder->create_void_ret();
        return nullptr;
    } else {
        // You need to solve other return cases (e.g. return an integer).
        auto ret_val = node.expression->accept(*this);
        //处理类型不匹配
        if(ret_val->get_type()->is_float_type() && context.func->get_return_type()->is_integer_type())
            ret_val = builder->create_fptosi(ret_val, INT32_T);
        if(context.func->get_return_type()->is_float_type() && ret_val->get_type()->is_integer_type())
            ret_val = builder->create_sitofp(ret_val, FLOAT_T);
        builder->create_ret(ret_val);
        return ret_val;
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTVar &node) {
    if(node.expression == nullptr)
        return scope.find(node.id);//scope.find返回的是指向值的指针
    else{
        auto var_id = node.expression->accept(*this);
        
        //var_id是value*类型，无法转化成int类型，因此无法直接利用其值进行比较，需要创建basicblock比大小
        auto trueBB = BasicBlock::create(module.get(), context.mark.append("e") + "trueBB", context.func);
        auto falseBB = BasicBlock::create(module.get(), context.mark.append("e") + "falseBB", context.func);
        auto retBB = BasicBlock::create(module.get(), context.mark.append("e") + "retBB", context.func);

        if(var_id->get_type()->is_float_type()){
            auto var_id1 = builder->create_fptosi(var_id, INT32_T);
            auto icmp = builder->create_icmp_ge(var_id1, CONST_INT(0));
            builder->create_cond_br(icmp, trueBB, falseBB);
        }
        else{
            auto icmp = builder->create_icmp_ge(var_id, CONST_INT(0));
            builder->create_cond_br(icmp, trueBB, falseBB);
        }
        
        builder->set_insert_point(trueBB);//小于时执行错误处理
        builder->create_br(retBB);

        builder->set_insert_point(falseBB);//大于等于时执行正常操作
        builder->create_call(scope.find("neg_idx_except"), {});
        builder->create_br(retBB);

                builder->set_insert_point(retBB);
        if(scope.find(node.id)->get_type()->is_pointer_type()){//取值
            if(var_id->get_type()->is_float_type()){
                auto var_id1 = builder->create_fptosi(var_id, INT32_T);
                if(scope.find(node.id)->get_type()->get_pointer_element_type()->is_pointer_type()){
                    auto a = builder->create_load(scope.find(node.id));
                    return builder->create_gep(a, {var_id1});
                }
                return builder->create_gep(scope.find(node.id), {CONST_INT(0), var_id1});
            }
            else{
                if(scope.find(node.id)->get_type()->get_pointer_element_type()->is_pointer_type()){
                    auto a = builder->create_load(scope.find(node.id));
                    return builder->create_gep(a, {var_id});
                }
                return builder->create_gep(scope.find(node.id), {CONST_INT(0), var_id});
            }
        }
        else{
            if(var_id->get_type()->is_float_type()){
                auto var_id1 = builder->create_fptosi(var_id, INT32_T);
                return builder->create_gep(scope.find(node.id), {var_id1});
            }
            else
                return builder->create_gep(scope.find(node.id), {var_id});
        }
        //假设 aAlloca 是一个指针，通过将索引偏移量设置为 0，create_gep 将返回 aAlloca 指针本身，而不是指向 aAlloca 某个元素的指针。
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTAssignExpression &node) {
    auto var = node.var->accept(*this);

    auto expression = node.expression->accept(*this);
    if(expression->get_type()->is_float_type() && var->get_type()->get_pointer_element_type()->is_integer_type())
        expression = builder->create_fptosi(expression, INT32_T);
    if(var->get_type()->get_pointer_element_type()->is_float_type() && expression->get_type()->is_integer_type())
        expression = builder->create_sitofp(expression, FLOAT_T);
    builder->create_store(expression, var);
    return expression;
}

Value* CminusfBuilder::visit(ASTSimpleExpression &node) {
    auto varl = node.additive_expression_l->accept(*this);
    if(node.additive_expression_r != nullptr){
        switch(node.op)
        {
            case OP_LT:{//用fcmp还是icmp类型判断
                auto varr = node.additive_expression_r->accept(*this);
                if(varl->get_type()->is_integer_type() && varr->get_type()->is_integer_type()){
                    return builder->create_zext(builder->create_icmp_lt(varl, varr), INT32_T);
                }
                else{
                    if(varl->get_type()->is_integer_type())
                        varl = builder->create_sitofp(varl, FLOAT_T);
                    if(varr->get_type()->is_integer_type())
                        varr = builder->create_sitofp(varr, FLOAT_T);
                    return builder->create_zext(builder->create_fcmp_lt(varl, varr), INT32_T);
                }
                break;
            }
            case OP_GT:{
                auto varr = node.additive_expression_r->accept(*this);
                if(varl->get_type()->is_integer_type() && varr->get_type()->is_integer_type())
                    return builder->create_zext(builder->create_icmp_gt(varl, varr), INT32_T);
                else{
                    if(varl->get_type()->is_integer_type())
                        varl = builder->create_sitofp(varl, FLOAT_T);
                    if(varr->get_type()->is_integer_type())
                        varr = builder->create_sitofp(varr, FLOAT_T);
                    return builder->create_zext(builder->create_fcmp_gt(varl, varr), INT32_T);
                }
                break;
            }
            case OP_LE:{
                auto varr = node.additive_expression_r->accept(*this);
                if(varl->get_type()->is_integer_type() && varr->get_type()->is_integer_type())
                    return builder->create_zext(builder->create_icmp_le(varl, varr), INT32_T);
                else{
                    if(varl->get_type()->is_integer_type())
                        varl = builder->create_sitofp(varl, FLOAT_T);
                    if(varr->get_type()->is_integer_type())
                        varr = builder->create_sitofp(varr, FLOAT_T);
                    return builder->create_zext(builder->create_fcmp_le(varl, varr), INT32_T);
                }
                break;
            }
            case OP_GE:{
                auto varr = node.additive_expression_r->accept(*this);
                if(varl->get_type()->is_integer_type() && varr->get_type()->is_integer_type())
                    return builder->create_zext(builder->create_icmp_ge(varl, varr), INT32_T);
                else{
                    if(varl->get_type()->is_integer_type())
                        varl = builder->create_sitofp(varl, FLOAT_T);
                    if(varr->get_type()->is_integer_type())
                        varr = builder->create_sitofp(varr, FLOAT_T);
                    return builder->create_zext(builder->create_fcmp_ge(varl, varr), INT32_T);
                }
                break;
            }
            case OP_EQ:{
                auto varr = node.additive_expression_r->accept(*this);
                if(varl->get_type()->is_integer_type() && varr->get_type()->is_integer_type())
                    return builder->create_zext(builder->create_icmp_eq(varl, varr), INT32_T);
                else{
                    if(varl->get_type()->is_integer_type())
                        varl = builder->create_sitofp(varl, FLOAT_T);
                    if(varr->get_type()->is_integer_type())
                        varr = builder->create_sitofp(varr, FLOAT_T);
                    return builder->create_zext(builder->create_fcmp_eq(varl, varr), INT32_T);
                }
                break;
            }
            case OP_NEQ:{
                auto varr = node.additive_expression_r->accept(*this);
                if(varl->get_type()->is_integer_type() && varr->get_type()->is_integer_type())
                    return builder->create_zext(builder->create_icmp_ne(varl, varr), INT32_T);
                else{
                    if(varl->get_type()->is_integer_type())
                        varl = builder->create_sitofp(varl, FLOAT_T);
                    if(varr->get_type()->is_integer_type())
                        varr = builder->create_sitofp(varr, FLOAT_T);
                    return builder->create_zext(builder->create_fcmp_ne(varl, varr), INT32_T);
                }
                break;
            }
            default:{
                return nullptr;
                break;
            }
        }
    }
    else
        return varl;
}

Value* CminusfBuilder::visit(ASTAdditiveExpression &node) {
    auto var_term = node.term->accept(*this);
    if(node.additive_expression != nullptr){
        if(node.op == OP_PLUS){
            auto var_add = node.additive_expression->accept(*this);
            if(var_add->get_type()->is_integer_type() && var_term->get_type()->is_integer_type())
                return builder->create_iadd(var_add, var_term);
            else{
                if(var_add->get_type()->is_integer_type())
                    var_add = builder->create_sitofp(var_add, FLOAT_T);
                if(var_term->get_type()->is_integer_type())
                    var_term = builder->create_sitofp(var_term, FLOAT_T);
                return builder->create_fadd(var_add, var_term);
            }
        }
        else if(node.op == OP_MINUS){
            auto var_add = node.additive_expression->accept(*this);
            if(var_add->get_type()->is_integer_type() && var_term->get_type()->is_integer_type())
                return builder->create_isub(var_add, var_term);
            else{
                if(var_add->get_type()->is_integer_type())
                    var_add = builder->create_sitofp(var_add, FLOAT_T);
                if(var_term->get_type()->is_integer_type())
                    var_term = builder->create_sitofp(var_term, FLOAT_T);
                return builder->create_fsub(var_add, var_term);
            }
        }
    }
    return var_term;
}

Value* CminusfBuilder::visit(ASTTerm &node) {
    Value* var_factor = node.factor->accept(*this);
    if(var_factor->get_type()->is_pointer_type()){//是指针：指向数组的指针或指向变量的指针
        std::cout << context.change_to_value << std::endl;
        if(var_factor->get_type()->get_pointer_element_type()->is_array_type()){
            if(context.change_to_value == true){
                auto a0 = builder->create_gep(var_factor, {CONST_INT(0), CONST_INT(0)});
                std::cout << builder->create_load(a0)->print() << std::endl;
                var_factor =  builder->create_load(a0);
            }
            else{
                auto a0 = builder->create_gep(var_factor, {CONST_INT(0), CONST_INT(0)});
                std::cout << a0->get_type()->print() << std::endl;
                var_factor =  a0;
            }
        }
        else if(var_factor->get_type()->get_pointer_element_type()->is_pointer_type()){
            if(context.change_to_value == true){
                auto a0 = builder->create_load(var_factor);
                var_factor =  builder->create_load(a0);
            }
            else{
                auto a0 = builder->create_load(var_factor);
                var_factor =  a0;
            }
        }
        else{
            if(context.change_to_value == true){
                std::cout << var_factor->print() << std::endl;
                var_factor =  builder->create_load(var_factor);
            }
            else{
                std::cout << var_factor->print() << std::endl;
                var_factor =  var_factor;
            }
            //std::cout << var_factor->print() << std::endl;
            //return builder->create_load(var_factor);
        }
    }
    if(node.term != nullptr){
        if(node.op == OP_MUL){
            auto var_term = node.term->accept(*this);
            if(var_term->get_type()->is_integer_type() && var_factor->get_type()->is_integer_type())
                return builder->create_imul(var_term, var_factor);
            else{
                if(var_term->get_type()->is_integer_type())
                    var_term = builder->create_sitofp(var_term, FLOAT_T);
                if(var_factor->get_type()->is_integer_type())
                    var_factor = builder->create_sitofp(var_factor, FLOAT_T);
                return builder->create_fmul(var_term, var_factor);
            }
        }
        else if(node.op == OP_DIV){
            auto var_term = node.term->accept(*this);
            if(var_term->get_type()->is_integer_type() && var_factor->get_type()->is_integer_type())
                return builder->create_isdiv(var_term, var_factor);
            else{
                if(var_term->get_type()->is_integer_type()){
                    //std::cout << var_term->get_type()->print() << std::endl;
                    var_term = builder->create_sitofp(var_term, FLOAT_T);
                }
                if(var_factor->get_type()->is_integer_type())
                    var_factor = builder->create_sitofp(var_factor, FLOAT_T);
                std::cout << var_term->get_type()->print() << std::endl;
                std::cout << var_factor->get_type()->print() << std::endl;
                return builder->create_fdiv(var_term, var_factor);
            }
        }
    }
    return var_factor;
}

Value* CminusfBuilder::visit(ASTCall &node) {
    auto func = scope.find(node.id);
    std::vector<Value *> args;
    unsigned int i = 0;
    for (auto &arg : node.args) {
        std::cout << dynamic_cast<Function*>(func)->get_function_type()->get_param_type(i)->print() << std::endl;
        if(dynamic_cast<Function*>(func)->get_function_type()->get_param_type(i)->is_pointer_type()){
            context.change_to_value = false;
            context.i = i;
        }
        //std::cout << arg << std::endl;
        auto in_param = arg->accept(*this);
        context.change_to_value = true;
        //std::cout << in_param->get_type()->print() << std::endl;
        auto val_param = in_param;
        //auto alloca = builder->create_alloca(val_param->get_type());
        //如果实参是指向变量的指针，判断指针的指向类型是否与形参类型相符
        if(!in_param->get_type()->is_pointer_type()){//实数
            //判断参数类型是否相符（参数只能是int或float）
            if(in_param->get_type()->is_integer_type() && dynamic_cast<Function*>(func)->get_function_type()->get_param_type(i)->is_float_type())
                val_param = builder->create_sitofp(in_param, FLOAT_T);
            else if(in_param->get_type()->is_float_type() && dynamic_cast<Function*>(func)->get_function_type()->get_param_type(i)->is_integer_type())
                val_param = builder->create_fptosi(in_param, INT32_T);
            else
                val_param = in_param;
            args.push_back(val_param);
        }
        else{//指针
            if(in_param->get_type()->get_pointer_element_type()->is_integer_type() && dynamic_cast<Function*>(func)->get_function_type()->get_param_type(i)->get_pointer_element_type()->is_float_type())
                val_param = builder->create_sitofp(in_param, FLOATPTR_T);
            else if(in_param->get_type()->get_pointer_element_type()->is_float_type() && dynamic_cast<Function*>(func)->get_function_type()->get_param_type(i)->get_pointer_element_type()->is_integer_type())
                val_param = builder->create_fptosi(in_param, INT32PTR_T);
            else
                val_param = in_param;
            args.push_back(val_param);//arg数组中添加实参信息（数组的首地址）
        }   
        i++;
    }
    return builder->create_call(func, args);
}
