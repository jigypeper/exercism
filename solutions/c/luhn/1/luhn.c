#include "luhn.h"
#include <ctype.h>
#include <stdlib.h>
#include <string.h>


static void remove_all_spaces(char *str) {
  if (!str) return;
  char *write = str;
  for (char *read = str; *read != '\0'; read++) {
    if (!isspace((unsigned char)*read)) {
      *write++ = *read;
    }
  }
  *write = '\0';
}

static bool check_number(const char *num) {
  while (*num != '\0') {
    if (!isdigit(*num))
      return false;
    num++;
  }
  return true;
}

bool luhn(const char *num) {
  char *working_copy = NULL;
  int length, i, skip = 0, total = 0;
  
  if (NULL == num)
    return false;
  
  working_copy = malloc(strlen(num) + 1);

  if (working_copy)
    strcpy(working_copy, num);
  else
    return false;
  remove_all_spaces(working_copy);
  
  length = strlen(working_copy);
  
  if (length <= 1)
    return false;
  
  if (!check_number(working_copy))
    return false;

  for (i = length-2; i > -1; i--) {
    if (!skip) {
      int num_rep = working_copy[i] - '0';
      num_rep *= 2;
      if (num_rep > 9)
        num_rep -= 9;
      working_copy[i] = num_rep + '0';
      skip = 1;
      continue;
    }
    skip = 0;
  }
  
  for (i = 0; working_copy[i] != '\0'; i++) {
    int num_rep = working_copy[i] - '0';
    total += num_rep;
  }
  
  free(working_copy);
  if (0 == total % 10)
    return true;
  else
    return false;
}
