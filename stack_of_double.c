#include <stdio.h>
#include <stdlib.h>

struct stackdbl {
    int capacity;
    int size;
    double *head;
};

void stackdbl_init(struct stackdbl *sod) {
    sod->capacity = 0;
    sod->size = 0;
    sod->head = NULL;
}

void stackdbl_destroy(struct stackdbl *sod) {
    if (sod->head)
        free(sod->head);
    sod->capacity = 0;
    sod->size = 0;
}

void arr_copy(double *dest, double *src, int size) {
   int i;
   for (i = 0; i < size; i++)
       dest[i] = src[i];
}

void resize_stack(struct stackdbl *sod) {
    if (!sod->capacity)
        sod->capacity = 2;
    else
        sod->capacity *= 2;
    double *new_arr = malloc(sod->capacity * sizeof(double));
    if (sod->head) {
        arr_copy(new_arr, sod->head, sod->size);
        free(sod->head);
    }
    sod->head = new_arr;
}

void shift_stack_right(double *arr, int size) {
    int i;
    for (i = size - 1; i > 0; i--)
        arr[i] = arr[i - 1];
}

void stackdbl_push(struct stackdbl *sod, double d) {
    sod->size++;
    if (sod->size > sod->capacity)
        resize_stack(sod);
    shift_stack_right(sod->head, sod->size);
    sod->head[0] = d;
}

void shift_stack_left(double *arr, int size) {
    int i;
    for (i = 0; i < size - 1; i++)
        arr[i] = arr[i + 1];
}

double stackdbl_pop(struct stackdbl *sod) {
    double d;
    if (sod->head)
        d = sod->head[0];
    else 
        d = 0;
    shift_stack_left(sod->head, sod->size);
    sod->size--;
    return d;
}

int stackdbl_empty(struct stackdbl *sod) {
    return !sod->size;
}

int main(int argc, char **argv) {
    struct stackdbl sod;
    stackdbl_init(&sod);
    for (int i = 0; i < 10; i++) {
        stackdbl_push(&sod, i);
    }
    while(!stackdbl_empty(&sod))
        printf("%lf ", stackdbl_pop(&sod));
    printf("\n");
    stackdbl_destroy(&sod);
    return 0;
}
