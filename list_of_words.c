#include <stdio.h>
#include <stdlib.h>

struct letter {
    char data;
    struct letter *next;
};

struct word {
    struct letter *first, *last;
};

struct node {
    struct word data;
    struct node *next;
};

struct list {
    struct node *first, *last;
};

void low_init(struct list *low) {
    low->first = low->last = NULL;
}

void loc_init(struct word *loc) {
    loc->first = loc->last = NULL;
}

void low_push(struct list *low, struct word *w) {
    struct node *tmp = malloc(sizeof(struct node)); 
    tmp->data.first = w->first;
    tmp->data.last = w->last;
    tmp->next = low->first;
    if (!low->first)
        low->last = tmp;
    low->first = tmp;
}

void loc_put(struct word *loc, char ch) {
    struct letter *tmp = malloc(sizeof(struct letter));
    tmp->data = ch;
    tmp->next = NULL;
    if (loc->last) 
        loc->last->next = tmp;
    else 
        loc->first = tmp;
    loc->last = tmp;
}

void loc_print(struct letter *head) {
    if (!head) {
        printf(" ");
        return;
    }
    printf("%c", head->data);
    loc_print(head->next);
}

void low_print(struct node *head) {
    if (!head) {
        printf("\n");
        return;
    }
    loc_print(head->data.first);
    low_print(head->next);
}

void loc_delete(struct letter *head) {
    if (head->next)
        loc_delete(head->next);
    free(head);
}

void low_delete(struct node *head) {
    if(head->next) 
        low_delete(head->next);
    loc_delete(head->data.first);
    free(head);
}

int loc_is_empty(struct word *loc) {
    return loc->first == NULL && loc->last == NULL;
}

int low_is_empty(struct list *low) {
    return low->first == NULL && low->last == NULL;
}

int main(int argc, char **argv) {
    int c;
    struct list low;
    struct word loc;
    low_init(&low);
    loc_init(&loc);
    while((c = getchar()) != EOF) {
        switch (c) {
            case ' ':
            case '\t':
            {
                if (!loc_is_empty(&loc)) {
                    low_push(&low, &loc);
                    loc_init(&loc);
                }
                break;
            }
            case '\n':
            {
                if (!loc_is_empty(&loc)) {
                    low_push(&low, &loc);
                    low_print(low.first);
                    low_delete(low.first);
                    low_init(&low);
                    loc_init(&loc);
                }
                break;
            }
            default:
            {
                loc_put(&loc, c);
                break;
            }
        }
    }
    if (!low_is_empty(&low))
        low_delete(low.first);
    return 0;
}
