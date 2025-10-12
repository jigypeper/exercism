#ifndef DARTS_H
#define DARTS_H

typedef struct {
    double x;
    double y;
} coordinate_t;

double magnitude(coordinate_t position);

unsigned int score(coordinate_t position);

#define INNER_CIRCLE_RADIUS 1.0
#define MIDDLE_CIRCLE_RADIUS 5.0
#define OUTER_CIRCLE_RADIUS 10.0
   
#endif
