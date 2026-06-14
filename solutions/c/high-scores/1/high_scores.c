#include "high_scores.h"

int32_t latest(const int32_t *scores, size_t scores_len) {
    return scores[scores_len - 1];
}

int32_t personal_best(const int32_t *scores, size_t scores_len) {
  int32_t max = 0;
  size_t i;
  for (i = 0; i < scores_len; i++) {
    if (scores[i] > max)
        max = scores[i];
  }
  return max;
}

size_t personal_top_three(const int32_t *scores, size_t scores_len, int32_t *output) {
    if (scores_len == 0) return 0;

    int32_t max = -1, max_2 = -1, max_3 = -1;

    for (size_t i = 0; i < scores_len; i++) {
        int32_t current = scores[i];

        if (current > max) {
            max_3 = max_2;
            max_2 = max;
            max = current;
        } else if (current > max_2) {
            max_3 = max_2;
            max_2 = current;
        } else if (current > max_3) {
            max_3 = current;
        }
    }

    output[0] = max;
    if (scores_len == 1) return 1;

    output[1] = max_2;
    if (scores_len == 2) return 2;

    output[2] = max_3;
    return 3;
}   
