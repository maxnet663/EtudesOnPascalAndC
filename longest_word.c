#include <stdio.h>
#include <stdlib.h>

int is_space(char c) {
    return c == ' ' || c == '\t';
}

int max(const int *a, const int *b) {
    return *a > *b ? *a : *b;
}

int main(int argc, char **argv) {
    char c;
    int max_letters = 0, max_spaces = 0;
    int letters_counter = 0, spaces_counter = 0;
    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            max_spaces = max(&max_spaces, &spaces_counter);
            max_letters = max(&max_letters, &letters_counter);
            printf("The longest word: %d; The longest space: %d\n", max_letters, max_spaces);
            max_letters = max_spaces = 0;
            letters_counter = spaces_counter = 0;
            continue;
        }
        if (!is_space(c)) {
            letters_counter++;
            if (spaces_counter) {
                max_spaces = max(&max_spaces, &spaces_counter);
                spaces_counter = 0;
            }
            continue;
        }
        if (is_space(c)) {
            spaces_counter += (c == '\t') * 8 + (c != '\t');
            if (letters_counter) {
                max_letters = max(&max_letters, &letters_counter);
                letters_counter = 0;
            }
            continue;
        }
    }
    return 0;
}
