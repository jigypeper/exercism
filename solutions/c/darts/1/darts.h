#ifndef DARTS_H
#define DARTS_H

typedef struct {
    double x;
    double y;
} coordinate_t;

double magnitude(coordinate_t position);

unsigned int score(coordinate_t position);
   
#endif
