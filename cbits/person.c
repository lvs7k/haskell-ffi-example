#include <stdio.h>
#include "person.h"

void showPerson(Person *p)
{
    printf("name: %s, age: %d\n", p->name, p->age);
    return;
}