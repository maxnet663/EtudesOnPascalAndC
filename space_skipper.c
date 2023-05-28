#include <stdio.h>
#include <stdlib.h>

int extra_spaces(const char *str) { /*return amount of extra spaces*/
    int prev_space = 0;
    int counter = 0;
    while (*str) {
        if ((*str == ' ') && prev_space)
            counter++;
        else
        if (*str == ' ') 
            prev_space = 1;
        else  
        if (*str != ' ')
            prev_space = 0;
        str++;
    }
    return counter;
}

int length(const char *str) {
    int len = 0;
    while (*str) {
        len++;
        str++;
    }
    return len;
}

char* spaces_skipper(const char *str) {
    if (!(*str))
        return NULL;
    char *res, *p;
    /*take the memory from the heap for new line and +1 for /0 */
    res = p = malloc(sizeof(char) * (length(str) - extra_spaces(str)) + 1);
    *p = *str++;
    /*push chars to new str without extra spaces*/
    while (*str) {
        if ((*str == ' ') && (*p == ' ')) {
            str++;
            continue;
        }
        *(++p) = *str++;
    }
    *(++p) = '\0';
    return res;
}

void skip_space(const char *str) {
    char *res = spaces_skipper(str); /*get the same line without extra spaces*/
    if (!res) {
        fprintf(stderr, "%s\n", "Got NULL");
        return;
    }
    printf("%s\n", res);
    free(res);
}

int main(int argc, char** argv) {
    if (argc < 2) {
        fprintf(stderr, "%s\n", "Argument expected");
        return 1;
    }
    skip_space(argv[1]);
    return 0;
}
