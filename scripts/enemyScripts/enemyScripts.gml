function getPositionBird(_side) {
	var _x = 0;
	var _y = 0;
	switch(_side) {
		case Side.NORTH: 
			_y = -512;
			_x = random_range(0, ROOM_SIZE);
			break;
		case Side.WEST: 
			_y = random_range(0, ROOM_SIZE);
			_x = -512;
			break;
		case Side.EAST: 
			_y = random_range(0, ROOM_SIZE);
			_x = ROOM_SIZE + 512;
			break;
		case Side.SOUTH: 
			_y = ROOM_SIZE + 512;
			_x = random_range(0, ROOM_SIZE);
			break;			
	}
	
	return [_x, _y];
}