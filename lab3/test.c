#include<stdio.h>
 main ()
{
char * s[ ] = {"ice", "green", "water", "hi"}; 
char ** ptr[ ] = {s + 3, s + 2, s + 1, s} ;
char *** p = ptr;
printf("in, % s", ** ++p);
}