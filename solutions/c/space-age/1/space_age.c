#include "space_age.h"
#define EARTH_YEAR_SECONDS 31557600.0

float age(planet_t planet, int64_t seconds) {
    float result;
  switch (planet) {
  case MERCURY:
    result = (seconds/EARTH_YEAR_SECONDS) / 0.2408467;
    break;
  case VENUS:
    result = (seconds/EARTH_YEAR_SECONDS) / 0.61519726;
    break;
  case EARTH:
    result = (seconds/EARTH_YEAR_SECONDS) / 1.0;
    break;
  case MARS:
    result = (seconds/EARTH_YEAR_SECONDS) / 1.8808158;
    break;
  case JUPITER:
    result = (seconds/EARTH_YEAR_SECONDS) / 11.862615;
    break;
  case SATURN:
    result = (seconds/EARTH_YEAR_SECONDS) / 29.447498;
    break;
  case URANUS:
    result = (seconds/EARTH_YEAR_SECONDS) / 84.016846;
    break;
  case NEPTUNE:
    result = (seconds/EARTH_YEAR_SECONDS) / 164.79132;
    break;
  default:
    result = -1.0;
    break;
  }

  return result;
}
