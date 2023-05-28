#include <stdio.h>
#include <stdlib.h>

struct item {
    int data;
    struct item *next;
};

struct item *make_list_of_int(int *arr, int len) {
    if (!len)
        return NULL;
    struct item *tmp = malloc(sizeof(struct item));
    tmp->data = *arr;
    tmp->next = make_list_of_int(arr + 1, len - 1);
    return tmp;
}

int size_of_list(struct item *first) {
    return first == NULL ? 0 : 1 + size_of_list(first->next);
}

int loi_get(struct item **first) {
    if (*first == NULL) {
        return 0;
    }
    struct item *tmp = *first;
    int d = (*first)->data;
    *first = (*first)->next;
    free(tmp);
    return d;
}

int *begin_of_arr(struct item *p, int node_number, int* arr) {
    if (p->next == NULL) {
        arr = malloc(node_number * sizeof(int) + 1);
        *arr = node_number;
    } else {
        arr = begin_of_arr(p->next, node_number + 1, arr);
    }
     *(arr + node_number) = p->data;
     free(p);
     return arr;
}

int *make_arr_of_int(struct item *first) {
    int node_number = 1;
    int *arr =NULL;
    arr = begin_of_arr(first, node_number, arr);
    return arr;
}

void delete_list_of_int(struct item *first) {
    if (!first) 
        return;
    delete_list_of_int(first->next);
    free(first);
}

void print_list(const struct item *first) {
    if (first) {
        printf("%d ", first->data);
        print_list(first->next);
    } else
        printf("\n");
}

void print_arr(const int *arr, int size) {
    int i;
    for (i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main(int argc, char **argv) {
    int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    struct item *loi = make_list_of_int(arr, 10);
    print_list(loi);
    int *new_arr = make_arr_of_int(loi);
    print_arr(new_arr, 11);
    free(new_arr);
    return 0;
}
