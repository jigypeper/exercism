#include "armstrong_numbers.h"
#include <math.h>
#include <stdlib.h>

static int* get_digits(int n, int *count) {
    if (n == 0) {
        *count = 1;
        int *digits = malloc(sizeof(int));
        digits[0] = 0;
        return digits;
    }

    n = abs(n);
    int temp = n;
    *count = 0;

    while (temp > 0) {
        temp /= 10;
        (*count)++;
    }

    int *digits = malloc(*count * sizeof(int));

    for (int i = 0; i < *count; i++) {
        digits[i] = n % 10;
        n /= 10;
    }

    return digits;
}

bool is_armstrong_number(int candidate) {
    int count, i, total = 0;
    int *digits = get_digits(candidate, &count);

    for (i = 0; i < count; i++) {
        total += pow(digits[i], count);
    }

    free(digits);

    if (total == candidate)
      return true;

    return false;
}
