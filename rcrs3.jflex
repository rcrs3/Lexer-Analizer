%%

/* 
A linha atual pode ser acessada por yyline 
e a coluna atual com yycolumn. 
*/ 
%line
%column

/* Se quisermos 'interfacear' com um parser gerado pelo sistema CUP
%cup
*/ 

//encoding
%unicode

// faz com que a classe tenha uma função main e torna possivel que a classe gerada seja usada como reconhecedor
%standalone

//nomeia a classe
%class rcrs3

/* 
Declarações

código dentro de %{ e %}, é copiado para a classe gerada. 
a ideia é utilizar este recurso para declarar atributos e métodos usados nas ações 
*/ 
%{
int qtdeID=0;
%}


%eof{
System.out.println("Quantidade de Identificadores encontrados: "+qtdeID);
%eof}

//patterns
letter = [A-Za-z]
digit = [0-9]
integer = [1-9]({digit})*
alphanumeric = {letter} | {digit} | _
identifier = ({alphanumeric})*
whitespace = [ \n\t\r\f]
comment = ( [//]({alphanumeric} | {whitespace})*[\n]) | ([/*]({alphanumeric} | {whitespace})*[*/ ] )

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
