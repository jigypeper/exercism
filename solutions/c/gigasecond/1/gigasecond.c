#include "gigasecond.h"
#include <stdio.h>
#include <string.h>


void gigasecond(time_t start_time, char *result, size_t size) {
  struct tm *time_data;
  const time_t giga_second_later = start_time + GIGASECOND;
  time_data = gmtime(&giga_second_later);
  snprintf(result, size, "%4d-%02d-%02d %02d:%02d:%02d",
           time_data->tm_year + 1900, time_data->tm_mon + 1, time_data->tm_mday,
           time_data->tm_hour, time_data->tm_min,
           time_data->tm_sec);
}
