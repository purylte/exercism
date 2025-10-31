#include "grains.h"
#include <math.h>

uint64_t square(uint8_t index) { return pow(2, index - 1); }
uint64_t total(void) {
  unsigned long sum = 0;
  for (int i = 1; i <= 64; i++) {
    sum += square(i);
  }
  return sum;
}
