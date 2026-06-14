#include "dnd_character.h"
#include <math.h>
#include <stdlib.h>
#include <time.h>

#define ATTRIBUTES 6
#define ROLLS      4

/* Seed once at startup */
static int seeded = 0;

static int random_num(void) {
    if (!seeded) {
        srand(time(NULL));
        seeded = 1;
    }
    return (rand() % 6) + 1;  /* 1–6 inclusive */
}

static void insert_sorted(int arr[], int size, int key) {
    int i;
    for (i = size - 1; (i >= 0 && arr[i] > key); i--) {
        arr[i + 1] = arr[i];
    }
    arr[i + 1] = key;
}

/* Roll 4d6, drop the lowest, return the sum of the top 3 */
int ability(void) {
    int rolls[ROLLS] = {0};
    int j;
    for (j = 0; j < ROLLS; j++) {
        int roll = random_num();
        insert_sorted(rolls, j, roll);  /* insert into the first j elements */
    }
    /* rolls is sorted ascending; skip index 0 (lowest), sum indices 1–3 */
    return rolls[1] + rolls[2] + rolls[3];
}

/* floor((score - 10) / 2) using integer arithmetic */
int modifier(int score) {
    return (int)floor((score - 10) / 2.0);
}

dnd_character_t make_dnd_character(void) {
    dnd_character_t character;

    character.strength     = ability();
    character.dexterity    = ability();
    character.constitution = ability();
    character.intelligence = ability();
    character.wisdom       = ability();
    character.charisma     = ability();
    character.hitpoints    = 10 + modifier(character.constitution);

    return character;
}
