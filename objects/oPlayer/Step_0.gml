var _keyLeft = InputCheck(INPUT_VERB.LEFT);
var _keyRight = InputCheck(INPUT_VERB.RIGHT);
var _keyUp = InputCheck(INPUT_VERB.UP);
var _keyDown = InputCheck(INPUT_VERB.DOWN);

var _mousePress = InputMouseCheck(mb_left);

moving = false;

inputDirection = 0;
inputMagnitude = 0;

if(_keyDown || _keyUp || _keyLeft || _keyRight) {

	inputDirection = point_direction(0, 0, _keyRight - _keyLeft, _keyDown - _keyUp);
	inputMagnitude = (_keyRight - _keyLeft != 0) || (_keyDown - _keyUp != 0);

} else if(_mousePress) {
	var _pressedX = InputMouseGuiX();	
	var _pressedY = InputMouseGuiY();	
	
	
	inputDirection = point_direction(display_get_gui_width() * 0.5, display_get_gui_height()* 0.5, _pressedX, _pressedY);
	inputMagnitude = 1;
	
}


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