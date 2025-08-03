var _keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

moving = false;

inputDirection = point_direction(0, 0, _keyRight - _keyLeft, _keyDown - _keyUp);
inputMagnitude = (_keyRight - _keyLeft != 0) || (_keyDown - _keyUp != 0);



var hSpeed = lengthdir_x(inputMagnitude * spd, inputDirection);
var vSpeed = lengthdir_y(inputMagnitude * spd, inputDirection);

/*show_debug_message({
	_keyLeft, 
	_keyRight, 
	_keyUp, 
	_keyDown, 
	inputDirection, 
	inputMagnitude, 
	spd,
	hSpeed,
	vSpeed
});*/

if(hSpeed != 0) {
	//x += hSpeed;
	moving = true;
}

if(vSpeed != 0) {
	//y += vSpeed;
	moving = true;
}

move_and_collide(hSpeed, vSpeed, collisionMap);

if(moving) {

    moveAngle = point_direction(0, 0, hSpeed, vSpeed);
	
}

addDebugVariable("moveAngle", moveAngle);
addDebugVariable("moving", moving);
addDebugVariable("spriteOffset", spriteOffset);

var _camera = view_camera[0];
//var _currentCameraWidth = camera_get_view_width(_camera);
// var _currentCameraHeight = camera_get_view_height(_camera);

if(currentCameraWidth != cameraWidth || currentCameraHeight != cameraHeight) {
	if(timer > 0) {
		var _percent = 1 - timer / maxTimer
		var _newWidth = lerp(currentCameraWidth, cameraWidth,  _percent);	
		var _newHeight = lerp(currentCameraHeight, cameraHeight,  _percent);	
		
		/*show_debug_message({
			_newWidth,
			_newHeight, 
			currentCameraWidth,  
			currentCameraHeight,  
			cameraWidth, 
			cameraHeight, 
			timer,
			_percent
		});*/
		
		camera_set_view_size(_camera, _newWidth, _newHeight);
		camera_set_view_border(_camera, _newWidth * 0.5, _newHeight * 0.5);
	} else {
		camera_set_view_size(_camera, cameraWidth, cameraHeight);
		camera_set_view_border(_camera, cameraWidth * 0.5, cameraHeight * 0.5);
		currentCameraHeight = cameraHeight;
		currentCameraWidth = cameraWidth;
	}
}

audio_listener_position(x, y, 0);