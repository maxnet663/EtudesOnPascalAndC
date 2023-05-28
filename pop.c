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
    if(!head) {
        return NULL;
    }
    return head->data == x ? head : is_contain(head->next, x);
}

void lol_push(struct list *lol, long x) {
    if (is_contain(lol->first, x)) {
        is_contain(lol->first, x)->counter++;
        return;
    }
    struct item *tmp = malloc(sizeof(struct item));
    tmp->data = x;
    tmp->counter = 1;
    tmp->next = NULL;
    if(lol->last) 
        lol->last->next = tmp;
    else
        lol->first = tmp;
    lol->last = tmp;
}

void print_met_three(struct item *head) {
    if (!head) {
        printf("\n");
        return;
    }
    if (head->counter == 3)
        printf("%ld ", head->data);
    print_met_three(head->next);
    free(head);
}

void print_all(struct item *head) {
    if(!head) {
        printf("\n");
        return;
    }
    printf("%ld ", head->data);
    print_all(head->next);
    free(head);
}

int main(int argc, char **argv) {
    struct list lol;
    lol_init(&lol);
    long n;
    int ok = 1;
    while (1) {
        scanf("%ld", &n);
        if(feof(stdin))
            break;
        lol_push(&lol, n);
    }
    if (feof(stdin)) 
        fprintf(stderr, "It's ok\n");
    if (ferror(stdin))
        fprintf(stderr, "It's not ok\n");
    print_all(lol.first);
    return 0;
}
