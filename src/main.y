/* Nome: Mariane Tiemi Iguti RA: 147279 
    EA876 - Laboratório 3 - PythonListParser */

%{

#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);

%}

%token PALAVRA NUMERO ABRECHAVE FECHACHAVE VIRGULA ESPACO EOL 

%%

PROGRAMA: 
        PROGRAMA LISTA EOL { printf("OK\n");}
        |
        ;
         
ELEMENTO: // pode ser vazio
        | PALAVRA
        | NUMERO
        | ELEMENTO VIRGULA ESPACO ELEMENTO
        | LISTA
        ;
            
LISTA:
    ABRECHAVE ELEMENTO FECHACHAVE
    | LISTA ABRECHAVE ELEMENTO FECHACHAVE
    ;                                              

%%

void yyerror(char *s) 
{
    printf("ERRO\n");
}

int main() 
{
    yyparse();
    return 0;
}
