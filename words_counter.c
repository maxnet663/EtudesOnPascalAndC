#include <stdio.h>
#include <stdlib.h>

int is_space(char c) {
    return c == ' ' || c == '\t';
}

int main(int argc, char **argv) {
    int c;
    int is_word = 0, counter = 0;
    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            counter += is_word;
            printf("Words: %d\n", counter);
            counter = is_word = 0;
            continue;
        }
        if (!is_space(c)) {
            is_word = 1;
            continue;
        }
        if (is_space(c)) {
            counter += is_word;
            is_word = 0;
            continue;
        }
    }
    return 0;
}
