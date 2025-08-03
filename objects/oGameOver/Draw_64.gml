

drawTitle("Game Over");
drawText(text, 0.75);

if(cooldown == 0) {
	
	var _floatOffset = sin(current_time * 0.003) * 0.03;
	
	drawText("Press any key to restart", 0.85 + _floatOffset);
}

