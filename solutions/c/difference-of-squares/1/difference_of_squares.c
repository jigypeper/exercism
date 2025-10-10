#include "difference_of_squares.h"


unsigned int sum_of_squares(unsigned int number) {
  unsigned int i;
  unsigned int total = 0;
  for (i=0; i <= number; i++) {
    total += (i * i);
  }
  return total;
}

unsigned int square_of_sum(unsigned int number) {
  unsigned int i;
  unsigned int total = 0;
  for (i=0; i <= number; i++) {
    total += i;
  }
  return total * total;
}

unsigned int difference_of_squares(unsigned int number) {
  unsigned int square_of_sum_result = square_of_sum(number);
  unsigned int sum_of_squares_result = sum_of_squares(number);
  return square_of_sum_result - sum_of_squares_result;
}
