#include "resistor_color_duo.h"

int map_color_to_int(resistor_band_t color) {
  switch (color) {
    case BLACK:
      return 0;
      break;
    case BROWN:
      return 1;
      break;
    case RED:
      return 2;
      break;
    case ORANGE:
      return 3;
      break;
    case YELLOW:
      return 4;
      break;
    case GREEN:
      return 5;
      break;
    case BLUE:
      return 6;
      break;
    case VIOLET:
      return 7;
      break;
    case GREY:
      return 8;
      break;
    case WHITE:
      return 9;
      break;
  }
}

int color_code(resistor_band_t *pair) {
  resistor_band_t colour_1 = pair[0];
  resistor_band_t colour_2 = pair[1];
  int colour_1_int = map_color_to_int(colour_1);
  int colour_2_int = map_color_to_int(colour_2);
  int result = (10 * colour_1_int) + colour_2_int;
  return result;
}
