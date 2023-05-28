#include <stdio.h>
#include <stdlib.h>

void swap(int *x, int *y) {
    int tmp = *x;
    *x = *y;
    *y = tmp;
}

int count_digits(long long x) { /* return amount of digits in number x */
    int counter = 0;
    while (x != 0) {
        counter++;
        x /= 10;
    }
    return counter;
}

long long power(int x, int y) {
    long long res = 1;
    while(y--) { 
        res *= x;
    }
    return res;
}

/*return count last digits of number x */
int get_last_digits(long long x, int count) { 
    int res = 0, c = 0;
    while (c != count) {
       res += x % 10 * power(10, c);
       c++;
       x /= 10;
    }
    return res;
}

/* discard count last digits*/
int discard_digits(long long *x, int count) {
    while (count--) {
        *x /= 10;
    }
    return *x;
}

int main(int argc, char **argv) {
    if (argc < 3) {
        fprintf(stderr, "At least two arguments required\n");
        return 1;
    }
    int begin = atoi(argv[1]);
    int end = atoi(argv[2]);
    if (begin > end)
        swap(&begin, &end);
    /*s - is a sequance Si(k=1,2,..) where S(i) = k^2 */
    char s[end - begin];
    int i = 1, ch_counter = 0;
    long long cur_num = 0;
    while(ch_counter < begin) {
        cur_num = power(i, 2);
        ch_counter += count_digits(cur_num);
        i++;
    }
    /*in case ch_counter >= begin must to put in s ch_counter - begin + 1 chs*/
    /*sprintf returns amount of wrote symbols*/
    /*s points on begin of s, p points on last written symbol + 1*/
    char *p = s + sprintf(s, "%d", get_last_digits(cur_num, ch_counter - begin + 1)); 
    while(ch_counter < end) {
        cur_num = power(i, 2);
        ch_counter += count_digits(cur_num);
        if (ch_counter > end) {
           discard_digits(&cur_num, ch_counter - end); 
        }
        p += sprintf(p, "%lld", cur_num);
        i++;
    }
    printf("%s\n", s);
    return 0;
}
