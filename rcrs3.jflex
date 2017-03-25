%%

 
%line
%column

//%cup

//encoding
%unicode

%standalone

//Class name
%class rcrs3

 
%{
int qtdeID=0;
%}


%eof{
System.out.println("Quantidade de Identificadores encontrados: "+qtdeID);
%eof}

//patterns
letter = [A-Za-z]
digit = [0-9]
integer = [0] | ([1-9]({digit})*)
alphanumeric = {letter} | {digit} | _
identifier = (_ | {letter})({alphanumeric})*
lineterminator = [\r\n]
whitespace = [ \t\f] | {lineterminator}
comment = ("//"([^\r\n])*{lineterminator}) | ("/*"[^*] ~"*/" | "/*" "*"+ "/")

%%
//Lexer Rules
boolean			{ System.out.println("Token boolean"); }
class			{ System.out.println("Token class"); }
public			{ System.out.println("Token public"); }
extends			{ System.out.println("Token extends"); }
static			{ System.out.println("Token static"); }
void			{ System.out.println("Token void"); }
main			{ System.out.println("Token main"); }
String			{ System.out.println("Token String"); }
int			    { System.out.println("Token int"); }
while			{ System.out.println("Token while"); }
if				{ System.out.println("Token if"); }
else			{ System.out.println("Token else"); }
return			{ System.out.println("Token return"); }
length			{ System.out.println("Token length"); }
true			{ System.out.println("Token true"); }
false			{ System.out.println("Token false"); }
this			{ System.out.println("Token this"); }
new				{ System.out.println("Token new"); }
System.out.println { System.out.println("Token System.out.println"); }
"&&"			{ System.out.println("Token &&"); }
"<"				{ System.out.println("Token <"); }
"=="			{ System.out.println("Token =="); }
"!="			{ System.out.println("Token !="); }
"*"             { System.out.println("Token *"); }
"+"             { System.out.println("Token +"); }
"-"             { System.out.println("Token -"); }
";"				{ System.out.println("Token ;"); }
":"				{ System.out.println("Token :"); }
"."				{ System.out.println("Token ."); }
","				{ System.out.println("Token ,"); }
"="				{ System.out.println("Token ="); }
"!"             { System.out.println("Token !"); }
"("             { System.out.println("Token ("); }
")"             { System.out.println("Token )"); }
"{"             { System.out.println("Token {"); }
"}"             { System.out.println("Token }"); }
"["             { System.out.println("Token ["); }
"]"             { System.out.println("Token ]"); }
{identifier}    { qtdeID++; System.out.println("Token ID ("+yytext()+")"); }
{integer}       { System.out.println("Token INT ("+yytext()+")"); }
{whitespace}    { /* Ignore whitespace. */ }
{comment}		{ /* Ignore whitespace */ }
.               { System.out.println("Illegal char " + yytext() +
                    " line: " + yyline + ", column: " + yycolumn); }
