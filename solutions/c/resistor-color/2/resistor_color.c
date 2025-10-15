#include "resistor_color.h"


int color_code(resistor_band_t band) {
  switch (band) {
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
    default:
      return -1;
      break;
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
