#include "CodeGen.hpp"

#include "CodeGenUtil.hpp"
#include <string>

void CodeGen::allocate() {
    // 备份 $ra $fp
    unsigned offset = PROLOGUE_OFFSET_BASE;

    // 为每个参数分配栈空间
    for (auto &arg : context.func->get_args()) {
        auto size = arg.get_type()->get_size();
        offset = ALIGN(offset + size, size);
        context.offset_map[&arg] = -static_cast<int>(offset);
    }

    // 为指令结果分配栈空间
    for (auto &bb : context.func->get_basic_blocks()) {
        for (auto &instr : bb.get_instructions()) {
            // 每个非 void 的定值都分配栈空间
            if (not instr.is_void()) {
                std::cout << instr.get_name() << std::endl;
                if(not instr.is_phi()){
                    auto size = instr.get_type()->get_size();
                    offset = ALIGN(offset + size, size);
                }
                else{
                    auto size = 4;
                    offset = ALIGN(offset + size, size);
                }
                context.offset_map[&instr] = -static_cast<int>(offset);
            }
            // alloca 的副作用：分配额外空间
            if (instr.is_alloca()) {
                auto *alloca_inst = static_cast<AllocaInst *>(&instr);
                auto alloc_size = alloca_inst->get_alloca_type()->get_size();
                offset += alloc_size;
            }
        }
    }

    // 分配栈空间，需要是 16 的整数倍
    context.frame_size = ALIGN(offset, PROLOGUE_ALIGN);
}

void CodeGen::load_to_greg(Value *val, const Reg &reg) {
    std::cout<<val->get_type()<<std::endl;
    std::cout<<val->get_type()->is_void_type()<<std::endl;
    std::cout<<val->get_type()->is_function_type()<<std::endl;
    std::cout<<val->get_type()->is_label_type()<<std::endl;//1
    std::cout<<val->get_type()->is_function_type()<<std::endl;
    assert(val->get_type()->is_integer_type() ||
           val->get_type()->is_pointer_type());

    if (auto *constant = dynamic_cast<ConstantInt *>(val)) {
        int32_t val = constant->get_value();
        if (IS_IMM_12(val)) {
            append_inst(ADDI WORD, {reg.print(), "$zero", std::to_string(val)});
        } else {
            load_large_int32(val, reg);
        }
    } else if (auto *global = dynamic_cast<GlobalVariable *>(val)) {
        append_inst(LOAD_ADDR, {reg.print(), global->get_name()});
    } else {
        load_from_stack_to_greg(val, reg);
    }
}

void CodeGen::load_large_int32(int32_t val, const Reg &reg) {
    int32_t high_20 = val >> 12; // si20
    uint32_t low_12 = val & LOW_12_MASK;
    append_inst(LU12I_W, {reg.print(), std::to_string(high_20)});
    append_inst(ORI, {reg.print(), reg.print(), std::to_string(low_12)});
}

void CodeGen::load_large_int64(int64_t val, const Reg &reg) {
    auto low_32 = static_cast<int32_t>(val & LOW_32_MASK);
    load_large_int32(low_32, reg);

    auto high_32 = static_cast<int32_t>(val >> 32);
    int32_t high_32_low_20 = (high_32 << 12) >> 12; // si20
    int32_t high_32_high_12 = high_32 >> 20;        // si12
    append_inst(LU32I_D, {reg.print(), std::to_string(high_32_low_20)});
    append_inst(LU52I_D,
                {reg.print(), reg.print(), std::to_string(high_32_high_12)});
}

