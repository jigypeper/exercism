#include "perfect_numbers.h"

kind classify_number(int number) {
    int i, result = 0;
    if (number <= 0)
        return ERROR;

    for (i = 1; i < number; i++) {
        if (number % i == 0)
            result += i;
    }

    if (result == number)
      return PERFECT_NUMBER;
    
    if (result > number)
      return ABUNDANT_NUMBER;
    
    if (result < number)
      return DEFICIENT_NUMBER;
    
    return ERROR;
}
