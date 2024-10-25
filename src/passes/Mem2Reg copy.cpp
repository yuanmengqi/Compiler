#include "Mem2Reg.hpp"
#include "IRBuilder.hpp"
#include "Value.hpp"

#include <memory>

void Mem2Reg::run() {
    // 创建支配树分析 Pass 的实例
    dominators_ = std::make_unique<Dominators>(m_);
    // 建立支配树
    dominators_->run();
    // 以函数为单元遍历实现 Mem2Reg 算法
    for (auto &f : m_->get_functions()) {
        if (f.is_declaration())
            continue;
        func_ = &f;
        if (func_->get_basic_blocks().size() >= 1) {
            // 对应伪代码中 phi 指令插入的阶段
            generate_phi();
            for(auto &bb : func_->get_basic_blocks()){
                for(auto &instr : bb.get_instructions()){
                    std::cout << instr.get_instr_op_name() << std::endl;
                    std::cout << instr.get_type()->is_label_type() << std::endl;
                }
            }
            // 对应伪代码中重命名阶段
            rename(func_->get_entry_block());
        }
        val_getinst = {};
        // 后续 DeadCode 将移除冗余的局部变量的分配空间
    }
    for(auto &bb : func_->get_basic_blocks()){
        for(auto &instr : bb.get_instructions()){
            std::cout << instr.get_instr_op_name() << std::endl;
            std::cout << &instr << std::endl;
            for(int i = 0; i < instr.get_num_operand(); i++){
                std::cout << instr.get_operand(i) << std::endl;
            }
        }
    }
}

void Mem2Reg::generate_phi() {
    // step1：找到活跃在多个 block 的全局名字集合，以及它们所属的 bb 块
    //1.1 遍历每一个块，将变量名字和块的对应关系存入map中
    std::map<Value *, std::vector<BasicBlock *>> global_names;
    for (auto &bb : func_->get_basic_blocks()) {
        for (auto &instr : bb.get_instructions()) {
            if(instr.is_alloca()) {
                Value * name = static_cast<Value *>(&instr);
                std::cout << name->get_name() << std::endl;
                if (global_names.find(name) == global_names.end()) {//如果原来没有这个变量名字
                    std::vector<BasicBlock *> bb_vec;
                    bb_vec.push_back(&bb);
                    global_names.insert({name, bb_vec});
                } 
                else { //可能有多个定义
                    //如果bb不在vector中，就加入
                    if (std::find(global_names[name].begin(), global_names[name].end(), &bb) == global_names[name].end())
                        global_names[name].push_back(&bb);
                }
                //正常main函数中定义数组方式
                auto alloca = static_cast<AllocaInst *>(&instr);
                if(alloca->get_alloca_type()->is_array_type()){
                    std::vector<std::pair<Value *, Value *>> array;
                    array_note.insert({name, array});
                }
                /*else if(alloca->get_alloca_type()->is_pointer_type()){
                    //if(alloca->get_alloca_type()->get_pointer_element_type()->is_pointer_type()){
                        std::vector<std::pair<Value *, Value *>> array;
                        array_note.insert({name, array});
                    //}
                }*/
            }
            else if(instr.is_store()){
                Value * name = instr.get_operand(1);
                if (global_names.find(name) != global_names.end()) {
                    if(std::find(global_names[name].begin(), global_names[name].end(), &bb) == global_names[name].end())
                        global_names[name].push_back(&bb);
                }
                //函数中的数组定义方式
                if(name->get_type()->is_pointer_type()){
                    if(name->get_type()->get_pointer_element_type()->is_pointer_type()){
                        std::vector<std::pair<Value *, Value *>> array;
                        array_note.insert({name, array});
                    }
                }
            }
            else if(instr.is_load()){
                Value * name = instr.get_operand(0);
                if (global_names.find(name) != global_names.end()) {
                    if(std::find(global_names[name].begin(), global_names[name].end(), &bb) == global_names[name].end())
                        global_names[name].push_back(&bb);
                }
            }
        }
    }
    //1.2 遍历map，找到活跃在多个块的变量名字，放入新map中
    std::map<Value *, std::vector<BasicBlock *>> global_names_multi;
    for (auto &global_name : global_names) {
        if (global_name.second.size() > 1) {
            global_names_multi.insert(global_name);
        }
    }
    /*for(auto &global_name : global_names_multi){
        std::cout << global_name.first << std::endl;
        //for(auto &bb : global_name.second){
        //    std::cout << bb << std::endl;
        //}
        std::cout << global_name.second.size() << std::endl;
    }*/
    //将得到的map赋值给类的成员变量
    mem2reg_global_names_multi = global_names_multi;
    // step2：从支配树获取支配边界信息，并在对应位置插入 phi 指令
    //for v:variable name in original program
    for (auto &v : global_names_multi) {
        //F<-{}
        std::set<BasicBlock *> F;
        //W<-{}
        std::set<BasicBlock *> W;
        //找到定义v的所有块DEF
        std::vector<BasicBlock *> DEF;
        for(auto &bb : v.second){
            for(auto &instr : bb->get_instructions()){
                if(instr.is_store() && static_cast<Value *>(instr.get_operand(1)) == v.first){
                    DEF.push_back(bb);
                }
            }
        }
        for(auto &bb : DEF){
            std::cout << bb << std::endl;
        }
        //初始化W
        for(auto &d : DEF){
            W.insert(d);
        }
        while(!W.empty()){
            //从W中取出一个块x
            BasicBlock *x = *W.begin();
            W.erase(x);
            //for y in DF(x)
            //print
            for(auto &y : dominators_->get_dominance_frontier(x)){
                std::cout << y->get_name() << std::endl;
            }
            std::cout << W.size() << std::endl;
            auto next = dominators_->get_dominance_frontier(x);
            for(auto &y : next){ //auto &y : dominators_->get_dominance_frontier(x)
                //if v not in F 
                if(F.find(y) == F.end()){
                    //插入phi指令
                    auto phi = PhiInst::create_phi(v.first->get_type(), y); //v.first->get_type()!!!!!!
                    std::cout << phi->get_type()->is_label_type() << std::endl;
                    y->add_instr_begin(phi);
                    phi_record.insert({phi, v.first});
                    //std::cout << phi->get_type()->is_label_type() << std::endl;
                    //insert v into F
                    F.insert(y);
                    //if v not in DEF
                    if(std::find(DEF.begin(), DEF.end(), y) == DEF.end()){
                        //insert v into W
                        W.insert(y);
                    }
                }
            }
        }
    }
}

