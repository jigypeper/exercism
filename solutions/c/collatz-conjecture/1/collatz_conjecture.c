#include "collatz_conjecture.h"


int steps(int start) {
  int result = 0;
  int updated_start = start;
  if (start < 1) {
    return ERROR_VALUE;
  } else {
    for (;;) {
      if (updated_start == 1) {
        return result;
      } else if (updated_start % 2 == 0) {
        result ++;
        updated_start = updated_start / 2;
      } else {
        result ++;
        updated_start = (updated_start * 3) + 1;
      }
    }
  }
}
