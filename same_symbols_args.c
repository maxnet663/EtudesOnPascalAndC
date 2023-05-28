#include <stdio.h>
#include <stdlib.h>

int consists_one_sym(const char *str) {
    if (!(*(str + 1)))
        return 1;
    int ch = *str;
    while (*str) {
        if (*str != ch)
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
        if (consists_one_sym(*argv))
            puts(*argv);
    }
    return 0;
}
