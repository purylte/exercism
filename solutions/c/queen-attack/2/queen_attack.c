#include "queen_attack.h"
#include <stdlib.h>

attack_status_t can_attack(position_t queen_1, position_t queen_2) {
  if (!is_valid_position(queen_1) || !is_valid_position(queen_2) ||
      (queen_1.row == queen_2.row && queen_1.column == queen_2.column)) {
    return INVALID_POSITION;
  }
  if (queen_1.row == queen_2.row || queen_1.column == queen_2.column ||
      (abs(queen_1.row - queen_2.row) ==
       abs(queen_1.column - queen_2.column))) {
    return CAN_ATTACK;
  }
  //   0 1 2 3 4 5 6 7
  // 0
  // 1
  // 2     x
  // 3
  // 4 y
  // 5
  // 6
  // 7

  return CAN_NOT_ATTACK;
}

static int is_valid_position(position_t pos) {
  return pos.column < 8 && pos.row < 8;
}