#include <map>
#include <stack>

void Mem2Reg::rename(BasicBlock *bb) {
    // step3：将 phi 指令作为 lval 的最新定值，lval 即是为局部变量 alloca 出的地址空间
    // step4：用 lval 最新的定值替代对应的load指令
    // step5：将 store 指令的 rval，也即被存入内存的值，作为 lval 的最新定值
    // step6：为 lval 对应的 phi 指令参数补充完整
    // step7：对 bb 在支配树上的所有后继节点，递归执行 re_name 操作
    // step8：pop出 lval 的最新定值
    // step9：清除冗余的指令
    std::map<Value *, std::stack<Value *>> lval;
    std::map<Value *, std::vector<BasicBlock *>> global_names_multi = mem2reg_global_names_multi;
    //for v:variable name in original program
    for(auto &v : global_names_multi){
        //初始化各stack为空
        std::stack<Value *> stack;
        lval.insert({v.first, stack});
    }
    mem2reg_global_names_stack = lval;
    //初始化bb_visited
    for(auto &bb : func_->get_basic_blocks()){
        bb_visited.insert({&bb, false});
    }
    //Rename(entry)
    Rename(bb);

    //删除冗余store
    for(auto &bb : func_->get_basic_blocks()){
        for(auto &instr : bb.get_instructions()){
            std::cout << instr.get_instr_op_name() << std::endl;
            std::cout << &instr << std::endl;
            for(int i = 0; i < instr.get_num_operand(); i++){
                std::cout << instr.get_operand(i) << std::endl;
            }
        }
        std::vector<Instruction *> store_delete;
        for(auto &instr_delete : bb.get_instructions()){
            //std::cout << &instr_delete << std::endl;
            if(instr_delete.is_store()){
                for(auto &stack : mem2reg_global_names_stack){
                    if(instr_delete.get_operand(1) == stack.first){
                        store_delete.push_back(&instr_delete);
                        std::cout << instr_delete.get_operand(1) << std::endl;
                        for(auto &getinst : val_getinst){
                            if(instr_delete.get_operand(1) == getinst)
                                store_delete.pop_back();
                        }
                        //if(auto *global = dynamic_cast<GlobalVariable *>(instr_delete.get_operand(1)))
                            //store_delete.pop_back();
                    }
                }
            }
        }
        for(auto &instr : store_delete){
            bb.erase_instr(instr);
        }
        for(auto &instr : bb.get_instructions()){
            std::cout << instr.get_instr_op_name() << std::endl;
            std::cout << &instr << std::endl;
            for(int i = 0; i < instr.get_num_operand(); i++){
                std::cout << instr.get_operand(i) << std::endl;
            }
        }
    }
    
}

