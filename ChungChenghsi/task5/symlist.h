#ifndef _SYMLIST_H_
#define _SYMLIST_H_
#define NHASH       999

struct symbol {
    char *name;
    double value;
    struct ast * func;
    struct symlist * syms;
};

struct symbol symtab[NHASH];

struct symbol * lookup(char *);

struct symlist {
    struct symbol *sym;
    struct symlist *next;
};

struct symlist * newsymlist(struct symbol *sym, struct symlist *next);
void symlistfree(struct symlist *sl);

#endif
