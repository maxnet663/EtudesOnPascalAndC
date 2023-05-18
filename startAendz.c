#include <stdio.h>
#include <stdlib.h>

int is_space_or_lf(char c) {
    return c == ' ' || c == '\t' || c == '\n';
}

int main(int argc, char **argv) {
    int c;
    int is_word = 0, is_starts_withA = 0, is_prev_z = 0;
    int az_words_counter = 0;
    while((c = getchar()) != EOF) {
        if(!is_space_or_lf(c)) {
            if (!is_word)
                is_starts_withA = c == 'A';
            is_word = 1;
            is_prev_z = is_word && c == 'z'; 
            continue;
        }
        if (is_space_or_lf(c)) {
            az_words_counter += is_starts_withA && is_prev_z;
            is_word = 0;
            is_starts_withA = is_prev_z = 0;
            if (c == '\n') {
                printf("A..z words: %d\n", az_words_counter);
                az_words_counter = 0;
            }
        }
    }
    return 0;
}
