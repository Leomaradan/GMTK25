event_inherited();

baseDirection = choose(Side.NORTH, Side.WEST, Side.EAST, Side.SOUTH);
targetDirection = Side.NORTH;

switch(baseDirection) {
	case Side.NORTH: targetDirection = Side.SOUTH;
	case Side.WEST: targetDirection = Side.EAST;
	case Side.EAST: targetDirection = Side.WEST;
	case Side.SOUTH: targetDirection = Side.NORTH;
}

state = BirdState.NOT_STARTED;

// 0 = not started, not entered in room
// 1 = started
// 2 = exited room