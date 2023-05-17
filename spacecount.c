#include <stdio.h>
#include <stdlib.h>

/*
int spaces_counter(const char* str) {
    int counter = 0;
    while (*str) {
        if (*str == ' ')
            counter++;
        str++;
    }
    return counter;
}
*/

int spaces_counter(const char *str) {
    if (!(*str))
        return 0;
    return (*str == ' ') + spaces_counter(++str);
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "%s\n", "One argument expected");
        return 1;
    }
    printf("%d\n", spaces_counter(argv[1]));
    return 0;
}