void CodeGen::load_from_stack_to_greg(Value *val, const Reg &reg) {
    auto offset = context.offset_map.at(val);
    auto offset_str = std::to_string(offset);
    auto *type = val->get_type();
    if (IS_IMM_12(offset)) {
        if (type->is_int1_type()) {
            append_inst(LOAD BYTE, {reg.print(), "$fp", offset_str});
        } else if (type->is_int32_type()) {
            append_inst(LOAD WORD, {reg.print(), "$fp", offset_str});
        } else { // Pointer
            append_inst(LOAD DOUBLE, {reg.print(), "$fp", offset_str});
        }
    } else {
        load_large_int64(offset, reg);
        append_inst(ADD DOUBLE, {reg.print(), "$fp", reg.print()});
        if (type->is_int1_type()) {
            append_inst(LOAD BYTE, {reg.print(), reg.print(), "0"});
        } else if (type->is_int32_type()) {
            append_inst(LOAD WORD, {reg.print(), reg.print(), "0"});
        } else { // Pointer
            append_inst(LOAD DOUBLE, {reg.print(), reg.print(), "0"});
        }
    }
}

void CodeGen::store_from_greg(Value *val, const Reg &reg) {
    auto offset = context.offset_map.at(val);
    auto offset_str = std::to_string(offset);
    auto *type = val->get_type();
    if (IS_IMM_12(offset)) {
        if (type->is_int1_type()) {
            append_inst(STORE BYTE, {reg.print(), "$fp", offset_str});
        } else if (type->is_int32_type()) {
            append_inst(STORE WORD, {reg.print(), "$fp", offset_str});
        } else { // Pointer
            append_inst(STORE DOUBLE, {reg.print(), "$fp", offset_str});
        }
    } else {
        auto addr = Reg::t(8);
        load_large_int64(offset, addr);
        append_inst(ADD DOUBLE, {addr.print(), "$fp", addr.print()});
        if (type->is_int1_type()) {
            append_inst(STORE BYTE, {reg.print(), addr.print(), "0"});
        } else if (type->is_int32_type()) {
            append_inst(STORE WORD, {reg.print(), addr.print(), "0"});
        } else { // Pointer
            append_inst(STORE DOUBLE, {reg.print(), addr.print(), "0"});
        }
    }
}

void CodeGen::load_to_freg(Value *val, const FReg &freg) {
    assert(val->get_type()->is_float_type());
    if (auto *constant = dynamic_cast<ConstantFP *>(val)) {
        float val = constant->get_value();
        load_float_imm(val, freg);
    } else {
        auto offset = context.offset_map.at(val);
        auto offset_str = std::to_string(offset);
        if (IS_IMM_12(offset)) {
            append_inst(FLOAD SINGLE, {freg.print(), "$fp", offset_str});
        } else {
            auto addr = Reg::t(8);
            load_large_int64(offset, addr);
            append_inst(ADD DOUBLE, {addr.print(), "$fp", addr.print()});
            append_inst(FLOAD SINGLE, {freg.print(), addr.print(), "0"});
        }
    }
}

void CodeGen::load_float_imm(float val, const FReg &r) {
    int32_t bytes = *reinterpret_cast<int32_t *>(&val);
    load_large_int32(bytes, Reg::t(8));
    append_inst(GR2FR WORD, {r.print(), Reg::t(8).print()});
}

void CodeGen::store_from_freg(Value *val, const FReg &r) {
    auto offset = context.offset_map.at(val);
    if (IS_IMM_12(offset)) {
        auto offset_str = std::to_string(offset);
        append_inst(FSTORE SINGLE, {r.print(), "$fp", offset_str});
    } else {
        auto addr = Reg::t(8);
        load_large_int64(offset, addr);
        append_inst(ADD DOUBLE, {addr.print(), "$fp", addr.print()});
        append_inst(FSTORE SINGLE, {r.print(), addr.print(), "0"});
    }
}

