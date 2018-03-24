/* Nome: Mariane Tiemi Iguti RA: 147279 
    EA876 - Laboratório 3 - PythonListParser */
%{

#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"

%}

%%

["]*[a-zA-Z]+["]* { return PALAVRA; } // token de palavra

[0-9]+ { yylval = atoi(yytext);
         return NUMERO; } // token de numero            

\[ { return ABRECHAVE; } // token [
    
\] { return FECHACHAVE; } // token ]            

\, { return VIRGULA; } // token ,

[ ] { return ESPACO; } // token de espaço
    
\n { return EOL; }  // token de fim de linha

%%

int yywrap() 
{  
  return 1;
}
