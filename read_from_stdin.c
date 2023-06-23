#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "At leat one argument expected\n");
        return 1;
    }
    FILE *f = fopen(argv[1], "w");
    if (!f) {
        perror(argv[1]);
        return 2;
    }
    int c;
    while((c = getchar()) != EOF)
        fputc(c, f);
    return 0;
}
