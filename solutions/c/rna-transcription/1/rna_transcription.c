#include "rna_transcription.h"
#include <stdlib.h>
#include <string.h>


char *to_rna(const char *dna) {
  size_t len = strlen(dna);
  char *output = malloc(len + 1);
  
  for (int i =0; dna[i] != '\0'; i++) {
    switch (dna[i]) {
      case 'G':
        output[i] = 'C';
        break;
      case 'C':
        output[i] = 'G';
        break;
      case 'T':
        output[i] = 'A';
        break;
      case 'A':
        output[i] = 'U';
        break;
      default:
        output[i] = ' ';
        break;
    } 
  }
  output += '\0';
  return output;
}
