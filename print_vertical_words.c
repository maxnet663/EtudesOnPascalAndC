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

void loc_init(struct word *loc) {
    loc->first = loc->last = NULL;
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

char loc_get(struct word *loc){
    if (!loc->first)
        return -1;
    struct letter *tmp = loc->first;
    char ch = loc->first->data;
    loc->first = loc->first->next;
    if (!loc->first)
        loc->last = NULL;
    free(tmp);
    return ch;
}

int loc_is_empty(struct word *loc) {
    return loc->first == NULL && loc->last == NULL;
}

void delete_letter(struct letter *head) {
    if (head->next)
        delete_letter(head->next);
    free(head);
}

void loc_clear(struct word *loc) {
    delete_letter(loc->first);
    loc_init(loc);
}

void low_init(struct list *low) {
    low->first = low->last = NULL;
}

int low_is_empty(struct list *low) {
    return low->first == NULL && low->last == NULL;
}

void low_put(struct list *low, struct word *loc) {
    struct node *tmp = malloc(sizeof(struct node));
    tmp->data = *loc; 
    tmp->next = NULL;
    if (low->last)
        low->last->next = tmp;
    else
        low->first = tmp;
    low->last = tmp;
}

char low_get_data(struct node *low) {
    if (!loc_is_empty(&low->data))
        return loc_get(&low->data);
    else
        return ' ';
}

int check_data(struct node *walk) {
    if (!walk)
        return 0;
    return !loc_is_empty(&walk->data) ? 1 : check_data(walk->next);
}

int low_has_data(struct list *low) {
    return check_data(low->first); 
}

void print_line(struct node *walk) {
    printf("%c", low_get_data(walk));
    if (walk->next)
        print_line(walk->next);
}

void print_vertical(struct list *low) {
    while (low_has_data(low)) {
        print_line(low->first);
        printf("\n");
    }
}

void delete_node(struct node *head) {
    if (head->next)
        delete_node(head->next);
    free(head);
}

void low_clear(struct list *low) {
    if (!low_is_empty(low))
        delete_node(low->first);
    low_init(low);
}

int main(int argc, char **argv) {
    int c;
    struct word loc;
    loc_init(&loc);
    struct list low;
    low_init(&low);
    while((c = getchar()) != EOF) {
        switch (c) {
            case ' ':
            case '\t': 
            {
                if(!loc_is_empty(&loc)) {
                    low_put(&low, &loc);
                    loc_init(&loc);
                }
                break;
            }
            case '\n':
            {
                if(!loc_is_empty(&loc)) {
                    low_put(&low, &loc);
                    loc_init(&loc);
                }
                print_vertical(&low);
                low_clear(&low);
                break;
            }
            default:
                loc_put(&loc, c);
                break;
        }

    }
    return 0;
}
