#pragma once

#include "Dominators.hpp"
#include "Instruction.hpp"
#include "Value.hpp"

#include <map>
#include <memory>
#include <stack>

class Mem2Reg : public Pass {
  private:
    Function *func_;
    std::unique_ptr<Dominators> dominators_;

    void Rename(BasicBlock *bb);
    //global_names_multi: map<name, vector<bb>>
    std::map<Value *, std::vector<BasicBlock *>> mem2reg_global_names_multi;
    std::map<Value *, std::stack<Value *>> mem2reg_global_names_stack;
    std::map<PhiInst *, Value *> phi_record;
    std::map<BasicBlock *, bool> bb_visited;
    //数组名字：（组内位置，对应变量）
    std::map<Value *, std::vector<std::pair<Value *, Value *>>> array_note;
    //参数有变量的getinst，其相关的load和store不能删除
    std::vector<Value *> val_getinst;


  public:
    Mem2Reg(Module *m) : Pass(m) {}
    ~Mem2Reg() = default;

    void run() override;

    void generate_phi();
    void rename(BasicBlock *bb);

    static inline bool is_global_variable(Value *l_val) {
        return dynamic_cast<GlobalVariable *>(l_val) != nullptr;
    }
    static inline bool is_gep_instr(Value *l_val) {
        return dynamic_cast<GetElementPtrInst *>(l_val) != nullptr;
    }

    static inline bool is_valid_ptr(Value *l_val) {
        return not is_global_variable(l_val) and not is_gep_instr(l_val);
    }
};
