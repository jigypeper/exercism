#include "isogram.h"
#include <string.h>
#include <ctype.h>

static char to_lower(char c) {
  if (c >= 'A' && c <= 'Z') {
    return c + ('a' - 'A');
  }
  return c;
}
   
bool is_isogram(const char word[]) {
  bool found = false;
  
  if (word == NULL)
    return false;
  
  if (word[0] == '\0')
    return true;

  for (int i = 0; word[i] != '\0' && !found; i++) {
    if (!isalpha(word[i])) continue; 
    for (int j = i + 1; word[j] != '\0'; j++) {
      if (to_lower( word[i] ) == to_lower( word[j] )) {
        found = true;
        break;
      }
    }
  }
  return !found;
}
