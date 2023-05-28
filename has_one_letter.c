#include <stdio.h>
#include <stdlib.h>

int is_letter(char ch) {
    return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');
}

int has_one_digit(const char *str) {
    while(*str) {
        if (is_letter(*str))
            return 1;
        str++;
    }
    return 0;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Arguments reqired\n");
        return 1;
    }
    while(*(++argv)) {
        if (has_one_digit(*argv))
            puts(*argv);
    }
    return 0;
}
