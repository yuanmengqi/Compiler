#include "Dominators.hpp"

int order = 0;
void Dominators::run() {
    for (auto &f1 : m_->get_functions()) {
        auto f = &f1;
        if (f->get_basic_blocks().size() == 0)
            continue;
        for (auto &bb1 : f->get_basic_blocks()) {
            auto bb = &bb1;
            idom_.insert({bb, {}});
            dom_frontier_.insert({bb, {}});
            dom_tree_succ_blocks_.insert({bb, {}});
        }

        create_idom(f);
        create_dominance_frontier(f);
        create_dom_tree_succ(f);
        order = 0;
        dfs_order = {};
        std::cout << dfs_order.size() << std::endl;
    }
}


void Dominators::create_idom(Function *f) { //idom是直接支配
    // 得到 f 中各个基本块的 idom
    //std::map<BasicBlock *,BasicBlock *> doms;
    BasicBlock *intersect(BasicBlock *b1, BasicBlock *b2, std::map<BasicBlock *,BasicBlock *> doms, std::map<BasicBlock *, int> dfs_order);
    for (auto &bb : f->get_basic_blocks()) {
        idom_.insert({&bb, nullptr});
    }
    auto start_node = f->get_entry_block();
    idom_[start_node] = start_node;
    get_dfs_order(start_node);  //得到dfs_order
    //print
    std::cout << f->get_basic_blocks().size() << std::endl;
    for(auto &dfs_node : dfs_order) {
        std::cout << dfs_node.first->get_name() << " " << dfs_node.second << std::endl;
    }
    bool changed = true;
    while (changed) {
        changed = false;
        //for all nodes,b,in reverse postorder(except start_node)
        for (auto &bb : f->get_basic_blocks()) {
            if (&bb == start_node) {
                continue;
            }
            BasicBlock *new_idom = nullptr;
            //b.idom = first node in preds(b)
            for (auto &pred : bb.get_pre_basic_blocks()) {
                if (idom_[pred] != nullptr) { //找到前驱基本块的终止指令
                    new_idom = pred;
                    break;
                }
            }
            //for all other preds(b),p
            for (auto &pred : bb.get_pre_basic_blocks()) {
                if (pred == new_idom) {
                    continue;
                }
                //if doms[p] != null
                if (idom_[pred] != nullptr) {
                    new_idom = intersect(pred, new_idom, idom_, dfs_order);
                }
            }
            //if doms[b] != new_idom
            if (idom_[&bb] != new_idom) {
                idom_[&bb] = new_idom;
                changed = true;
            }
        }
    }
    //print
    for(auto &idom_node : idom_) {
        std::cout << idom_node.first->get_name() << " " << idom_node.second->get_name() << std::endl;
    }
}
//function intersect(b1,b2) returns node
BasicBlock * intersect(BasicBlock *b1, BasicBlock *b2, std::map<BasicBlock *,BasicBlock *> doms, std::map<BasicBlock *, int> dfs_order)
{
    BasicBlock *finger1 = b1;
    BasicBlock *finger2 = b2;
    //遍历dfs_order的map，找到b1和b2的dfs_order
    int order_f1 = 0;
    int order_f2 = 0;
    for (auto &dfs_node : dfs_order) {
        if (dfs_node.first == b1) {
            order_f1 = dfs_node.second;
        }
        if (dfs_node.first == b2) {
            order_f2 = dfs_node.second;
        }
    }
    while(order_f1 != order_f2) {
        while (order_f1 < order_f2) {
            finger2 = doms[finger2];
            for(auto &dfs_node : dfs_order) {
                if (dfs_node.first == finger2) {
                    order_f2 = dfs_node.second;
                }
            }
        }
        while (order_f1 > order_f2) {
            finger1 = doms[finger1];
            for(auto &dfs_node : dfs_order) {
                if (dfs_node.first == finger1) {
                    order_f1 = dfs_node.second;
                }
            }
        }
    }
    return finger1;
    /*
    BasicBlock *finger1 = b1;
    BasicBlock *finger2 = b2;
    while (finger1 != finger2) {
        while (finger1 < finger2) {
            finger2 = doms[finger2];
        }
        while (finger1 > finger2) {
            finger1 = doms[finger1];
        }
    }
    return finger1;
    */
}


void Dominators::get_dfs_order(BasicBlock *bb) {
    dfs_order.insert({bb, order});
    order++;
    if (bb->get_succ_basic_blocks().size() != 0) {
        for(auto &succ : bb->get_succ_basic_blocks()) {
            if (dfs_order.find(succ) == dfs_order.end()) {
                get_dfs_order(succ);
            }
        }
    }
}    

void Dominators::create_dominance_frontier(Function *f) {
    // 得到 f 中各个基本块的支配边界集合
    //for all nodes,b
    for (auto &bb : f->get_basic_blocks()) {
        //if the number of predecessors of b >= 2
        if (bb.get_pre_basic_blocks().size() >= 2) {
            //for all predecessors,pred of b
            for (auto &pred : bb.get_pre_basic_blocks()) {
                BasicBlock *runner = pred;
                //while runner != idom(b)
                while (runner != idom_[&bb]) {
                    //add b to DF(runner)
                    dom_frontier_[runner].insert(&bb);
                    //runner = idom(runner)
                    runner = idom_[runner];
                }
            }
        }
    }
    //print
    for(auto &dom_frontier_node : dom_frontier_) {
        std::cout << dom_frontier_node.first->get_name() << " ";
        for (auto &dom_frontier_node2 : dom_frontier_node.second) {
            std::cout << dom_frontier_node2->get_name() << " ";
        }
        std::cout << std::endl;
    }
}

void Dominators::create_dom_tree_succ(Function *f) {
    // 得到 f 中各个基本块的支配树后继
    //找出在cfg中的后继节点
    for (auto &bb : f->get_basic_blocks()) {
        for (auto &succ : bb.get_succ_basic_blocks()) {
            dom_tree_succ_blocks_[&bb].insert(succ);
        }
    }
}
