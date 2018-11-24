grammar wReach;

/*
 * Parser Rules
 */

wReach : mode_var_list system_var_list mode_list EOF ;

mode_var_list : (mode_var_decl)+ ;

mode_var_decl : var_type WHITESPACE mode_var_id (WHITESPACE var_range)? NEWLINE ;

mode_var_id : ID_UPPERCASE ;

system_var_list : (system_var_decl)+ ;

system_var_decl : system_var_id WHITESPACE var_range NEWLINE ;

system_var_id : ID_LOWERCASE ;

var_type : (BOOL | INT | REAL) ;

var_range : (LBRCKT var_value RBRCKT  | LBRCKT var_value COMMA WHITESPACE var_value RBRCKT) ;

var_value : (VAL_NUMBER | VAL_BOOL) ;

mode_list : (mode_decl)+ ;

mode_decl : LCURLY NEWLINE mode_condition invt RCURLY NEWLINE ;

mode_condition : MODE WHITESPACE mode_var_id WHITESPACE cmp WHITESPACE var_value NEWLINE ;

cmp : (CMP_GT | CMP_GTE | CMP_LT | CMP_LTE | CMP_EQ | CMP_NEQ) ;

invt : INVT COLON NEWLINE invt_list ;

invt_list : (invt_decl)+ ;

invt_decl : WHITESPACE system_var_id WHITESPACE cmp WHITESPACE var_value NEWLINE ;

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
WHITESPACE : (' ' | '\t')+ ;
NEWLINE : ('\r'? '\n' | '\r')+ ;

ID_LOWERCASE : (LOWERCASE | UNDER)(LOWERCASE | UNDER | DIGIT)* ;
ID_UPPERCASE : (UPPERCASE | UNDER)(UPPERCASE | UNDER | DIGIT)* ;
VAL_NUMBER : DIGIT+ (DOT DIGIT+)? ;
VAL_BOOL : (TRUE | FALSE) ;

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

BOOL : 'Bool' ;
INT : 'Int' ;
REAL : 'Real' ;

MODE : 'mode' ;
INVT : 'invt' ;
FLOW : 'flow' ;
JUMP : 'jump' ;
INIT : 'init' ;
GOAL : 'goal' ;
