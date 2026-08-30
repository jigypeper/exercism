#include "robot_simulator.h"


robot_status_t robot_create(robot_direction_t direction, int x, int y) {
  robot_position_t position = {x, y};
  robot_status_t robot = {direction, position};
  return robot;
}

void robot_move(robot_status_t *robot, const char *commands) {
  for (int i = 0; commands[i] != '\0'; i++) {
    switch (commands[i]) {
    case 'r':
    case 'R':
      if (robot->direction == DIRECTION_WEST)
        robot->direction = DIRECTION_NORTH;
      else
        robot->direction += 1;
      break;
    case 'l':
    case 'L':
      if (robot->direction == DIRECTION_NORTH)
        robot->direction = DIRECTION_WEST;
      else
        robot->direction -= 1;
      break;
    case 'a':
    case 'A':
      switch (robot->direction) {
      case DIRECTION_NORTH:
        robot->position.y += 1;
        break;
      case DIRECTION_EAST:
        robot->position.x += 1;
        break;
      case DIRECTION_SOUTH:
        robot->position.y -= 1;
        break;
      case DIRECTION_WEST:
        robot->position.x -= 1;
        break;
      case DIRECTION_MAX:
        break;
      }
      break;
    }
  }
}
