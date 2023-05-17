#include <stdio.h>
#include <stdlib.h>

int extra_spaces(const char *str) {
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
    res = p = malloc(sizeof(char) * (length(str) - extra_spaces(str)));
    *p = *str++;
    while (*str) {
        if ((*str == ' ') && (*p == ' ')) {
            str++;
            continue;
        }
        *(++p) = *str++;
    }
    *(++p) = 0;
    return res;
}

void skip_space(const char *str) {
    char *res = spaces_skipper(str);
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
