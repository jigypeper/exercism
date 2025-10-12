#include "collatz_conjecture.h"


int steps(int start) {
  int result = 0;

  if (start < 1) {
    return ERROR_VALUE;
  }
  
  while (start != 1) {
    if (start % 2 == 0) {
      start /= 2;
    } else {
      start = (start * 3) + 1;
    }
    ++result;
  }

  return result;
}
