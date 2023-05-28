#include <stdio.h>
#include <stdlib.h>

int does_contain(const char *str, char ch) {
    while(*str) {
        if (*str == ch)
            return 1;
        str++;
    }
    return 0;
}

int has_common_symbol(const char *origin, const char *str) {
    while(*str) {
        if (does_contain(origin, *str))
            return 1;
        str++;
    }
    return 0;
}

int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "At least three arguments required\n");
        return 1;
    }
    char **CurArg = argv + 2;
    while (*CurArg) {
        if (has_common_symbol(*(argv + 1), *CurArg))
            puts(*CurArg);
        CurArg++;
    }
    return 0;
}
