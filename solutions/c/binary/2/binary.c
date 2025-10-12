#include "binary.h"
#include <stdio.h>
#include <math.h>


unsigned int length(const char *str) {
  int i;
  for (i = 0; str[i] != '\0'; i++) {
    continue;
  }
  return i;
}

bool check_string(const char *input) {
  int i;
  bool result = false;
  for (i = 0; input[i] != '\0'; i++) {
    result = input[i] == '1' || input[i] == '0';
    if (!result) {
      break;
    }
  }
  return result;
}

int convert(const char *input) {
  int i;
  int result = 0;
  bool check = check_string(input);
  if (!check) {
    return INVALID;
  }
  unsigned int binary_length = length(input);
  unsigned int exponent = binary_length - 1;

  for (i = 0; input[i] != '\0'; i++) {
    int num = input[i] - '0';
    result += num * pow(2, exponent);
    exponent--;
  }
  return result;
  
}
