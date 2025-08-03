depth = depthstart - bbox_bottom;


if(sfx != noone && audioPlayed == -1) {
	audioPlayed = audio_play_sound_on(audioEmitter, sfx, true, 1)	;
}

inputDirection = point_direction(x, y, targetX, targetY);
// inputMagnitude = (_keyRight - _keyLeft != 0) || (_keyDown - _keyUp != 0);

var hSpeed = lengthdir_x(spd, inputDirection);
var vSpeed = lengthdir_y(spd, inputDirection);

moving = false;

if(hSpeed != 0) {
	//x += hSpeed;
	moving = true;
}

if(vSpeed != 0) {
	//y += vSpeed;
	moving = true;
}


if(useCollisions) {
	move_and_collide(hSpeed, vSpeed, oPlayer.collisionMap);	
} else {
	x += hSpeed;
	y += vSpeed;
}

if(moving) {
    moveAngle = point_direction(0, 0, hSpeed, vSpeed);
}

x = floor(x);
y = floor(y);

audio_emitter_position(audioEmitter, x, y, 0);

if(abs(floor(targetX) - x) < spd)  {
	x = floor(targetX);	
}

if(abs(floor(targetY) - y) < spd)  {
	y = floor(targetY);	
}

if(x == floor(targetX) && y == floor(targetY)) {
	moving = false;	
}