void CodeGen::gen_prologue() {
    // 寄存器备份及栈帧设置
    if (IS_IMM_12(-static_cast<int>(context.frame_size))) {
        append_inst("st.d $ra, $sp, -8");
        append_inst("st.d $fp, $sp, -16");
        append_inst("addi.d $fp, $sp, 0");
        append_inst("addi.d $sp, $sp, " +
                    std::to_string(-static_cast<int>(context.frame_size)));
    } else {
        load_large_int64(context.frame_size, Reg::t(0));
        append_inst("st.d $ra, $sp, -8");
        append_inst("st.d $fp, $sp, -16");
        append_inst("sub.d $sp, $sp, $t0");
        append_inst("add.d $fp, $sp, $t0");
    }

    // 将函数参数转移到栈帧上
    int garg_cnt = 0;
    int farg_cnt = 0;
    for (auto &arg : context.func->get_args()) {
        if (arg.get_type()->is_float_type()) {
            store_from_freg(&arg, FReg::fa(farg_cnt++));
        } else { // int or pointer
            store_from_greg(&arg, Reg::a(garg_cnt++));
        }
    }
}

void CodeGen::gen_epilogue() {
    // 1. 恢复 $ra $fp
    // 2. 恢复栈帧
    // 3. 函数返回
    append_inst(context.func->get_name().append("_exit"), ASMInstruction::Label);
    load_large_int32(context.frame_size, Reg::t(0));
    append_inst("add.d $sp, $sp, $t0");
    append_inst("ld.d $ra, $sp, -8");
    append_inst("ld.d $fp, $sp, -16");
    append_inst("jr $ra");
}

void CodeGen::gen_ret() {
    auto *retInst = static_cast<ReturnInst *>(context.inst);
    if (not retInst->is_void_ret()) {
        auto *retVal = retInst->get_operand(0);
        if (retVal->get_type()->is_float_type()) {
            load_to_freg(retVal, FReg::fa(0));
        } else {
            load_to_greg(retVal, Reg::a(0));
        }
    }
    else
        append_inst("addi.w $a0, $zero, 0");
    append_inst("b " + context.func->get_name().append("_exit"));
    //gen_epilogue();
}

void CodeGen::gen_br() {
    auto *branchInst = static_cast<BranchInst *>(context.inst);
    if (branchInst->is_cond_br()) {
        auto *truebb = static_cast<BasicBlock *>(branchInst->get_operand(1));
        auto *falsebb = static_cast<BasicBlock *>(branchInst->get_operand(2));
        auto *cond = branchInst->get_operand(0);
        load_to_greg(cond, Reg::t(0));
        append_inst("andi $t0, $t0, 1");
        append_inst("beqz " + Reg::t(0).print() + ", " + label_name(falsebb));
        append_inst("b " + label_name(truebb));
    } else {
        auto *branchbb = static_cast<BasicBlock *>(branchInst->get_operand(0));
        append_inst("b " + label_name(branchbb));
    }
}

void CodeGen::gen_binary() {
    // 分别将左右操作数加载到 $t0 $t1
    load_to_greg(context.inst->get_operand(0), Reg::t(0));
    load_to_greg(context.inst->get_operand(1), Reg::t(1));
    // 根据指令类型生成汇编
    switch (context.inst->get_instr_type()) {
    case Instruction::add:
        output.emplace_back("add.w $t2, $t0, $t1");
        break;
    case Instruction::sub:
        output.emplace_back("sub.w $t2, $t0, $t1");
        break;
    case Instruction::mul:
        output.emplace_back("mul.w $t2, $t0, $t1");
        break;
    case Instruction::sdiv:
        output.emplace_back("div.w $t2, $t0, $t1");
        break;
    default:
        assert(false);
    }
    // 将结果填入栈帧中
    store_from_greg(context.inst, Reg::t(2));
}

void CodeGen::gen_float_binary() {
    // 浮点类型的二元指令
    auto *fbinaryinst = static_cast<FBinaryInst *>(context.inst);
    load_to_freg(fbinaryinst->get_operand(0), FReg::ft(0));
    load_to_freg(fbinaryinst->get_operand(1), FReg::ft(1));
    switch(fbinaryinst->get_instr_type()){
        case Instruction::fadd:
            append_inst("fadd.s $ft2, $ft0, $ft1");
            break;
        case Instruction::fsub:
            append_inst("fsub.s $ft2, $ft0, $ft1");
            break;
        case Instruction::fmul:
            append_inst("fmul.s $ft2, $ft0, $ft1");
            break;
        case Instruction::fdiv:
            append_inst("fdiv.s $ft2, $ft0, $ft1");
            break;
        default:
            assert(false);
    }
    store_from_freg(context.inst, FReg::ft(2));
}

