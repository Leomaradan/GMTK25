if(used) {
	return;	
}

oPlayer.energy += (energyRefill * FPS);

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
