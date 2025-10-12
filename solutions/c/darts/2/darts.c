#include "darts.h"
#include <math.h>


double magnitude(coordinate_t position) {
  double x_squared = position.x * position.x;
  double y_squared = position.y * position.y;

  return sqrt(x_squared + y_squared);
}

unsigned int score(coordinate_t position) {
  double length = magnitude(position);
  if (length > OUTER_CIRCLE_RADIUS) {
    return 0;
  } else if (length <= INNER_CIRCLE_RADIUS ) {
    return 10;
  } else if (length <= MIDDLE_CIRCLE_RADIUS) {
    return 5;
  } else {
    return 1;
  }
}
