#include "darts.h"
#include <math.h>

uint8_t score(coordinate_t coord) {
  float_t d_sqr = coord.x * coord.x + coord.y * coord.y;
  if (d_sqr <= 1 * 1)
    return 10;
  if (d_sqr <= 5 * 5)
    return 5;
  if (d_sqr <= 10 * 10)
    return 1;
  return 0;
}
