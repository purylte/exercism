#ifndef DARTS_H
#define DARTS_H

#include <math.h>
#include <stdint.h>

typedef struct {
  float_t x;
  float_t y;
} coordinate_t;

uint8_t score(coordinate_t);

#endif