void CodeGen::gen_alloca() {
    auto *allocainst = static_cast<AllocaInst *>(context.inst);
    auto alloca_size = allocainst->get_alloca_type()->get_size();
    //auto *alloca_ptr = allocainst->get_operand(0);
    //load_large_int64(alloca_size, Reg::t(0));
    int offset = context.offset_map.at(allocainst) - static_cast<int>(alloca_size);//+ - 8  static_cast<int>(alloca_size);//
    append_inst("addi.d $t1, $fp, " + std::to_string(static_cast<int>(offset)));//,);//alloca栈顶地址
    store_from_greg(context.inst, Reg::t(1));
}

void CodeGen::gen_load() {
    auto *ptr = context.inst->get_operand(0);
    auto *type = context.inst->get_type();

    load_to_greg(ptr, Reg::t(0));

    if (type->is_float_type()) {
        append_inst("fld.s $ft0, $t0, 0");
        store_from_freg(context.inst, FReg::ft(0));
    } else {
        // load 整数类型的数据
        if(type->get_size() == 8){//ptr->get_type()->get_pointer_element_type()->is_pointer_type()
            //if(ptr->get_type()->get_pointer_element_type()->get_pointer_element_type()->is_pointer_type()){
                append_inst("ld.d $t1, $t0, 0");
                store_from_greg(context.inst, Reg::t(1));
            //}
            /*else{
                append_inst("ld.w $t1, $t0, 0");
                store_from_greg(context.inst, Reg::t(1));
            }*/
        }
        else{
            append_inst("ld.w $t1, $t0, 0");
            store_from_greg(context.inst, Reg::t(1));
        }
        //append_inst("ld.w $t1, $t0, 0");
        //store_from_greg(context.inst, Reg::t(1));
    }
}

void CodeGen::gen_store() {
    // 翻译 store 指令
    auto *ptr = context.inst->get_operand(1);
    auto *val = context.inst->get_operand(0);
    auto *type = val->get_type();
    load_to_greg(ptr, Reg::t(0));
    if (type->is_float_type()) {
        load_to_freg(val, FReg::ft(0));
        append_inst("fst.s $ft0, $t0, 0");      
    } 
    /*else if(type->is_pointer_type())
    {
        load_to_greg(val, Reg::t(1));
        append_inst("st.d $t1, $t0, 0");
    }*/
    else //if (type->is_int32_type() || type->is_int1_type())
    {
        load_to_greg(val, Reg::t(1));
        std::cout<<type->get_size()<<std::endl;
        if(type->get_size() == 8){//ptr->get_type()->get_pointer_element_type()->is_pointer_type()
            //if(ptr->get_type()->get_pointer_element_type()->get_pointer_element_type()->is_pointer_type())
                append_inst("st.d $t1, $t0, 0");
            //else
            //    append_inst("st.w $t1, $t0, 0");
        }
        else
            append_inst("st.w $t1, $t0, 0");
    }
}

