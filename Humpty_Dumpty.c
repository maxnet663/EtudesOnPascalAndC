#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "At leat one argument required\n");
        return 1;
    }
    FILE *f = fopen(argv[1], "w");
    if(!f) {
        perror(argv[1]);
        return 2;
    }
    char *text[4] = { 
        "Humpty Dumpty sat on a wall,", 
        "Humpty Dumpty had a great fall;",
        "All the king's horses and all the king's men",
        "Couldn't put Humpty together again."
    };
    for (int i = 0; i < 4; i++) {
        fputs(text[i], f);
        fputc('\n', f);
    }
    fclose(f);
    return 0;
}
