#include <stdio.h>
#include <stdlib.h>

char *delete_spaces(char *str) {
    if (!(*(str + 1))) { /* check if str length = 1 */
        if (*str == ' ' || *str == '\t')
            *str = '\0';
        return str;
    }
    char *front = str, *back = str;
    while (*front) {
        if (*front != ' ' && *front != '\t') {
            if (front != back)
                *back = *front;
            back++;
        }
        front++;
    }
    *back = '\0';
    return str;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "At least one argument required\n");
        return 1;
    }
    printf("%s\n", delete_spaces(argv[1]));
    return 0;
}
