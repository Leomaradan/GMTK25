draw_self();

// draw_sprite_stretched(sprite_index, image_index, x, y, 64, 64);


if(instance_exists(oButterflyReproduction)) {

	var _arrowAngle = point_direction(x, y, oButterflyReproduction.x, oButterflyReproduction.y);

	var _arrowDistance = 40;

	// Position of the arrow
	var _arrowX = x + lengthdir_x(_arrowDistance, _arrowAngle);
	var _arrowY = y + lengthdir_y(_arrowDistance, _arrowAngle);

	// Optional: Draw a custom arrow shape
	//draw_set_color(c_red);
	// draw_arrow(x, y, oTarget.x, oTarget.y, false); // for debug

	// Draw the arrow pointing to the target
	draw_sprite_ext(sArrow, 0, _arrowX, _arrowY, 1, 1, _arrowAngle, c_white, 1);
}