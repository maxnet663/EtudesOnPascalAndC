#include <stdio.h>
#include <stdlib.h>

struct digit {
    char data;
    struct digit *next;
};

struct seq {
    int length;
    struct digit *first, *last;
};

struct node {
    struct seq data;
    struct node *next;
};

struct list {
    struct node *first, *last;
};

void lod_init(struct seq *lod) {
    lod->length = 0;
    lod->first = lod->last = NULL;
}

int lod_is_empty(struct seq *lod) {
    return lod->first == NULL && lod->last == NULL;
}

void lod_put(struct seq *lod, char d) {
    struct digit *tmp = malloc(sizeof(struct digit));
    tmp->data = d;
    tmp->next = NULL;
    if (lod->last)
        lod->last->next = tmp;
    else
        lod->first = tmp;
    lod->last = tmp;
    lod->length++;
}

char lod_get(struct seq *lod) {
    struct digit *tmp = lod->first;
    char d = lod->first->data;
    lod->first = lod->first->next;
    if(!lod->first)
        lod->last = NULL;
    free(tmp);
    lod->length--;
    return d;
}

void los_init(struct list *los) {
    los->first = los->last = NULL;
}

int los_is_empty(struct list *los) {
    return los->first == NULL && los->last == NULL;
}

int los_put(struct list *los, struct seq *lod) {
    struct node *tmp = malloc(sizeof(struct node));
    tmp->data = *lod;
    tmp->next = NULL;
    int length = lod->length;
    if (los->last)
        los->last->next = tmp;
    else
        los->first = tmp;
    los->last = tmp;
    lod_init(lod);
    return length;
}

void los_get(struct list *los) {
    while (!lod_is_empty(&los->first->data))
        lod_get(&los->first->data);
    struct node *tmp = los->first;
    los->first = los->first->next;
    if (!los->first)
        los->last = NULL;
    free(tmp);
}

void los_get_with_print(struct list *los) {
    while (!lod_is_empty(&los->first->data))
        printf("%c", lod_get(&los->first->data));
    printf(" ");
    struct node *tmp = los->first;
    los->first = los->first->next;
    if (!los->first)
        los->last = NULL;
    free(tmp);
}

int max(int a, int b) {
    return a > b ? a : b;
}

void print_longest_sequance(struct list *los, int *max) {
    while(!los_is_empty(los)) {
        if (los->first->data.length == *max)
            los_get_with_print(los);
        else
            los_get(los);
    }
    *max = 0;
    printf("\n");
}

int is_digit(int c) {
    if (c >= '0' && c <= '9')
        return 1;
    if (c == '\n')
        return -1;
    else
        return 0;
}

int main(int argc, char **argv) {
    int c, max_length = 0;
    struct list los;
    struct seq lod;
    los_init(&los);
    lod_init(&lod);
    while ((c = getchar()) != EOF) {
        switch (is_digit(c)) {
            case 1:
                {
                    lod_put(&lod, c);
                    break;
                }
            case 0:
                {
                    if (!lod_is_empty(&lod))
                        max_length = max(max_length, los_put(&los, &lod));
                    break;
                }
            case -1:
                {
                    if (!lod_is_empty(&lod))
                        max_length = max(max_length, los_put(&los, &lod));
                    print_longest_sequance(&los, &max_length);
                    break;
                }
        }
    }
    return 0;
}