std::string b = "b";
void CodeGen::gen_icmp() {
    //处理各种整数比较的情况
    auto *icmpinst = static_cast<ICmpInst *>(context.inst);
    auto *op0 = icmpinst->get_operand(0);
    auto *op1 = icmpinst->get_operand(1);
    load_to_greg(op0, Reg::t(0));
    /*printf("op0: %s\n", op0->get_name().c_str());
    std::cout<<"op1: "<<op1->get_name()<<std::endl;
    std::cout<<op1->get_type()<<std::endl;
    std::cout<<op1->get_type()->is_pointer_type()<<std::endl;
    std::cout<<op1->print()<<std::endl;*/
    if(op1->print() == "zeroinitializer")
        load_large_int32(0, Reg::t(1));
    else
        load_to_greg(op1, Reg::t(1));
    b.append("b");
    switch(icmpinst->get_instr_type()){
        case Instruction::eq:
            append_inst("beq $t0, $t1, .store_1" + b);
            break;
        case Instruction::ne:
            append_inst("bne $t0, $t1, .store_1" + b);
            break;
        case Instruction::gt://t2 = t0 > t1
            append_inst("blt $t1, $t0, .store_1" + b);
            break;
        case Instruction::ge://t2 = t0 >= t1
            append_inst("bge $t0, $t1, .store_1" + b);
            break;
        case Instruction::lt://t2 = t0 < t1
            append_inst("blt $t0, $t1, .store_1" + b);
            break;
        case Instruction::le://t2 = t0 <= t1
            append_inst("bge $t1, $t0, .store_1" + b);
            break;
        default:
            assert(false);
    }
    append_inst("addi.w $t2, $zero, 0");
    append_inst("b .toend" + b);
    append_inst(".store_1" + b, ASMInstruction::Label);
    append_inst("addi.w $t2, $zero, 1");
    append_inst(".toend" + b, ASMInstruction::Label);
    store_from_greg(context.inst, Reg::t(2));
}

std::string c = "c";
void CodeGen::gen_fcmp() {
    //处理各种浮点数比较的情况
    auto *fcmpinst = static_cast<FCmpInst *>(context.inst);
    auto *op0 = fcmpinst->get_operand(0);
    auto *op1 = fcmpinst->get_operand(1);
    load_to_freg(op0, FReg::ft(0));
    load_to_freg(op1, FReg::ft(1));
    switch(fcmpinst->get_instr_type()){
        case Instruction::feq:
            append_inst("fcmp.seq.s $fcc0, $ft0, $ft1");
            break;
        case Instruction::fne:
            append_inst("fcmp.sne.s $fcc0, $ft0, $ft1");
            break;
        case Instruction::fgt://ft0 > ft1
            append_inst("fcmp.slt.s $fcc0, $ft1, $ft0");
            break;
        case Instruction::fge://ft0 >= ft1
            append_inst("fcmp.sle.s $fcc0, $ft1, $ft0");
            break;
        case Instruction::flt://ft0 < ft1
            append_inst("fcmp.slt.s $fcc0, $ft0, $ft1");
            break;
        case Instruction::fle://ft0 <= ft1
            append_inst("fcmp.sle.s $fcc0, $ft0, $ft1");
            break;
        default:
            assert(false);
    }
    append_inst("beqz $fcc0, .store_0" + c.append("c"));
    append_inst("addi.w $t2, $zero, 1");
    append_inst("b .toend" + c);
    append_inst(".store_0" + c, ASMInstruction::Label);
    append_inst("addi.w $t2, $zero, 0");
    append_inst(".toend" + c, ASMInstruction::Label);
    store_from_greg(context.inst, Reg::t(2));
}

std::string a = "a";
void CodeGen::gen_zext() {
    //将窄位宽的整数数据进行零扩展
    auto *zextinst = static_cast<ZextInst *>(context.inst);
    auto *op0 = zextinst->get_operand(0);
    //auto *op1 = zextinst->get_operand(1);
    load_to_greg(op0, Reg::t(0));//1bit数
    append_inst("andi $t0, $t0, 1");
    append_inst("beqz $t0, .store_0" + a.append("a"));// 
    append_inst("addi.w $t1, $zero, 1");
    append_inst("b .toend" + a);//
    append_inst(".store_0" + a, ASMInstruction::Label);//
    append_inst("addi.w $t1, $zero, 0");
    append_inst(".toend" + a, ASMInstruction::Label);//
    store_from_greg(context.inst, Reg::t(1));
}

