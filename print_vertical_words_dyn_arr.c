#include <stdio.h>
#include <stdlib.h>

struct string {
    int size;
    char *begin;
};

void array_init(struct string *arr) {
    arr->size = 0;
    arr->begin = NULL;
}

void str_copy(char *dest, const char *src) {
   while(*src) {
       *dest = *src;
       src++;
       dest++;
   }
   *dest = 0;
}

void resize_string(struct string *str, int new_size) {
    /*todo: check if it works*/
    if (new_size <= str->size) {
        *(str->begin + new_size) = 0;
        str->size = new_size;
        return;
    }
    char *new_str = malloc(sizeof(char) * new_size);
    if (str->size > 0) {
        str_copy(new_str, str->begin);
        free(str->begin);
    }
    str->begin = new_str;
    str->size = new_size;
}

void arr_copy(struct string *dest, int dest_size, 
            const struct string *src, int src_size) {
    int i;
    for (i = 0; i < src_size; i++) 
        *(dest + i) = *(src + i);
    for ( ; i < dest_size; i++)
        array_init(dest + i);
}

struct string *resize_array(struct string *arr, int size, int new_size) {
    struct string *new_arr = malloc(sizeof(struct string) * new_size);
    if (size > 0 && arr) {
        arr_copy(new_arr, new_size, arr, size);
        free(arr);
    }
    return new_arr;
}

char get(const struct string *str, int i) {
    return i < str->size ? *(str->begin + i) : ' ';
}

int max_length(const struct string *arr, int size) {
    int i;
    int max = arr->size;
    for (i = 0; i < size; i++) {
        if ((arr + i)->size > max)
            max = (arr + i)->size;
    }
    return max;
}

void print_vertical(struct string *arr, int size, int max_length) {
    int i, j;
    for (i = 0; i < max_length; i++) {
        for (j = 0; j < size; j++) {
            printf("%c", get(arr + j, i));
        }
        printf("\n");
    }
}

void delete_arr(struct string *arr, int size) {
    int i;
    for (i = 0; i < size; i++) {
        free((arr + i)->begin);
    }
    free(arr);
}

int main(int argc, char **argv) {
    int c, arr_size = 0;
    struct string str;
    struct string *arr;
    array_init(&str);
    arr = NULL;
    while((c = getchar()) != EOF) {
        switch (c) {
            case ' ':
            case '\t':
                {
                    if (str.size > 0) {
                        arr = resize_array(arr, arr_size, arr_size + 1);
                        arr_size++;
                        *(arr + arr_size - 1) = str;
                        array_init(&str);
                    }
                    break;
                }
            case '\n':
                {
                    if (str.size > 0) {
                        arr = resize_array(arr, arr_size, arr_size + 1);
                        arr_size++;
                        *(arr + arr_size - 1) = str;
                        array_init(&str);
                    }
                    print_vertical(arr, arr_size, max_length(arr, arr_size));
                    delete_arr(arr, arr_size);
                    arr_size = 0;
                    break;
                }
            default:
                {
                    resize_string(&str, str.size + 1);
                    *(str.begin + str.size - 1) = c;
                }
        }
    }
    return 0;
}
