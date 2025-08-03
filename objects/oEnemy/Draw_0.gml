
if(spriteShadow != noone) {
		
	draw_sprite_ext(
		spriteShadow, 
		image_index, 
		floor(x), 
		floor(y + spriteShadowOffset), 
		1, 
		1, 
		moveAngle + spriteOffset, 
		c_white, 
		spriteOpacity
	)	
}

if(moving) {
	draw_sprite_ext(
		spriteMove, 
		image_index, 
		floor(x), 
		floor(y- z), 
		1, 
		1, 
		moveAngle + spriteOffset, 
		c_white, 
		spriteOpacity
	)	
} else {
	
	draw_sprite_ext(
		spriteIdle, 
		image_index, 
		floor(x), 
		floor(y- z), 
		1, 
		1, 
		moveAngle + spriteOffset, 
		c_white, 
		spriteOpacity
	)
}

if(DEBUG) {
	draw_line(x, y, targetX, targetY);
}