#include "hamming.h"
#include "string.h"


int compute(const char *lhs, const char *rhs) {
  int len_lhs = strlen(lhs);
  int len_rhs = strlen(rhs);
  int i, count = 0;

  if (len_lhs != len_rhs) {
    return -1;
  }

  for (i = 0; lhs[i] != '\0'; i++) {
    if (lhs[i] != rhs[i]) {
      count += 1;
    }
  }

  return count;
}


