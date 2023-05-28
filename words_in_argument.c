#include <stdio.h>
#include <stdlib.h>

int is_space_or_tabulation(char ch) {
    return ch == ' ' || ch == '\t';
}

int words_counter(const char *str) {
    int counter = 0;
    int is_word;
    while (*str) {
        if (is_space_or_tabulation(*str) && is_word) {
            counter++;
            is_word = 0;
        }
        if (!is_space_or_tabulation(*str) && !is_word) {
            is_word = 1;
        }
        str++;
    }
    counter += is_word;
    return counter;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "One arguments required\n");
        return 1;
    }
    printf("%d\n", words_counter(*(argv + 1)));
    return 0;
}
