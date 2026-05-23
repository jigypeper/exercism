#include "raindrops.h"
#include <stdio.h>

#define BUFFER_SIZE 100

void concatinate(char dest[], const char src[], int dest_size) {
  int i = 0;
  int j = 0;

  while (dest[i] != '\0')
    i++;
  
  while (src[j] != '\0' && i < dest_size) {
      dest[i++] = src[j++];
  }
  
  dest[i] = '\0';
}


void add_string(char result[], identifier_t id, int drops) {
  char num[100];
  
  switch (id) {
  case PLING:
      concatinate(result, "Pling", BUFFER_SIZE);
      break;
  case PLANG:
    concatinate(result, "Plang", BUFFER_SIZE);
    break;
  case PLONG:
    concatinate(result, "Plong", BUFFER_SIZE);
    break;
  default:
    snprintf(num, sizeof(num), "%d", drops);
    concatinate(result, num, BUFFER_SIZE);
    break;
  }
}
void convert(char result[], int drops) {
    if (drops % 3 == 0) {
        add_string(result, PLING, drops);
    }
    if (drops % 5 == 0) {
        add_string(result, PLANG, drops);
    }
    if (drops % 7 == 0) {
        add_string(result, PLONG, drops);
    }

    if (drops % 3 != 0 && drops % 5 != 0 && drops % 7 != 00) {
        add_string(result, NONE, drops);
    }
}
