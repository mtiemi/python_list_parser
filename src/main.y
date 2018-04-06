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
            
LISTA: // lista pode ter outra lista dentro
    ABRECHAVE ELEMENTO FECHACHAVE
    | LISTA ABRECHAVE ELEMENTO FECHACHAVE
    ;                                              

%%

void yyerror(char *s) 
{
    printf("ERRO\n"); // em caso de lista invalida, print ERRO
}

int main() 
{
    yyparse();
    return 0;
}
