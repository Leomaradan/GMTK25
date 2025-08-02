/// @func addDebugVariable(name, value) Add a variable to the debug output for the current step
/// @param {string} name Name of the variable
/// @param {any} value Value to display
function addDebugVariable(name, value) {
	array_push(global.debugVariables, [name, value]);
}

function showDebugGUI(element, index)
{
	// Get the current camera position
	var _cam = view_camera[0];
	var _x = camera_get_view_x(_cam);
	var _y = camera_get_view_y(_cam);
	
	var _name = element[0];
	var _value = element[1];
	
	// Prepare the text
	var _text = _name + ": " + string(_value);
	
	// Calculate the vertical position, to not overlapping other texts
	var _position = _y + (index * 10) + 24;
	
	// Ensuring the color and font here
	draw_set_color(c_white);
	draw_set_font(fText);	
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	
	// Draw the message
	draw_text(_x + 5, _position, _text);
	
}

function getPlayerStateName(_state) {
	switch(_state) {
		case PlayerState.BUTTERFLY_1: return "BUTTERFLY_1"	;
		case PlayerState.BUTTERFLY_2: return "BUTTERFLY_2"	;
		case PlayerState.BUTTERFLY_REPRO: return "BUTTERFLY_REPRO"	;
		case PlayerState.CATERPILLAR: return "CATERPILLAR"	;
		case PlayerState.COCOON: return "COCOON"	;
		case PlayerState.DEATH_BUTTERFLY: return "DEATH_BUTTERFLY"	;
		case PlayerState.DEATH_CATERPILLAR: return "DEATH_CATERPILLAR"	;
		case PlayerState.DEATH_COCOON: return "DEATH_COCOON"	;
		case PlayerState.DEATH_EGGS: return "DEATH_EGGS"	;
		case PlayerState.EGGS: return "EGGS"	;

	}
}