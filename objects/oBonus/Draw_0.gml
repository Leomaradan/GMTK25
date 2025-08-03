if(spriteShadow != noone) {
	draw_sprite_ext(
		spriteShadow, 
		image_index, 
		floor(x), 
		floor(y + spriteShadowOffset), 
		1, 
		1, 
		image_angle,
		image_blend,
		image_alpha
	)	
}	

draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y- z), // z-height effect
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
);