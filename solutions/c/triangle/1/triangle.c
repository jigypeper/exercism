#include "triangle.h"

static bool validate_triangle(triangle_t sides) {
  if (sides.a == 0 && sides.b == 0 && sides.c == 0)
      return false;
  return (((sides.a + sides.b) >= sides.c) && ((sides.b + sides.c) >= sides.a)
          && ((sides.a + sides.c) >= sides.b));
}

bool is_equilateral(triangle_t sides) {
  if (validate_triangle(sides)) {
      return (sides.a == sides.b && sides.b == sides.c);
  }
  return false;
}

bool is_scalene(triangle_t sides) {
  if (validate_triangle(sides)) {
      return (sides.a != sides.b && sides.b != sides.c && sides.a != sides.c);
  }
  return false;
}

bool is_isosceles(triangle_t sides) {
  if (validate_triangle(sides)) {
    if (is_equilateral(sides))
        return true;
    return ((sides.a == sides.b && sides.b != sides.c) ||
            (sides.a != sides.b && sides.b == sides.c)
            || ( sides.a == sides.c && sides.b != sides.c ));
  }
  return false;
}
