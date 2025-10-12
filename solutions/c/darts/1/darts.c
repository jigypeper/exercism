#include "darts.h"
#include <math.h>


double magnitude(coordinate_t position) {
  double x_squared = pow(position.x, 2.0);
  double y_squared = pow(position.y, 2.0);

  return sqrt(x_squared + y_squared);
}

unsigned int score(coordinate_t position) {
  double length = magnitude(position);
  if (length > 10.0) {
    return 0;
  } else if (length <= 1.0 ) {
    return 10;
  } else if (length <= 5.0) {
    return 5;
  } else {
    return 1;
  }
}
