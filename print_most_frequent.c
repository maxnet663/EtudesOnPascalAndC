#include <stdio.h>
#include <stdlib.h>

struct item {
    long data;
    int counter;
    struct item *next;
};

struct list {
    struct item *first, *last;
};

void lol_init(struct list *lol) {
    lol->first = lol->last = NULL;
}

struct item *is_contain(struct item *head, long x) {
    return head ? (head-> data == x ? head: is_contain(head->next, x)) : NULL;
}

int lol_push(struct list *lol, long x) {
    struct item *tmp = is_contain(lol->first, x);
    if (tmp) {
        tmp->counter++;
    } else {
        tmp = malloc(sizeof(struct item));
        tmp->data = x;
        tmp->counter = 1;
        tmp->next = NULL;
        if (lol->last) 
            lol->last->next = tmp;
        else
            lol->first = tmp;
        lol->last = tmp;
    }
    return tmp->counter;
}

int max(int a, int b) {
    return a > b ? a : b;
}

void print_most_frequent(struct item *head, int max) {
    if (!head) {
        printf("\n");
        return;
    }
    if (head->counter == max) 
        printf("%ld ", head->data);
    print_most_frequent(head->next, max);
    free(head);
}

void lol_delete(struct item *head) {
    if (!head)
        return;
    lol_delete(head->next);
    free(head);
}

int main(int argc, char **argv) {
    int max_meet = 0, ok = 1;
    long n;
    struct list lol;
    lol_init(&lol);
    while (ok = scanf("%ld", &n)) {
        if (feof(stdin))
            break;
        max_meet = max(lol_push(&lol, n), max_meet);
    }
    if (!ok) {
        fprintf(stderr, "Failed to read number\n");
        (lol_delete(lol.first));
        return 1;
    }
    print_most_frequent(lol.first, max_meet);
    return 0;
}
