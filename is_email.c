#include <stdio.h>
#include <stdlib.h>

int has_at_sign(const char *str) {
    int counter = 0;
    while(*str) {
        if (*str == '@')
            counter++;
        str++;
    }
    return counter;
}

int has_dot_sign(const char *str) {
    int counter = 0;
    while(*str) {
        if (*str == '.') 
            counter++;
        str++;
    }
    return counter;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Arguments reqired\n");
        return 1;
    }
    while(*(++argv)){
        if (has_at_sign(*argv) == 1 && has_dot_sign(*argv) >= 1)
            puts(*argv);
    }
    return 0;
}