void CodeGen::gen_call() {
    //函数调用，注意我们只需要通过寄存器传递参数，即不需考虑栈上传参的情况
    auto *callinst = static_cast<CallInst *>(context.inst);
    for(int i = 0; i < callinst->get_num_operand()-1; i++){
        auto *arg = callinst->get_operand(i+1);
        if(arg->get_type()->is_float_type()){
            load_to_freg(arg, FReg::fa(i));
        }
        else if(arg->get_type()->is_integer_type()){
            load_to_greg(arg, Reg::a(i));
        }
        else if(arg->get_type()->is_pointer_type()){
            load_to_greg(arg, Reg::a(i));
        }
    }
    
    append_inst("bl " + callinst->get_operand(0)->get_name());
    auto typeisvoid = static_cast<Function *>(context.inst->get_operand(0))->get_return_type()->is_void_type();
    if(!typeisvoid){
        if(callinst->get_function_type()->get_return_type()->is_float_type()){
            store_from_freg(context.inst, FReg::fa(0));
        }
        else{
            store_from_greg(context.inst, Reg::a(0));
        }
    }
}

void CodeGen::gen_gep() {
    //计算内存地址
    auto *gepinst = static_cast<GetElementPtrInst *>(context.inst);
    auto *ptr = gepinst->get_operand(0);
    auto *offset = gepinst->get_operand(1);
    if(gepinst->get_num_operand() >= 3){
        offset = gepinst->get_operand(2);
    }
    else{
        offset = gepinst->get_operand(1);
    }
    load_to_greg(ptr, Reg::t(0));
    load_to_greg(offset, Reg::t(2));
    auto size = gepinst->get_type()->get_pointer_element_type()->get_size();
    load_large_int32(size, Reg::t(1));
    append_inst("mul.w $t3, $t2, $t1");
    append_inst("add.d $t4, $t0, $t3");
    store_from_greg(context.inst, Reg::t(4));
}

void CodeGen::gen_sitofp() {
    //整数转向浮点数
    auto *sitofpinst = static_cast<SiToFpInst *>(context.inst);
    auto *op0 = sitofpinst->get_operand(0);
    load_to_greg(op0, Reg::t(0));
    append_inst("movgr2fr.w $ft0, $t0");
    append_inst("ffint.s.w $ft1, $ft0");
    store_from_freg(context.inst, FReg::ft(1));//op0
}

void CodeGen::gen_fptosi() {
    //浮点数转向整数，注意向下取整(round to zero)
    auto *fptosiinst = static_cast<FpToSiInst *>(context.inst);
    auto *op0 = fptosiinst->get_operand(0);
    load_to_freg(op0, FReg::ft(0));
    append_inst("ftintrz.w.s $ft1, $ft0");
    store_from_freg(context.inst, FReg::ft(1));//op0
}

void CodeGen::gen_phi(){

}

