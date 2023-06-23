#include <stdio.h>
#include <stdlib.h>

union split_int {
    int integer;
    unsigned char bytes[sizeof(int)];
};

int main(int argc, char **argv) {
    int i;
    union split_int si;
    scanf("%d", &si.integer);
    for (i = 0; i < sizeof(int); i++)
        printf("byte #%d is %02x\n", i, si.bytes[i]);
    return 0;
}
