var _lifePercent =  (life / maxLife) * 100;
var _energyPercent =  (energy / maxEnergy) * 100;
var _timerPercent =  100 - ((timer / maxTimer) * 100);

var _uiLayer = layer_get_flexpanel_node("UILayer_1");

var _lifeBar = flexpanel_node_get_child(_uiLayer, "HealthBar");
var _energyBar = flexpanel_node_get_child(_uiLayer, "EnergyBar");
var _timerBar = flexpanel_node_get_child(_uiLayer, "TimerBar");

flexpanel_node_style_set_width(_lifeBar, _lifePercent, flexpanel_unit.percent);
flexpanel_node_style_set_width(_energyBar, _energyPercent, flexpanel_unit.percent);

if(timer > 0) {
	
	flexpanel_node_style_set_width(_timerBar, _timerPercent, flexpanel_unit.percent);
	//draw_healthbar(0, 64, display_get_gui_width, 96, (timer / maxTimer) * 100, c_black, c_blue, c_blue, 0, false, false);
} else {
	
	flexpanel_node_style_set_width(_timerBar, 0, flexpanel_unit.percent);
}

addDebugVariable("_lifePercent", _lifePercent);
addDebugVariable("_energyPercent", _energyPercent);
addDebugVariable("_timerPercent", _timerPercent);



// show_debug_message({_lifePercent, _energyPercent, _timerPercent});



