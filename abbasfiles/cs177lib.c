#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#ifdef NULL
#undef NULL
#define NULL '\0'
#endif
/*  Author: Abbas Moghtanei  
    1) strsuffix would append the string t to the string s and 
       returns the result.
    2) strprefix would prepend the string t to the string s and 
       returns the result.
    3) strsub picks the substring from the location "loc" with the
       length of n and returns the substring.
    4) strltrim  removes white spaces from the left side of the string.
    5) strrtrim  removes white spaces from the right side of the string.
    6) strdel deletes the substring t from the string s.
    7) strrpt repeats the string s   n  times.
*/
/********************************strsuffix()*****************************/
char *strsuffix(char *s, char *t)
{
 
    static char buf[BUFSIZ];

    if (s == NULL || *s == NULL || t == NULL || *t == NULL) return(NULL);
    if ( (strlen(s) + strlen(t)) >= BUFSIZ )
    {
        fprintf(stderr, "string overflow\n");
        return(NULL);
    }
    bzero(buf, BUFSIZ);
    sprintf(buf, "%s%s", s, t);
    return(buf); 
}
/*******************************strdel()*********************************/ 
char *strdel(char *s, char *t)
{
   int i = 0;
   char *ptr;
   char *nptr;
   int size = strlen(s);
   char *temp = strdup(s);
   char *p = strdup(s);
   if( p != NULL && temp != NULL)
   {
      ptr = temp;

      if((nptr = strstr(temp,t)) != NULL)
      {
         while(*temp != NULL)
         {
            if(temp != nptr)
            {
               *(p + i) = *temp;
               temp++;
               i++;
            }
            else
               temp = temp + strlen(t);
         }
         *(p + i) = NULL;
         temp = ptr;
         *ptr = NULL;
      }
      free(temp);
   }
   else
   {
      *p = NULL;
   }
   return (p);
}  
/*****************************strprefix()*************************/
char *strprefix(char *s, char *t)
{
    static char buf[BUFSIZ];

    if (s == NULL || *s == NULL || t == NULL || *t == NULL) return(NULL);
    if ( (strlen(s) + strlen(t)) >= BUFSIZ )
    {
        fprintf(stderr, "string overflow\n");
        return(NULL);
    }
    bzero(buf, BUFSIZ);
    sprintf(buf, "%s%s", t, s);
    return(buf); 
}

/*******************************strrpt()*************************/
char *strrpt(char *s, int n)
{
 
    static char buf[BUFSIZ];
    int i;

    if (s == NULL || *s == NULL) return(NULL);
    if ( (strlen(s) * n) >= BUFSIZ )
    {
        fprintf(stderr, "string overflow\n");
        return(NULL);
    }
    if (n <= 0)
    {
        fprintf(stderr, "Invalid number\n");
        return(NULL);
    }
    bzero(buf, BUFSIZ);
    for(i = 0; i < n; i++) strcat(buf, s);
    return(buf);
}
/*****************************strsub()*************************/
char *strsub(char *s, int loc, int len)
{
 
    char *p = s;
    static char buf[BUFSIZ];
    int i = 0, d;

    if (s == NULL || *s == NULL) return(NULL);
    if ((d = strlen(s)) >= BUFSIZ)
    {
        fprintf(stderr, "string overflow\n");
        return(NULL);
    }
    if (loc < 0 || loc > d - 1)
    {
        fprintf(stderr, "Invalid location\n");
        return(NULL);
    }
    if (len < 0 )
    {
        fprintf(stderr, "Invalid length\n");
        return(NULL);
    }
    bzero(buf, BUFSIZ); 
    p += loc;

    for(i = 0; i < len && *p; i++) buf[i] = *p++;

    buf[i] = NULL;
    return(buf);
}
/*****************************strrtrim()*************************/

char *strrtrim(char *s)
{
 
    char *p = s;
    static char buf[BUFSIZ];
    int d;

    if (s == NULL || *s == NULL) return(NULL);
    if (( d = strlen(s) ) >= BUFSIZ)
    {
        fprintf(stderr, "string overflow\n");
        return(NULL);
    }
    bzero(buf, BUFSIZ);
    p = s + d - 1;
    while(isspace(*p)) p--;
    strncpy(buf, s, p - s + 1);
    buf[p - s + 1] = NULL;
    return(buf);
}
/*****************************strltrim()*************************/
char *strltrim(char *s)
{
 
    char *p = s;
    static char buf[BUFSIZ];

    if (s == NULL || *s == NULL) return(NULL);
    if ( strlen(s) >= BUFSIZ)
    {
        fprintf(stderr, "string overflow\n");
        return(NULL);
    }
    bzero(buf, BUFSIZ);
    while(isspace(*p)) p++;
    strcpy(buf, p);
    return(buf);
}

