grammar wReach;

/*
 * Lexer Rules
 */

fragment CMP_GT : '>' ;
fragment CMP_GTE : '>=' ;
fragment CMP_LT : '<' ;
fragment CMP_LTE : '<=' ;
fragment CMP_EQ : '==' ;
fragment CMP_NEQ : '!=' ;

COMPARATOR : (CMP_GT | CMP_GTE | CMP_LT | CMP_LTE | CMP_EQ | CMP_NEQ) ;

fragment FUNC_SIN : 'sin' ;
fragment FUNC_COS : 'cos' ;
fragment FUNC_TAN : 'tan' ;
fragment FUNC_ASIN : 'asin' ;
fragment FUNC_ACOS : 'acos' ;
fragment FUNC_ATAN : 'atan' ;
fragment FUNC_LOG : 'log' ;
fragment FUNC_LN : 'ln' ;
fragment FUNC_SQRT : 'sqrt' ;

FUNCTION : (FUNC_SIN | FUNC_COS | FUNC_TAN | FUNC_ASIN | FUNC_ACOS | FUNC_ATAN | FUNC_LOG | FUNC_LN | FUNC_SQRT) ;

fragment DIGIT : [0-9] ;
fragment TRUE : 'True' ;
fragment FALSE : 'False' ;
fragment VAL_NUMBER : DIGIT+ (DOT DIGIT+)? ;
fragment VAL_BOOL : (TRUE | FALSE) ;

OP_EQUAL : '=' ;
OP_PLUS : '+' ;
OP_MINUS : '-' ;
OP_MULTI : '*' ;
OP_POWER : '^' ;
OP_DIVIDE : '/' ;
OP_MODULO : '%' ;

VALUE : ((OP_PLUS | OP_MINUS)? VAL_NUMBER | VAL_BOOL) ;

BOOL : 'bool' ;
INT : 'int' ;
REAL : 'real' ;

MODE : 'mode' ;
INVT : 'invt' ;
FLOW : 'flow' ;
JUMP : 'jump' ;
INIT : 'init' ;
GOAL : 'goal' ;

LPAREN : '(' ;
RPAREN : ')' ;
LCURLY : '{' ;
RCURLY : '}' ;
LBRCKT : '[' ;
RBRCKT : ']' ;

DIFF : 'd' ;
ARROW : '==>' ;
AND : 'and' ;

fragment LOWERCASE : [a-z] ;
fragment UPPERCASE : [A-Z] ;

DOT : '.' ;
COMMA : ',' ;
UNDER : '_' ;
COLON : ':' ;
PRIME : '\'';

VAR_ID : (LOWERCASE | UPPERCASE | UNDER)(LOWERCASE | UPPERCASE | UNDER | DIGIT)* ;

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

mode_condition : MODE condition ;

invt : INVT COLON invt_list ;

invt_list : (condition)+ ;

flow : FLOW COLON flow_list ;

flow_list : (equation)+ ;

jump : JUMP COLON jump_condition ARROW (equation)+ AND (equation)+ ;

jump_condition : (LPAREN)? (condition)+ (RPAREN)? ;


init : INIT COLON (equation)+ AND (condition)+ ;

goal : GOAL COLON (condition)+ AND (condition)+ ;


var_type : (BOOL | INT | REAL) ;

var_range : (LBRCKT VALUE RBRCKT | LBRCKT VALUE COMMA VALUE RBRCKT) ;


condition : (LPAREN)? VAR_ID COMPARATOR expression (RPAREN)? ;

equation : (LPAREN)? (VAR_ID (PRIME)? | differential) OP_EQUAL expression (RPAREN)? ;


expression : expression_multi ((OP_PLUS | OP_MINUS) expression_multi)* ;

expression_multi : expression_power ((OP_MULTI | OP_DIVIDE | OP_MODULO) expression_power)* ;

expression_power : atom_sign (OP_POWER atom_sign)* ;

atom_sign : (OP_PLUS atom_sign | OP_MINUS atom_sign | atom_function | atom) ;

atom : (VALUE | VAR_ID) ;

atom_function : FUNCTION LPAREN expression (COMMA expression)* RPAREN ;


differential : DIFF LBRCKT VAR_ID RBRCKT OP_DIVIDE DIFF LBRCKT VAR_ID RBRCKT ;
