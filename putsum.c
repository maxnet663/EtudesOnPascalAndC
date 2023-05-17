#include <stdio.h>
#include <stdlib.h>

int put_sum(int *x, int *y, int *z) {
    *x = *y = *z = *x + *y + *z;
    return *x;
}

int main(int argc, char** argv) {
    int a, b, c;
    if (argc < 4) {
        fprintf(stderr, "%s\n", "Three arguments expected");
        return 1;
    }
    a = atoi(argv[1]);
    b = atoi(argv[2]);
    c = atoi(argv[3]);
    if (!(a && b && c)) {
        fprintf(stderr, "%s\n", "Wrong input");
        return 2;
    }
    printf("a = %d, b = %d, c = %d, sum = %d\n", a, b, c, put_sum(&a, &b, &c));
    return 0;
}
