#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "At leat one argument reqired\n");
        return 1;
    }
    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror(argv[1]);
        return 2;
    }
    int c;
    while((c = fgetc(f)) != EOF)
        fputc(c, stdout);
    fclose(f);
    return 0;
}
