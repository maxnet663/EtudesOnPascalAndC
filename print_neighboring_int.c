#include <stdio.h>
#include <stdlib.h>
#include <math.h>

struct node {
    int data;
    struct node *next;
    struct node *prev;
};

struct deque {
    struct node *first, *last;
};

void doi_init(struct deque *doi) {
    doi->first = doi->last = NULL;
}

int doi_is_empty(struct deque *doi) {
    return doi->first == NULL && doi->last == NULL;
}

void doi_put(struct deque *doi, int n) {
    struct node *tmp = malloc(sizeof(struct node));
    tmp->data = n;
    tmp->next = NULL;
    tmp->prev = doi->last;
    if (doi->last) 
        doi->last->next = tmp;
     else
        doi->first = tmp;
    doi->last = tmp;
}

int doi_get(struct deque *doi) {
    if (doi->first) {
        struct node *tmp = doi->first;
        int n = doi->first->data;
        doi->first = doi->first->next;
        if(doi->first)
            doi->first->prev = NULL;
        else
            doi->last = NULL;
        free(tmp);
        return n;
    }
    return 0;
}
void delete_node(struct node *head) {
    if(head) {
        if (head->prev)
            free(head->prev);
        delete_node(head->next);
    }
}

void doi_delete(struct deque *doi) {
    delete_node(doi->first);
    free(doi->last);
    doi_init(doi);
}

int print_neighboring(struct node *walk) {
    if (walk && walk->next) {
        if (abs(walk->data - walk->next->data) <= 5) {
            printf("[%d %d]", walk->data, walk->next->data);
            return 1 + print_neighboring(walk->next);
        } else {
            return 0 + print_neighboring(walk->next);
        }
    }
    return 0;
}

int main(int argc, char **argv) {
    int n, ok = 1;
    struct deque doi;
    doi_init(&doi);
    while (ok = scanf("%d", &n)) {
        if (feof(stdin))
            break;
        doi_put(&doi, n);
    }
    if (!ok) {
        fprintf(stderr, "Failed to read number\n");
        return 1;
    }
    if (!print_neighboring(doi.first))
        puts("There are no such numbers");
    else
        printf("\n");
    if (!doi_is_empty(&doi))
        doi_delete(&doi);
    return 0;
}
