// switch state if condition are validated
if(dead) {
	return; // Early return	
}

if(!instance_exists(oGame)) {
	return;	
}

addDebugVariable("frame", oGame.frame);
addDebugVariable("state", getPlayerStateName(state));
addDebugVariable("life", life);
addDebugVariable("energy", energy);
addDebugVariable("timer", timer);

if(removeLife) {
	life--;
}

if(timer > 0) {
	timer--;	
}

if(oGame.frame == 0) {
	//life--;	
	
	spawnObjects(x, y, cameraWidth, cameraHeight, state);
	

}



var _isDead = life <= 0;
var _isTimeout = timer == 0;
var _isMaxEnergy = energy >= maxEnergy;

if(_isDead) {
	noLifeLeft();	
} else if(_isTimeout) {
	timerEnded();
} else if(_isMaxEnergy) {
	hasMaxEnergy();	
}

