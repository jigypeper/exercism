#include "pangram.h"
#include <stdlib.h>


bool is_pangram(const char *sentence) {
  char c;
  int count = 0, i = 0;

  if (sentence == NULL || sentence[0] == '\0')
      return false;

  for (c = 'a'; c <= 'z'; c++) {
    while (sentence[i] != '\0') {
        if (sentence[i] == c || sentence[i] == (c - 32)) {
            count++;
            i = 0;
            break;
        }
        i++;
    }
  }
  
  if (count == 26)
    return true;
  return false;
}