void Mem2Reg::Rename(BasicBlock *bb) {
    bb_visited[bb] = true;
    for(auto &instr : bb->get_instructions()) {
        std::cout << instr.get_instr_op_name() << std::endl;
        std::map<Value *, std::stack<Value *>> stack = mem2reg_global_names_stack;
        if (instr.is_phi()) {
            PhiInst * phi_wait;
            phi_wait = static_cast<PhiInst *>(&instr);
            auto phi_inst = phi_record.find(phi_wait);
            mem2reg_global_names_stack[phi_inst->second].push(static_cast<Value *>(&instr));//phi_inst->second/static_cast<Value *>(&instr)/phi_inst->first
            std::cout << (&instr)->get_type()->is_label_type() << std::endl;
            std::cout << phi_inst->second << " " << phi_inst->second << " " << bb->get_name() << std::endl;
        }
        else if (instr.is_store()) {
            std::cout << instr.get_operand(0)<< std::endl;
            //if(instr.get_operand(0)->)
            std::cout << instr.get_operand(1)->get_type()->is_label_type() << std::endl;
            mem2reg_global_names_stack[instr.get_operand(1)].push(instr.get_operand(0));
            //std::cout << instr.get_operand(0)->get_type()->is_label_type() << std::endl;
            std::cout << instr.get_operand(1) << " " << instr.get_operand(0) << " " << bb->get_name() << std::endl;
        }
        else if (instr.is_load()) {
            Value * j = &instr;
            Value * k = instr.get_operand(0);
            bool keep = false;
            if(keep == false)
                j->replace_all_use_with(stack[k].top());
        }
        else if(instr.is_gep()){
            val_getinst.push_back(&instr);
        
    std::map<Value *, std::stack<Value *>> stack = mem2reg_global_names_stack;
    //填写后继基本块中的phi函数参数
    auto next = dominators_->get_dom_tree_succ_blocks(bb);
    for(auto &succ : next){//bb->get_succ_basic_blocks()
        std::cout << succ->get_name() << std::endl;
        for(auto &instr : succ->get_instructions()){
            if(instr.is_phi()){
                PhiInst * phi_wait;
                phi_wait = static_cast<PhiInst *>(&instr);
                auto phi_inst = phi_record.find(phi_wait);
                auto val = static_cast<Value *>(stack[phi_inst->second].top());
                phi_wait->add_phi_pair_operand(val, bb);
                std::cout << phi_inst->second << " " << val << " " << bb->get_name() << std::endl;
            }
        }
    }
    //递归遍历基本块
    auto next_bb = dominators_->get_dom_tree_succ_blocks(bb);
    for (auto &s : next_bb) {
        //如果遍历过，跳过
        std::cout << s->get_name() << std::endl;
        if(bb_visited[s]){
            continue;
        }
        Rename(s);
    }
    //恢复栈空间状态，退出本次调用
    for (auto &instr : bb->get_instructions()) {
        if (instr.is_store()) {
            std::cout << instr.get_operand(1) << std::endl;
            for(auto &stack1 : mem2reg_global_names_stack){
                std::cout << stack1.first << std::endl;
                if(instr.get_operand(1) == stack1.first){
                    stack1.second.pop();
                }
            }
        }
        else if(instr.is_phi()){
            PhiInst * phi_wait;
            phi_wait = static_cast<PhiInst *>(&instr);
            auto phi_inst = phi_record.find(phi_wait);
            for(auto &stack1 : stack){
                if(phi_inst->second == stack1.first){
                    stack1.second.pop();
                }
            }
        }
    }
}