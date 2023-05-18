#include <stdio.h>
#include <stdlib.h>

int is_space(char c) {
    return c == ' ' || c == '\t';
}

int main(int argc, char **argv) {
    int c;
    int letters_counter = 0;
    int even_words = 0, odd_words = 0;
    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            even_words += !(letters_counter % 2) && letters_counter != 0;
            odd_words += letters_counter % 2;
            printf("Even words: %d; Odd words: %d\n", even_words, odd_words);
            letters_counter = 0;
            even_words = odd_words = 0;
            continue;
        }
        if (!is_space(c)) {
            letters_counter++;
            continue;
        }
        if (is_space(c)) {
            even_words += !(letters_counter % 2) && letters_counter != 0;
            odd_words += letters_counter % 2;
            letters_counter = 0;
            continue;
        }
    }
    return 0;
}
