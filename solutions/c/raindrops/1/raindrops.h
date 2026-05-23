#ifndef RAINDROPS_H
#define RAINDROPS_H

typedef enum {
  PLING,
  PLANG,
  PLONG,
  NONE
} identifier_t;

void concatinate(char dest[], const char src[], int dest_size);
void add_string(char result[], identifier_t id, int drops);
void convert(char result[], int drops);

#endif
