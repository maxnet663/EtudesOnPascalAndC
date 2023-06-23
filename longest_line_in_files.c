#include <stdio.h>
#include <stdlib.h>

struct string {
    int size;
    char *begin;
};

struct array_of_string {
    struct string *data;
};

typedef struct arr_of_string* array;

int max(int a, int b) {
    return a > b ? a : b;
}

int get_length(char *str) {
    int counter = 0;
    while(*str) {
        counter++;
        str++;
    }
    return counter;
}

/*finds length of the longest line in file f
  returns its length, 0 if file f is empty */
int find_max_length(char *path) {
    FILE *f = fopen(path, "r");
    if (!f) {
        perror(path);
        return 0;
    }
    int max_len = 0, counter = 0, c;
    while ((c = fgetc(f)) != EOF) {
        if (c != '\n') {
            counter++;
        } else {
            max_len = max(max_len, counter);
            counter = 0;
        }
    }
    fclose(f);
    return max_len;
}

/* returns pointer to a line which had put in the heap*/
/*IMPORTANT: if not NULL must be freed after use*/
char *get_longest_line(char *path) {
    FILE *f = fopen(path, "r");
    if (!f) {
        perror(path);
        return NULL;
    }
    int length = find_max_length(path);
    char *line = malloc(length);
    int c, counter = 0;
    while((c = fgetc(f)) != EOF) {
        if (c != '\n') {
            line[counter++] = c;
        } else {
            if (counter == length) {
                line[length] = 0;
                fclose(f);
                return line;
            } else
                counter = 0;
        }
    }
    free(line);
    fclose(f);
    return NULL;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "At least one argument required\n");
        return 1;
    }
    char *longest_lines[argc - 1], *tmp;
    int i;
    for (i = 1; i < argc; i++) {
        tmp = get_longest_line(argv[i]);
        if (tmp)
            longest_lines[i - 1] = tmp;
    }
    int max_length = 0, max_index = 0;
    for (i = 0; i < argc - 1; i++) {
        if (get_length(longest_lines[i]) > max_length) {
            max_index = i;
            max_length = get_length(longest_lines[i]);
        }
    }
    for (i = 0; i < argc - 1; i++) {
        if (i == max_index)
            printf("*%s: %s\n", argv[i + 1], longest_lines[i]);
        else
            printf("%s: %s\n", argv[i + 1], longest_lines[i]);
        free(longest_lines[i]);
        }
    return 0;
}
