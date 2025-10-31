#include "resistor_color.h"

const resistor_band_t *colors(void) {
  static const resistor_band_t color_list[] = {COLORS};
  return color_list;
}

int color_code(resistor_band_t color) { return color; }
