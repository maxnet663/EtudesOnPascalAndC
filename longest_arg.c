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

int max(int a, int b) {
    return a > b ? a : b;
}

int main(int argc, char **argv) {
    int max = -1;
    char **pp = argv;
    if (argc < 2) {
        fprintf(stderr, "Arguments required\n");
        return 1;
    }
    while(*pp) {
        max = (max, len(*pp));
        pp++;
    }
    pp = argv;
    while (*pp) {
        if (len(*pp) == max) 
            puts(*pp);
        pp++;
    }
    return 0;
}
