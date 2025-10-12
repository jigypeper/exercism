#include "binary.h"
#include <stdio.h>

int convert(const char *input) {
  int i;
  int result = 0;

  for (i = 0; input[i] != '\0'; i++) {
    if (input[i] != '1' && input[i] != '0') {
      return INVALID;
    }
    int num = input[i] - '0';
    result = (result << 1) + num;
  }
  return result;
  
}
