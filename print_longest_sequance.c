#include <stdio.h>
#include <stdlib.h>

void str_copy(char *dest, char *src) {
    while(*src) {
        *dest = *src;
        dest++;
        src++;
    }
    *dest = 0;
}

char *str_resize(char *str, int new_size) {
    char *new_str = malloc(new_size);
    if (str) {
        str_copy(new_str, str);
        free(str);
    }
    return new_str;
}

int is_digit(char ch) {
    return ch >= '0' && ch <= '9';
}

int max(int a, int b) {
    return a > b ? a : b;
}

int get_len_seq(char *cur_p) {
    int counter = 0;
    while (is_digit(*cur_p)) {
        counter++;
        cur_p++;
    }
    return counter;
}

int find_digit(char *str, int start_pos) {
    int pos = start_pos;
    str += start_pos;
    while (*str && !is_digit(*str)) {
        str++;
        pos++;
    }
    return *str ? pos : -1;
}
 
int get_max_length_seq(char *str) {
    int max_len = 0;
    int pos = 0;
    while ((pos = find_digit(str, pos)) != -1) {
        max_len = max(max_len, get_len_seq(str + pos));
        pos += get_len_seq(str + pos);
    }
    return max_len;
}

void print_seq(char *cur_p) {
    while(*cur_p && is_digit(*cur_p)) {
        printf("%c", *cur_p);
        cur_p++;
    }
    printf(" ");
}

void print_longest_seq(char *str) {
    int max_len = get_max_length_seq(str);
    int pos = 0;
    while((pos = find_digit(str, pos)) != -1) {
        if(get_len_seq(str + pos) == max_len) 
            print_seq(str + pos);
        pos += get_len_seq(str + pos);
    }
    printf("\n");
}

int main(int argc, char **argv) {
    int c;
    char *str = NULL;
    int size = 0;
    while((c = getchar()) != EOF) {
        if (c == '\n') {
            if (str) {
                print_longest_seq(str);
                free(str);
                str = NULL;
                size = 0;
            }
            continue;
        }
        str = str_resize(str, ++size);
        str[size - 1] = c;
    }
    return 0;
}
