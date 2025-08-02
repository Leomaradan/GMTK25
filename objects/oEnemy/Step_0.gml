var inputDirection = point_direction(x, y, targetX, targetY);
// inputMagnitude = (_keyRight - _keyLeft != 0) || (_keyDown - _keyUp != 0);

var hSpeed = lengthdir_x(spd, inputDirection);
var vSpeed = lengthdir_y(spd, inputDirection);

if(hSpeed != 0) {
	x += hSpeed;
}

if(vSpeed != 0) {
	y += vSpeed;
}

x = floor(x);
y = floor(y);

if(abs(floor(targetX) - x) < spd)  {
	x = floor(targetX);	
}

if(abs(floor(targetY) - y) < spd)  {
	y = floor(targetY);	
}