void CodeGen::run() {
    m->set_print_name();

    // 使用 GNU 伪指令为全局变量分配空间
    if (!m->get_global_variable().empty()) {
        append_inst("Global variables", ASMInstruction::Comment);
        append_inst(".text", ASMInstruction::Atrribute);
        append_inst(".section", {".bss", "\"aw\"", "@nobits"},
                    ASMInstruction::Atrribute);
        for (auto &global : m->get_global_variable()) {
            auto size =
                global.get_type()->get_pointer_element_type()->get_size();
            append_inst(".globl", {global.get_name()},
                        ASMInstruction::Atrribute);
            append_inst(".type", {global.get_name(), "@object"},
                        ASMInstruction::Atrribute);
            append_inst(".size", {global.get_name(), std::to_string(size)},
                        ASMInstruction::Atrribute);
            append_inst(global.get_name(), ASMInstruction::Label);
            append_inst(".space", {std::to_string(size)},
                        ASMInstruction::Atrribute);
        }
    }

    // 函数代码段
    output.emplace_back(".text", ASMInstruction::Atrribute);
    for (auto &func : m->get_functions()) {
        if (not func.is_declaration()) {
            // 更新 context
            context.clear();
            context.func = &func;

            // 函数信息
            append_inst(".globl", {func.get_name()}, ASMInstruction::Atrribute);
            append_inst(".type", {func.get_name(), "@function"},
                        ASMInstruction::Atrribute);
            append_inst(func.get_name(), ASMInstruction::Label);

            // 分配函数栈帧
            allocate();
            // 生成 prologue
            gen_prologue();

            for (auto &bb : func.get_basic_blocks()) {
                append_inst(label_name(&bb), ASMInstruction::Label);
                for (auto &instr : bb.get_instructions()) {
                    // For debug
                    append_inst(instr.print(), ASMInstruction::Comment);
                    context.inst = &instr; // 更新 context
                    switch (instr.get_instr_type()) {
                    case Instruction::ret:
                    {
                        for (auto &bb_behind : func.get_basic_blocks()){
                            for (auto &instr : bb_behind.get_instructions()){
                                if(instr.get_instr_type() == Instruction::phi){
                                    auto *phiinst = static_cast<Instruction *>(&instr);//待插入的地址
                                    for(int i = 1; i < instr.get_num_operand(); i = i + 2){
                                        auto *next_bb = instr.get_operand(i);
                                        auto *op0 = instr.get_operand(i-1);
                                        if(next_bb == &bb){//插入add
                                            load_to_greg(op0, Reg::t(0));
                                            //append_inst("addi.d $t0, $zero, 0");
                                            store_from_greg(phiinst, Reg::t(0));
                                        }
                                    }
                                }
                            }
                        }
                        gen_ret();
                        break;
                    }
                    case Instruction::br:
                    {
                        //bool flag = false;
                        for (auto &bb_behind : func.get_basic_blocks()){
                            for (auto &instr : bb_behind.get_instructions()){
                                if(instr.get_instr_type() == Instruction::phi){
                                    auto *phiinst = static_cast<Instruction *>(&instr);//待插入的地址
                                    for(int i = 1; i < instr.get_num_operand(); i = i + 2){
                                        auto *next_bb = instr.get_operand(i);
                                        auto *op0 = instr.get_operand(i-1);
                                        if(next_bb == &bb){//插入add
                                            load_to_greg(op0, Reg::t(0));
                                            //append_inst("addi.d $t0, $zero, 0");
                                            store_from_greg(phiinst, Reg::t(0));
                                        }
                                    }
                                }
                            }
                        }
                        gen_br();
                        break;
                    }
                    case Instruction::add:
                    case Instruction::sub:
                    case Instruction::mul:
                    case Instruction::sdiv:
                        gen_binary();
                        break;
                    case Instruction::fadd:
                    case Instruction::fsub:
                    case Instruction::fmul:
                    case Instruction::fdiv:
                        gen_float_binary();
                        break;
                    case Instruction::alloca:
                        gen_alloca();
                        break;
                    case Instruction::load:
                        gen_load();
                        break;
                    case Instruction::store:
                        gen_store();
                        break;
                    case Instruction::ge:
                    case Instruction::gt:
                    case Instruction::le:
                    case Instruction::lt:
                    case Instruction::eq:
                    case Instruction::ne:
                        gen_icmp();
                        break;
                    case Instruction::fge:
                    case Instruction::fgt:
                    case Instruction::fle:
                    case Instruction::flt:
                    case Instruction::feq:
                    case Instruction::fne:
                        gen_fcmp();
                        break;
                    case Instruction::phi:
                        //throw not_implemented_error{"need to handle phi!"};
                        gen_phi();
                        break;
                    case Instruction::call:
                        gen_call();
                        break;
                    case Instruction::getelementptr:
                        gen_gep();
                        break;
                    case Instruction::zext:
                        gen_zext();
                        break;
                    case Instruction::fptosi:
                        gen_fptosi();
                        break;
                    case Instruction::sitofp:
                        gen_sitofp();
                        break;
                    }
                }
            }
            // 生成 epilogue
            gen_epilogue();
        }
    }
}

std::string CodeGen::print() const {
    std::string result;
    for (const auto &inst : output) {
        result += inst.format();
    }
    return result;
}
