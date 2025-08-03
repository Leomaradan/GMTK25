if(!place_meeting(oPlayer.x, oPlayer.y, oLeafProtection)) {
	oPlayer.dead = true;
	oGame.gameOverText = deathMessage;
}


