comment  \$.*
digit  [0-9]
integer ([+-]?{digit}+)
float ([+-]?{digit}*(\.)?{digit}+)
upper_letter [A-Z]
lower_letter [a-z]
alphabetic ({lower_letter}|{upper_letter}|$|_)
alphanumeric ({digit}|{alphabetic})
string (\"([^\\\"]|\\.)*\")
new_line \n
var_name {alphabetic}+{alphanumeric}*

%%

{comment}       return COMMENT;
\+              return PLUS;
\-              return MINUS;
\*              return MULTIPLY;
\/              return DIVISION;
\{              return LEFT_BRACE;
\}              return RIGHT_BRACE;
\(              return LEFT_PARANT;
\)              return RIGHT_PARANT;
{new_line}      {
			extern int count;
			count++;
			return NEW_LINE;
		}
\%              return MOD;
\;              return SEMI_COLON;
\>              return GREATER;
\<              return SMALLER;
\<=             return SMALL_OR_EQ;
\=\=            return EQUALITY_CHECK;
\>=             return GREAT_OR_EQ;
\,              return COMMA;
\~              return NEGATION;
\&		return CONJUNCTION;
\|\|		return DISJUNCTION;
\-\>		return IMPLICATION;
\<\-\>	   	return DOUBLE_IMPLICATION;
\#              return EXCLUSIVE_OR;
\.              return DOT; 
\:		return COLON;
\=              return ASSIGN_OP;
\!\=            return NOT_EQUAL;
int             return TYPE_INT;
float           return TYPE_FLOAT;
string		return TYPE_STRING; 
if              return IF;
else            return ELSE;
for             return FOR;
while           return WHILE;
println		return PRINT_LINE;
print		return PRINT;
constant        return CONST;
import          return IMPORT;
return          return RETURN;
letsroll        return LETSROLL;
void            return VOID;
{var_name}      return VAR_NAME;
{integer}       return INTEGER;
{float}         return FLOAT;
{string}        return STRING;

%%

int yywrap()    { return 1; }
