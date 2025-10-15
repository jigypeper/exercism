#include "resistor_color.h"


int color_code(resistor_band_t band) {
  switch (band) {
    case BLACK:
      return 0;
    case BROWN:
      return 1;
    case RED:
      return 2;
    case ORANGE:
      return 3;
    case YELLOW:
      return 4;
    case GREEN:
      return 5;
    case BLUE:
      return 6;
    case VIOLET:
      return 7;
    case GREY:
      return 8;
    case WHITE:
      return 9;
    default:
      return -1;
  }
}

resistor_band_t* colors(void) {
  static resistor_band_t resistor_colors[] = {
    BLACK,
    BROWN,
    RED, 
    ORANGE, 
    YELLOW, 
    GREEN, 
    BLUE, 
    VIOLET, 
    GREY, 
    WHITE, 
  };

  return resistor_colors;
}
