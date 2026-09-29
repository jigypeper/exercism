#include "allergies.h"

/**
 * is_allergic_to - Check if a number indicates an allergy to a specific allergen.
 * @allergen: The allergen to check (0-7, representing eggs through cats).
 * @num:      The total allergy score, where each bit represents an allergen.
 *
 * Each allergen corresponds to a specific bit in the number:
 *   bit 0 = eggs, bit 1 = peanuts, ..., bit 7 = cats.
 * A person is allergic to an allergen if that bit is set (1) in the number.
 *
 * Return: true if the allergen's bit is set in num, false otherwise.
 */
bool is_allergic_to(allergen_t allergen, int num) {
  int allergen_value = 1 << allergen;
  return (num & allergen_value) != 0;
}

allergen_list_t get_allergens(int num) {
  allergen_list_t allergens = {.allergens = {false}, .count = 0};
  
  for (int i = 0; i < 8; i++) {
    if (is_allergic_to(i, num)) {
      allergens.allergens[i] = true;
      allergens.count ++;
    }
  }
  return allergens;
}
