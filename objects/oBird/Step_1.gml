/*var _distanceToPlayer = distance_to_object(oPlayer);

cooldown--;

if(_distanceToPlayer < 128) {
	targetX = oPlayer.x;
	targetY = oPlayer.y;
	cooldown = 0;
} else if(cooldown <= 0) {
	targetX = clamp(random_range(x - 512, x + 512), 256, 8000 - 256);
	targetY = clamp(random_range(y - 512, y + 512), 256, 8000 - 256);
	cooldown = random_range(2 * FPS, 4 * FPS);
}*/

switch(gameplayState) {
	case GameplayState.BUTTERFLY:
	case GameplayState.COCOON:
		spriteIdle = sBirdGliding;
		spriteMove = sBirdGliding;
		//spriteOpacity = 1;
		spriteShadow = sBirdGlidingShadow;
		break;
	case GameplayState.CATERPILLAR:
		spriteIdle = sBirdGlidingShadow;
		spriteMove = sBirdGlidingShadow;
		//spriteOpacity = 0.3;
		spriteShadow = noone;
		break;
}

if(state == BirdState.NOT_STARTED) {
	// calculate start position and end position,
	// then move to start position and switch status
	var _start = getPositionBird(baseDirection);
	var _end = getPositionBird(targetDirection);
	
	x = _start[0];
	y = _start[1];
	
	targetX = _end[0];
	targetY = _end[1];
	
	state = BirdState.STARTED;
	
	//show_debug_message("Bird start flying from {0}/{1} to {2}/{3}", x, y, targetX, targetY);
	
}

var _inRoom = (x > 0 && 
	x < ROOM_SIZE && 
	y > 0 && 
	y < ROOM_SIZE);

if(state == BirdState.STARTED && _inRoom) {
	
	//show_debug_message("Bird enter the room at {0}/{1}", x, y);
	state = BirdState.IN_ROOM;
}

if(state == BirdState.IN_ROOM && !_inRoom) {
	
	//show_debug_message("Bird leave the room at {0}/{1}", x, y);
	state = BirdState.NOT_STARTED;
}

