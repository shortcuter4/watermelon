%option main
comment  \/\/.*
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

{comment}       printf(" COMMENT ");
\+                     printf("PLUS ");
\-                      printf("MINUS ");
\*                      printf("MULTIPLY ");
\/                      printf("DIVISION ");
\{                      printf("LEFT_BRACE ");
\}                      printf("RIGHT_BRACE ");
\(                      printf("LEFT_PARANT ");
\)                      printf("RIGHT_PARANT ");
{new_line}        printf("NEW_LINE ");
\%                    printf("MOD ");
\;                      printf("SEMI_COLON ");
\>                     printf("GREATER ");
\<                     printf("SMALLER ");
\<=                   printf("SMALL_OR_EQ ");
\=\=                  printf("EQUALITY_CHECK ");
\>=                   printf("GREAT_OR_EQ ");
\,                      printf("COMMA ");
\~                     printf("NEGATION ");
\&           printf("CONJUNCTION ");
\|\|           printf("DISJUNCTION ");
\-\>           printf("IMPLICATION  ");
\<\-\>              printf("DOUBLE_IMPLICATION  ");
\#                     printf("EXCLUSIVE_OR ");
\.                      printf("DOT "); 
\:          printf("COLON ");
\=                     printf("ASSIGN_OP ");
\!\=                   printf("NOT EQUAL ");
int                    printf("TYPE_INT ");
float                 printf("TYPE_FLOAT ");
string          printf("TYPE_STRING "); 
if                      printf("IF ");
else                 printf("ELSE ");
for                   printf("FOR ");
while                printf("WHILE ");
println          printf("PRINT_LINE ");
print          printf("PRINT ");
return              printf("RETURN ");
letsroll             printf("LETSROLL ");
void                 printf("VOID ");
{var_name}     printf("VAR_NAME ");
{integer}          printf("INTEGER ");
{float}              printf("FLOAT ");
{string}            printf("STRING");

%%

