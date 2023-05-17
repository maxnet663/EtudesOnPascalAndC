#include <stdio.h>

int get_and_zero(int *x) {
    int tmp = *x;
    *x = 0;
    return tmp;
}

int main() {
   int a = 33;
   printf("%d\n", get_and_zero(&a));
}
