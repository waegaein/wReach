grammar wReach;

/*
 * Lexer Rules
 */

fragment LOWERCASE : [a-z] ;
fragment UPPERCASE : [A-Z] ;
fragment DIGIT : [0-9] ;
fragment TRUE : 'True' ;
fragment FALSE : 'False' ;

DOT : '.' ;
COMMA : ',' ;
UNDER : '_' ;
COLON : ':' ;
PRIME : '\'';

OP_ASSIGN : '=' ;
OP_PLUS : '+' ;
OP_MINUS : '-' ;
OP_MULTI : '*' ;
OP_EXPON : '^' ;
OP_DIVIDE : '/' ;
OP_MODULO : '%' ;
OPERATOR : (OP_ASSIGN | OP_PLUS | OP_MINUS | OP_MULTI | OP_EXPON | OP_DIVIDE | OP_MODULO) ;

BOOL : 'bool' ;
INT : 'int' ;
REAL : 'real' ;

MODE : 'mode' ;
INVT : 'invt' ;
FLOW : 'flow' ;
JUMP : 'jump' ;
INIT : 'init' ;
GOAL : 'goal' ;

VAL_NUMBER : DIGIT+ (DOT DIGIT+)? ;
VAL_BOOL : (TRUE | FALSE) ;

VAR_ID : (LOWERCASE | UPPERCASE | UNDER)(LOWERCASE | UPPERCASE | UNDER | DIGIT)* ;

CMP_GT : '>' ;
CMP_GTE : '>=' ;
CMP_LT : '<' ;
CMP_LTE : '<=' ;
CMP_EQ : '==' ;
CMP_NEQ : '!=' ;

LPAREN : '(' ;
RPAREN : ')' ;
LCURLY : '{' ;
RCURLY : '}' ;
LBRCKT : '[' ;
RBRCKT : ']' ;

BLANK : (' ' | '\t' | '\n')+ -> skip;

/*
 * Parser Rules
 */

wReach : mode_var_list system_var_list mode_list init goal EOF ;

mode_var_list : (mode_var_decl)+ ;

mode_var_decl : var_type VAR_ID (var_range)? ;

system_var_list : (system_var_decl)+ ;

system_var_decl : VAR_ID var_range ;

mode_list : LCURLY (mode_decl)+ RCURLY ;

mode_decl : mode_condition invt flow jump ;

mode_condition : MODE VAR_ID cmp value ;

invt : INVT COLON invt_list ;

invt_list : (invt_decl)+ ;

invt_decl : VAR_ID cmp value ;

flow : FLOW COLON flow_list ;

flow_list : (flow_decl)+ ;

flow_decl : VAR_ID cmp value ;

jump : JUMP COLON jump_list ;

jump_list : (jump_decl)+ ;

jump_decl : VAR_ID PRIME OP_ASSIGN value ;

init : INIT COLON ;

goal : GOAL COLON ;

var_type : (BOOL | INT | REAL) ;

var_range : (LBRCKT value RBRCKT | LBRCKT value COMMA value RBRCKT) ;

value : (VAL_NUMBER | VAL_BOOL) ;

cmp : (CMP_GT | CMP_GTE | CMP_LT | CMP_LTE | CMP_EQ | CMP_NEQ) ;
