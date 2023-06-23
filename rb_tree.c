#include <stdio.h>
#include <stdlib.h>

enum color {
    BLACK, 
    RED
};

typedef struct rb_tree_node* rb_tree_node_ptr;

struct rb_tree_node {
    rb_tree_node_ptr left;
    rb_tree_node_ptr right;
    rb_tree_node_ptr parent;
    enum color clr;
    char *key; /*key will be the string*/
    void *value; /*any data can be associated with the key*/
};

/*head is the parent of the root, head is always red and
  root is always black, also root is left son of header*/
struct rb_tree {
    rb_tree_node_ptr head; 
};

void rb_tree_init(struct rb_tree *tree) {
    tree->head->right = NULL;
    tree->head->left = NULL;
    tree->head->parent = NULL;
    tree->head->clr = RED;
}

int main(int argc, char **argv) {

    return 0;
}
