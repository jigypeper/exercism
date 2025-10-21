#include "grains.h"


uint64_t square(uint8_t index) {
  uint64_t results[64] = {1};
  for (int i = 1; i < index; i++) {
    results[i] = 2 * results[i - 1];
  }
  return results[index - 1];
}


uint64_t total(void) {
  return square(64);
}
