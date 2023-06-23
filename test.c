#include <stdio.h>
#include <stdlib.h>

char *delete_spaces(char *str) {
   char *back = str, *front = str;
   while (*front) {
       if (*front != ' ') {
           *back++ = *front;
       }
       front++;
   }
   *back = 0;
   return str;
}

char *delete_extra_spaces(char *str) {
    char *back = str, *front = str;
    while (*front) {
        if (*front != ' ' || *(front - 1) != ' ') {
            *back++ = *front;
        }
        front++;
    }
    *back = 0;
    return str;
}

int main(int argc, char **argv) {
    printf("%s\n", delete_extra_spaces(argv[1]));
    return 0;
}
