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

char *resize(char *str, int new_size) {
    char *new_str = malloc(sizeof(char) * new_size + 1);
    if (str) {
        str_copy(new_str, str);
        free(str);
    }
    return new_str;
}

char *delete_str(char *str) {
    free(str);
    return NULL;
}

int rfind(const char *str, char ch, int start_pos) {
    int i;
    for (i = start_pos; i >= 0; i--) {
        if ((ch == ' ' || ch == '\t') && (str[i] == ' ' || str[i] == '\t'))
            return i;
        if (str[i] == ch)
            return i;
    }
    return -1;
}

int is_space(char ch) {
    return ch == ' ' || ch == '\t'  || ch == '\n';
}

int rfind_letter(const char *str, int start_pos) {
    if (start_pos < 0)
        return -1;
    int i;
    for (i = start_pos; i >= 0; i--) {
        if (!is_space(str[i]))
            return i;
    }
    return -1;
}

void print_substr(const char *str, int start_pos, int end_pos) {
    int i;
    for (i = start_pos + 1; i <= end_pos; i++) {
        printf("%c", str[i]);
    }
    printf(" ");
}

void print_reverse(const char *str, int size) {
    /*find first letter from end of str*/
    int right = rfind_letter(str, size - 1); 
    /*find first sapce from pos of first from end letter*/
    int left = rfind(str, ' ', right);
    while (right != -1) {
        print_substr(str, left, right);
        right = rfind_letter(str, left);
        left = rfind(str, ' ', right);
    }
    printf("\n"); 
}

int main(int argc, char **argv) {
    int c, size = 0;
    char *str = NULL;
    while((c = getchar()) != EOF) {
        if (c == '\n') {
            print_reverse(str, size);
            str = delete_str(str);
            size = 0;
            continue;
        }
        str = resize(str, ++size);
        str[size-1] = c;
    }
    if (str)
        delete_str(str);
    return 0;
}
