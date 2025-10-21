#include "grains.h"


uint64_t square(uint8_t index) {
  uint64_t results[64] = {1};
  if (index < 1) {
    return 0;
  }
  for (int i = 1; i < index; i++) {
    results[i] = 2 * results[i - 1];
  }
  return results[index - 1];
}


uint64_t total(void) {
  uint64_t total = 1;
  for (int i = 1; i < 64; i ++) {
    total *= 2;
  }
  return total;
}
