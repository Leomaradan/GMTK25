function displayBars() {
	var _uiLayer = layer_get_flexpanel_node("UILayer_1");
	
	var _lifeBar = flexpanel_node_get_child(_uiLayer, "HealthBar");
	var _energyBar = flexpanel_node_get_child(_uiLayer, "EnergyBar");
	var _timerBar = flexpanel_node_get_child(_uiLayer, "TimerBar");	

	flexpanel_node_style_set_display(_uiLayer, flexpanel_display.flex);
	flexpanel_node_style_set_display(_lifeBar, flexpanel_display.flex);
	flexpanel_node_style_set_display(_energyBar, flexpanel_display.flex);
	flexpanel_node_style_set_display(_timerBar, flexpanel_display.flex);
	


}

function hideBars() {
	var _uiLayer = layer_get_flexpanel_node("UILayer_1");
	
	var _lifeBar = flexpanel_node_get_child(_uiLayer, "HealthBar");
	var _energyBar = flexpanel_node_get_child(_uiLayer, "EnergyBar");
	var _timerBar = flexpanel_node_get_child(_uiLayer, "TimerBar");	

	flexpanel_node_style_set_display(_uiLayer, flexpanel_display.none);
	flexpanel_node_style_set_display(_lifeBar, flexpanel_display.none);
	flexpanel_node_style_set_display(_energyBar, flexpanel_display.none);
	flexpanel_node_style_set_display(_timerBar, flexpanel_display.none);
	
}

function drawTitle(_text, _height = 0.5, _shadow = true) {
	_drawText(fTitle, _text, room_width * 0.5, room_height * _height, _shadow, 5);	
}

function drawText(_text, _height = 0.5, _shadow = true) {
	_drawText(fText, _text, room_width * 0.5, room_height * _height, _shadow, 3);	
}

function drawTextCorner(_text, _shadow = true) {
	
	var _width = display_get_gui_width() - 15;
	var _height = display_get_gui_height() - 15;
	
	draw_set_font(fText);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	
	if(_shadow) {
		draw_set_color(c_black);

		draw_set_alpha(0.5);
		draw_text(_width, _height + 3, _text);	
		draw_set_alpha(1);
	}
	
	draw_set_color(c_white);

	draw_text(_width, _height, _text);		
	
}


function _drawText(_font, _text, _width, _height, _shadow, _shadowDistance) {
	draw_set_font(_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	if(_shadow) {
		draw_set_color(c_black);

		draw_set_alpha(0.5);
		draw_text(_width, _height + _shadowDistance, _text);	
		draw_set_alpha(1);
	}
	
	draw_set_color(c_white);

	draw_text(_width, _height, _text);	
}