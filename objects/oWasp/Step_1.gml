var _distanceToPlayer = distance_to_object(oPlayer);

cooldown--;

if(_distanceToPlayer < 512 && oPlayer.moving) {
	targetX = oPlayer.x;
	targetY = oPlayer.y;
	cooldown = 0;
} else if(cooldown <= 0) {
	targetX = clamp(random_range(x - 512, x + 512), 256, 8000 - 256);
	targetY = clamp(random_range(y - 512, y + 512), 256, 8000 - 256);
	cooldown = 3 * FPS
}