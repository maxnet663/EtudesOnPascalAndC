#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "At least one argument expected\n");
        return 1;
    }
    FILE *f = fopen(argv[1], "r");
    if (!f) {
        perror(argv[1]);
        return 2;
    }
    int lines_counter = 0, c;
    while((c = fgetc(f)) != EOF) 
        lines_counter += c == '\n';
    printf("%d\n", lines_counter);
    return 0;
}
