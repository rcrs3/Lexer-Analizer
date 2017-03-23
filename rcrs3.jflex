%%

%line
%column

%cup

%unicode

%standalone

%class rcrs3

%{
int qtdId = 0;
%}

%eof{
System.out.println("Quantidade de identificadores encontrados: " + qtdId);
%eof}

//patterns
letter = [A-Za-z]
digit = [0-9]
integer = {[1-9]}({digit})*
alphanumeric = {letter} | {digit}
identifier = {{letter} | _}({alphanumeric})*
whitespace = [ \n\t\r\f]
comment = ("//"(alphanumeric | whitespace)*"\n") | ("/*"(alphanumeric | whitespace)*"*\")


//Lexer Rules
or				{ System.out.println("Token OR"); }
"*"             { System.out.println("Token *"); }
"+"             { System.out.println("Token +"); }
"-"             { System.out.println("Token -"); }
"/"             { System.out.println("Token /"); }
"("             { System.out.println("Token ("); }
")"             { System.out.println("Token )"); }
"{"             { System.out.println("Token {"); }
"}"             { System.out.println("Token }"); }
"["             { System.out.println("Token ["); }
"]"             { System.out.println("Token ]"); }
{identifier}    { qtdeID++; System.out.println("Token ID ("+yytext()+")"); }
{integer}       { System.out.println("Token INT ("+yytext()+")"); }
{whitespace | comment}    { /* Ignore whitespace. */ }
.               { System.out.println("Illegal char " + yytext() +
                    " line: " + yyline + ", column: " + yycolumn); }
