#include <stdio.h>
#include <stdlib.h>

int is_space_or_lf(char c) {
    return c == ' ' || c == '\t' || c == '\n';
}

int main(int argc, char **argv) {
    int c;
    int letters_counter = 0;
    int seven_words = 0, two_words = 0; /* len > 7, len <= 2 */
    while ((c = getchar()) != EOF) {
        if (!is_space_or_lf(c)) {
            letters_counter++;
            continue;
        }
        if (is_space_or_lf(c)) {
            if (letters_counter > 7)
                seven_words++;
            if (letters_counter > 0 && letters_counter <= 2)
                two_words++;
            letters_counter = 0;
            if (c == '\n') {
                printf("Words with length <= 2: %d; Words with length > 7: %d\n", 
                    two_words, seven_words);
                two_words = seven_words = 0;
            }
        }
    }
    return 0;
}
