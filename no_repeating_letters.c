#include <stdio.h>
#include <stdlib.h>

/*program prints its arguments which has no pereating letters*/

int has_repeating_letters(const char* str) {
    int i, j;
    for (i = 0; *(str + i); i++) {
        for (j = 1; *(str + i + j); j++) {
            if (*(str + i) == *(str + i + j))
                return 1;
        }
    }
    return 0;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Arguments required\n");
        return 1;
    }
    while(*(++argv)) {
        if (!has_repeating_letters(*argv))
            puts(*argv);
    }
    return 0;
}
