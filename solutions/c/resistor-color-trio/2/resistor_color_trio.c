#include "resistor_color_trio.h"
#include <stdint.h>

static uint16_t band_to_int(resistor_band_t b) {
  uint16_t result;

  switch (b) {
  case BLACK:  result = 0; break;
  case BROWN:  result = 1; break;
  case RED:    result = 2; break;
  case ORANGE: result = 3; break;
  case YELLOW: result = 4; break;
  case GREEN:  result = 5; break;
  case BLUE:   result = 6; break;
  case VIOLET: result = 7; break;
  case GREY:   result = 8; break;
  case WHITE:  result = 9; break;
  }
  return result;
}


resistor_value_t color_code(resistor_band_t band[]) {
  uint64_t ohms = 10 * band_to_int(band[0]) + band_to_int(band[1]);
  resistor_value_t final;

  int power = band_to_int(band[2]);
  for (int j = 0; j < power; j++) {
    ohms *= 10;
  }

  if (ohms % 1000000000 == 0 && ohms > 0) {
    final.value = ohms / 1000000000;
    final.unit  = GIGAOHMS;
  } else if (ohms % 1000000 == 0 && ohms > 0) {
    final.value = ohms / 1000000;
    final.unit  = MEGAOHMS;
  } else if (ohms % 1000 == 0 && ohms > 0) {
    final.value = ohms / 1000;
    final.unit  = KILOOHMS;
  } else {
    final.value = ohms;
    final.unit  = OHMS;
  }

  return final;
}
