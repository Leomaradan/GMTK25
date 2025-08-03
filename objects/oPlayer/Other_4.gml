displayBars();

var _placed = false;

var _newX = ROOM_SIZE * 0.5;
var _newY = ROOM_SIZE * 0.5;

while(!_placed) {
		
		_newX = random_range(200, ROOM_SIZE - 200);
		_newY = random_range(200, ROOM_SIZE - 200);
		
		show_debug_message("check position {0}/{1}", _newX, _newY);
		
		var _valid = true;
			
		if(place_meeting(_newX, _newY, collisionMap)) {
			show_debug_message("position {0}/{1} is invalid", _newX, _newY);
			_valid = false;
		}
		
		if(_valid) {
			_placed = true;
		}
        
}




x = floor(_newX);
y = floor(_newY);

audio_listener_position(x, y, 0);

initializeLevel(x, y);
createInstances(state);
setupBirds(state);
spawnObjects(x, y, cameraWidth, cameraHeight, state, true);

if(layer_exists(LAYER_COLLISIONS)) {
	layer_set_visible(LAYER_COLLISIONS, false);
}