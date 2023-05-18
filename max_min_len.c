#include <stdio.h>
#include <stdlib.h>

int is_space_or_lf(char c) {
    return c == ' ' || c == '\t' || c == '\n';
}

int max(const int *a, const int *b) {
    return *a > *b ? *a : *b;
}

int min(const int *a, const int *b) {
    return *a > *b ? *b : *a;
}

int main(int argc, char **argv) {
    int c;
    int min_len = 81, max_len = 0;
    int words_counter = 0, letters_counter = 0;
    while ((c = getchar()) != EOF) {
        if (is_space_or_lf(c)) {
            words_counter += (letters_counter != 0);
            max_len = max(&letters_counter, &max_len);
            min_len = min(&letters_counter, &min_len);
            letters_counter = 0;
            if (c == '\n') {
                printf("Words: %d; Max length: %d; Min length: %d\n", words_counter, max_len, min_len);
                words_counter = 0;
                max_len = min_len = 0;
                continue;
            }
        }
        if (!is_space_or_lf(c)) 
            letters_counter++;
    }
    return 0;
}
