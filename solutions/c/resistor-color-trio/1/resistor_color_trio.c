#include "resistor_color_trio.h"
#include <stdint.h>

static uint16_t band_to_int(resistor_band_t b) {
  uint16_t result;
  
  switch (b) {
  case BLACK:
    result = 0;
    break;
  case BROWN:
    result = 1;
    break;
  case RED:
    result = 2;
    break;
  case ORANGE:
    result = 3;
    break;
  case YELLOW:
    result = 4;
    break;
  case GREEN:
    result = 5;
    break;
  case BLUE:
    result = 6;
    break;
  case VIOLET:
    result = 7;
    break;
  case GREY:
    result = 8;
    break;
  case WHITE:
    result = 9;
    break;
  }

  return result;
}

static unit_t band_to_unit(resistor_band_t b) {
  unit_t result;
  
  switch (b) {
  case BLACK:
    result = OHMS;
    break;
  case BROWN:
    result = OHMS;
    break;
  case RED:
    result = OHMS;
    break;
  case ORANGE:
    result = KILOOHMS;
    break;
  case YELLOW:
    result = KILOOHMS;
    break;
  case GREEN:
    result = KILOOHMS;
    break;
  case BLUE:
    result = MEGAOHMS;
    break;
  case VIOLET:
    result = MEGAOHMS;
    break;
  case GREY:
    result = MEGAOHMS;
    break;
  case WHITE:
    result = GIGAOHMS;
    break;
  }

  return result;
}
resistor_value_t color_code(resistor_band_t band[]) {
  uint16_t result = 0;
  int i;
  resistor_value_t final;
    for (i = 0; i < 3; i++) {
        if (i == 0)
            result += (10 * band_to_int( band[i] )); 
        if (i == 1)
          result += (band_to_int(band[i]));
        if (i == 2) {
          int power = band_to_int(band[i]);
          for (i = 0; i < power + 1; i++) {
              if (i != 0)
                  result *= 10;
          }
        }
    }
    final.value = result;
    final.unit = band_to_unit(band[2]);

    switch (final.unit) {
    case KILOOHMS:
      final.value /= 1000;
      break;
    case MEGAOHMS:
      final.value /= 1000000;
      break;
    case GIGAOHMS:
      final.value /= 1000000000;
      break;
    default:
        break;
    }
    return final;
}
