#include <stdio.h>
#include <stdlib.h>

int len(const char *str) {
    int counter = 0;
    while(*str) {
        counter++;
        str++;
    }
    return counter;
}

int compare(const char *str, const char *substr) {
    if (!(*substr))
        return 1;
    return *str == *substr && compare(str + 1, substr + 1);
}

const char *find_substr(const char *str, const char *substr) {
    int s_len = len(str);
    int substr_len = len(substr);
    if (s_len < substr_len)
        return NULL;
    int i;
    for (i = 0; *(str + i) && i <= s_len - substr_len; i++) {
       if (compare(str + i, substr))
           return str + i;
    }
    return NULL;
}

int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "Two arguments required\n");
        return 1;
    }
    int i;
    for (i = 2; i < argc; i++) {
        int counter = 0;
        const char *p = find_substr(argv[i], argv[1]);
        while(p) {
            counter++;
            p = find_substr(p + 1, argv[1]);
        }
        if (counter) {
            printf("%s meets in %s: %d times\n", argv[1], argv[i], counter);
        }
    }
    return 0;
}
