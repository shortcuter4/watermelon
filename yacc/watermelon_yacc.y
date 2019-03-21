%token  IF
	WHILE
	FOR
	MOD
	SEMI_COLON
	NEW_LINE
	GREATER
	SMALLER
	SMALL_OR_EQ
	EQUALITY_CHECK
	COMMA
	GREAT_OR_EQ
	NEGATION
	CONJUNCTION
	DISJUNCTION
	IMPLICATION
	DOUBLE_IMPLICATION
	EXCLUSIVE_OR
	DOT
	COLON
	ASSIGN_OP
	NOT_EQUAL
	TYPE_INT
	TYPE_FLOAT
	TYPE_STRING
	PRINT_LINE
	PRINT
	CONST
	IMPORT
	RETURN
	LETSROLL
	VOID
	VAR_NAME
	INTEGER
	FLOAT
	STRING
	COMMENT
	PLUS
	MINUS
	MULTIPLY
	DIVISION
	LEFT_BRACE
	RIGHT_BRACE
	LEFT_PARANT
	RIGHT_PARANT

%nonassoc REDUCE
%nonassoc ELSE

%%
start: main_program {
			printf("Input is correct");
			return 0;
			}

main_program: LETSROLL LEFT_PARANT RIGHT_PARANT LEFT_BRACE new_line program RIGHT_BRACE

program: statements | statement statements

statements: statement new_line
	  | statement new_line statements

statement: while
	 | for 
	 | if
         | single_state    
         | function_type 

new_line:  NEW_LINE | comment | NEW_LINE new_line

while: WHILE LEFT_PARANT expression RIGHT_PARANT LEFT_BRACE NEW_LINE statements RIGHT_BRACE

for: FOR LEFT_PARANT declaration_state COLON expression COLON assign_state RIGHT_PARANT LEFT_BRACE NEW_LINE statements RIGHT_BRACE

if: IF LEFT_PARANT expression RIGHT_PARANT LEFT_BRACE NEW_LINE statements RIGHT_BRACE %prec REDUCE
  | IF LEFT_PARANT expression RIGHT_PARANT LEFT_BRACE NEW_LINE statements RIGHT_BRACE ELSE LEFT_BRACE NEW_LINE statements RIGHT_BRACE


single_state: assign_state
	| declaration_state
	| function_state	
	| input_state
	| output_state
	| return_state

assign_state: var_name ASSIGN_OP expression | var_name ASSIGN_OP function_state

declaration_state: var_type assign_state
		 | var_type var_names
		 | CONST var_type assign_state

function_state: var_name LEFT_PARANT RIGHT_PARANT 
	      | var_name LEFT_PARANT arguments RIGHT_PARANT

input_state: IMPORT expression

output_state: print
	    | println

return_state: RETURN expression

expression: term low_op expression
	  | term
	  | term comp_op expression
  	  | term prop_op_med expression
	  | term prop_op_low expression

term: var_name high_op term
    | prop_op_high var_name
    | integer high_op term
    | float high_op term
    | var_name
    | integer
    | float
    | string

low_op: PLUS 
      | MINUS

high_op: MULTIPLY 
       | DIVISION 
       | EXCLUSIVE_OR

prop_op_high: NEGATION

prop_op_med: DISJUNCTION 
           | CONJUNCTION

prop_op_low: IMPLICATION 
           | DOUBLE_IMPLICATION

comp_op: ASSIGN_OP 
       | SMALLER 
       | GREATER 
       | EQUALITY_CHECK 
       | GREAT_OR_EQ 
       | SMALL_OR_EQ 
       | NOT_EQUAL

function_type: non_void_function
	     | void_function

non_void_function: var_type var_name LEFT_PARANT RIGHT_PARANT LEFT_BRACE NEW_LINE statements RIGHT_BRACE 
		 | var_type var_name LEFT_PARANT parameters RIGHT_PARANT LEFT_BRACE NEW_LINE statements RIGHT_BRACE

void_function: VOID var_name LEFT_PARANT RIGHT_PARANT LEFT_BRACE NEW_LINE statements RIGHT_BRACE
	     | VOID var_name LEFT_PARANT parameters RIGHT_PARANT LEFT_BRACE NEW_LINE statements RIGHT_BRACE

parameters: var_type var_name 
	  | var_type var_name COMMA parameters

arguments: argument 
| argument COMMA arguments

argument: integer 
	| float 
	| string 
	| var_name


var_name: VAR_NAME

var_names: var_name
	 | var_name COMMA var_names

var_type: TYPE_INT 
	| TYPE_STRING
	| TYPE_FLOAT

comment: COMMENT new_line

string: STRING

integer: INTEGER

float: FLOAT

print: PRINT LEFT_PARANT expression RIGHT_PARANT

println: PRINT_LINE LEFT_PARANT expression RIGHT_PARANT

%%
#include "lex.yy.c"

int count;

int main()
{
   return yyparse();
}

yyerror(char *s)
{
   printf("%s, Error in line: %d\n", s, count + 1);
}
