#include <stdio.h>
#include <stdlib.h>

int is_digit(char ch) {
    return ch >= '0' && ch <= '9';
}

int has_only_digit(const char *str) {
    while(*str) {
        if(!is_digit(*str))
            return 0;
        str++;
    }
    return 1;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Arguments required\n");
        return 1;
    }
    while(*(++argv)) {
        if (has_only_digit(*argv)) 
            puts(*argv);
    }
    return 0;
}
