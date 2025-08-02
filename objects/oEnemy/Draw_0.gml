
draw_sprite_ext(
	moving ? spriteMove : spriteIdle, 
	image_index, 
	floor(x), 
	floor(y- z), 
	1, 
	1, 
	moveAngle + spriteOffset, 
	c_white, 
	spriteOpacity
)

draw_line(x, y, targetX, targetY);