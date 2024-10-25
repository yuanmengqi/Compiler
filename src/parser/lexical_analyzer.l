%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>

#include "syntax_tree.h"
#include "syntax_analyzer.h"

int lines = 1;
int pos_start = 1;
int pos_end = 1;

void pass_node(char *text){
     yylval.node = new_syntax_tree_node(text);
}


%}


%%
\/\*[^*]*(\*\**[^/][^*]*)*\**\*\/ { pos_start = pos_end; pos_end += strlen(yytext); }

\+ {pos_start = pos_end; pos_end += 1; pass_node(yytext); return ADD;}
\- { pos_start = pos_end; pos_end++; pass_node(yytext); return SUB; }
\* { pos_start = pos_end; pos_end++; pass_node(yytext); return MUL; }
\/ { pos_start = pos_end; pos_end++; pass_node(yytext); return DIV; }
\( { pos_start = pos_end; pos_end++; pass_node(yytext); return LPAREN; }
\) { pos_start = pos_end; pos_end++; pass_node(yytext); return RPAREN; }
\[ { pos_start = pos_end; pos_end++; pass_node(yytext); return LBRACKET; }
\] { pos_start = pos_end; pos_end++; pass_node(yytext); return RBRACKET; }
\{ { pos_start = pos_end; pos_end++; pass_node(yytext); return LBRACE; }
\} { pos_start = pos_end; pos_end++; pass_node(yytext); return RBRACE; }
, { pos_start = pos_end; pos_end++; pass_node(yytext); return COMMA; }
; { pos_start = pos_end; pos_end++; pass_node(yytext); return SEMI; }
\< { pos_start = pos_end; pos_end++; pass_node(yytext); return LT; } 
"<=" { pos_start = pos_end; pos_end = pos_end + 2; pass_node(yytext); return LE; }
\> { pos_start = pos_end; pos_end++; pass_node(yytext); return GT; }
">=" { pos_start = pos_end; pos_end = pos_end + 2; pass_node(yytext); return GE; }
"==" { pos_start = pos_end; pos_end = pos_end + 2; pass_node(yytext); return EQ; }
"!=" { pos_start = pos_end; pos_end = pos_end + 2; pass_node(yytext); return NE; }
\= { pos_start = pos_end; pos_end++; pass_node(yytext); return ASSIGN; }

else { pos_start = pos_end; pos_end += 4;pass_node(yytext); return ELSE; }
if { pos_start = pos_end; pos_end += 2; pass_node(yytext); return IF; }
int { pos_start = pos_end; pos_end += 3; pass_node(yytext); return INT; }
return { pos_start = pos_end; pos_end += 6; pass_node(yytext); return RETURN; }
void { pos_start = pos_end; pos_end += 4; pass_node(yytext); return VOID; }
while { pos_start = pos_end; pos_end += 5; pass_node(yytext); return WHILE; }
float { pos_start = pos_end; pos_end += 5; pass_node(yytext); return FLOAT; }


[a-zA-Z]+ { pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return ID; }
[0-9]+ { pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return INTEGER; }
[0-9]+\. { pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return NUMBERFLOAT; }
[0-9]*\.[0-9]+ { pos_start = pos_end; pos_end += strlen(yytext); pass_node(yytext); return NUMBERFLOAT; }

\n { lines++; pos_start = 1; pos_end = 1; }
" "|\t { pos_start = pos_end; pos_end++; }
. { pos_start = pos_end; pos_end++; return ERROR; }

%%