#include <stdio.h>
#include <stdlib.h>

int max(int a, int b) {
    return a > b ? a : b;
}

int swap(int a, int b) {
    int temp = a;
    a = b;
    b = a;
    return temp;
}

int main(int argc, char **argv) {
    int c;
    int prev_open_breckets = 0;
    int counter= 0;
    while ((c = getchar()) != EOF) {
        if (c == '\n') {
            printf("%d\n", counter);
            continue;
        }
        if (c == '(') {
            prev_open_breckets = 1;
            continue;    
        }
        if (c == ')') {
            counter += prev_open_breckets;
            prev_open_breckets = 0;
            continue;
        }
        prev_open_breckets = 0;
    }
    return 0;
}
