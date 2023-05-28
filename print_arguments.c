#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc == 1) {
        fprintf(stderr, "At least one argument required\n");
        return 1;
    }
    int i;
    for (i = 1; *(argv + i); i++){
        if (**(argv + i) == '-')
            continue;
        printf("%s\n", argv[i]);
    }
    return 0;
}
