#include "hamming.h"
#include <stddef.h>


int compute(const char *lhs, const char *rhs) {
  if (lhs == NULL || rhs == NULL) {
    return -1;
  }

  int count = 0;

  for (; *lhs != '\0' && *rhs != '\0'; ++lhs, ++rhs) {
    if (*lhs != *rhs) {
      count += 1;
    }
  }

  if (*lhs != '\0' || *rhs != '\0') {
    return -1;
  }

  return count;
}


