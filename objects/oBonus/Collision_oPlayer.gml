if(used) {
	return;	
}

oPlayer.energy += (energyRefill * FPS);
oGame.gameScore += energyRefill;

if(sfx != noone) {
	audio_play_sound(sfx, 10, false);
}

if(disabledSprite) {
	used = true;
	sprite_index = disabledSprite;
	
	var _item = ds_list_find_value(global.levelItems, ref);
	_item.used = true;
	
	ds_list_replace(global.levelItems, ref, _item);
} else {
	instance_destroy();
	ds_list_delete(global.levelItems, ref);
}
