#ifndef RESISTOR_COLOR_DUO_H
#define RESISTOR_COLOR_DUO_H
typedef enum {
  BLACK,
  BROWN,
  RED,
  ORANGE,
  YELLOW,
  GREEN,
  BLUE,
  VIOLET,
  GREY,
  WHITE
} resistor_band_t;

int map_color_to_int(resistor_band_t color);

int color_code(resistor_band_t[]);

#endif
