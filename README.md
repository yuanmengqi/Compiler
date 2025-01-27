# Intro

This is the repository for a simple compiler from lexical analyzer to backend code generation.

* Constructed a lexical analyzer based on Cminus-F in `src/parser/lexical_analyzer.l`.
* Constructed a syntax analyzer in `src/parser/syntax_analyzer.y`.
* Completed the automated translation from the syntax tree to intermediate code(light IR) in `src/cminusfc/cminusf_builder.cpp` based on the Cminus-F parser.
* Translate intermediate code(light IR) into LoongArch assembly instructions in `src/codegen/` and `include/codegen/`.
* Improve code generation speed by adding the optimization pass Mem2Reg in `include/passes/` and `src/passes/`.
