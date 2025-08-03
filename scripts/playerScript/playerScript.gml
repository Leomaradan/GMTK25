function noLifeLeft() {
	with(oPlayer) {
		var reason = "no life";

		switch(state) {
			case PlayerState.BUTTERFLY_1:			
			case PlayerState.BUTTERFLY_2:			
			case PlayerState.BUTTERFLY_REPRO:

				changeState(PlayerState.DEATH_BUTTERFLY, reason);
				break;
				
			case PlayerState.CATERPILLAR:			

				changeState(PlayerState.DEATH_CATERPILLAR, reason);
				break;			
			case PlayerState.COCOON:			

				changeState(PlayerState.DEATH_COCOON, reason);
				break;		
			case PlayerState.EGGS:			

				changeState(PlayerState.DEATH_EGGS, reason);
				break;				
				
		}	
	}
}

function hasMaxEnergy() {
	with(oPlayer) {
		var reason = "max energy";
		switch(state) {
			case PlayerState.BUTTERFLY_2:	
				if(reproduction) {
					changeState(PlayerState.EGGS, reason);
				} else {
					dead = true;
					oGame.gameOverText = "You forget to mate";	
					changeState(PlayerState.DEATH_BUTTERFLY, reason);
				}
				break;				
			case PlayerState.CATERPILLAR:			
				changeState(PlayerState.COCOON, reason);
				break;			
		
			case PlayerState.EGGS:			
				changeState(PlayerState.CATERPILLAR, reason);
				break;					
				
		}	
	}
}

function timerEnded() {
	with(oPlayer) {
		var reason = "timer end";
		switch(state) {
			case PlayerState.BUTTERFLY_1:		
				// summon other butterfly
				changeState(PlayerState.BUTTERFLY_REPRO, reason);	
				
				break;
				
			case PlayerState.BUTTERFLY_REPRO:		
				// summon other butterfly
				//if(!reproduction) {
				//	changeState(PlayerState.DEATH_BUTTERFLY, reason)
				//} else {
				changeState(PlayerState.BUTTERFLY_2, reason)
				//}

				break;						
			case PlayerState.COCOON:			
				changeState(PlayerState.BUTTERFLY_1, reason);
				
				break;		
			case PlayerState.EGGS:			
				changeState(PlayerState.CATERPILLAR, reason);
				break;					
				
		}	
	}
}

function changeState(newState, reason) {
	with(oPlayer) {
		
		show_debug_message("switching state {0} to {1} because {2}", getPlayerStateName(state), getPlayerStateName(newState), reason);

		cleanupPhaseObjects(newState);
		spawnObjects(x, y, cameraWidth, cameraHeight, newState);

		switch(newState) {
			case PlayerState.BUTTERFLY_1:
				removeLife = true;
				spd = SPEED_BUTTERFLY;
				timer = TIMER_PHASE;				
				maxTimer = TIMER_PHASE;
				energy = 0;
				life = LIFE_BUTTERFLY;
				maxLife = LIFE_BUTTERFLY;
				currentCameraHeight = cameraHeight;
				currentCameraWidth = cameraWidth;
				//sprite_index = sPlayerButterfly;
				sprites = [sButterflyIdle, sButterflyMove, sButterflyShadow, 240];
				spriteOffset = 0;
				spriteRotate = true;
				oGame.gameScore += (TIMER_INTERPHASE / FPS);
				audio_play_sound(sfxReproduce, 1, false);
				setupBirds(newState);
				
				
				break;
				
			case PlayerState.BUTTERFLY_REPRO:
				removeLife = true;
				timer = TIMER_REPRODUCTION;
				maxTimer = TIMER_REPRODUCTION;
				spawnOtherButterfly();
				
				break;	
				
			case PlayerState.BUTTERFLY_2:
				removeLife = true;
				spd = SPEED_BUTTERFLY_EGGS;
				timer = -1;	
				maxTimer = 0;
				
				break;	
				
			case PlayerState.CATERPILLAR:
				currentCameraHeight = cameraHeight;
				currentCameraWidth = cameraWidth;			
				removeLife = true;
				spd = SPEED_CATERPILLAR;
				timer = -1;
				maxTimer = 0;
				energy = 0;
				life = LIFE_CATERPILLAR;
				maxLife = LIFE_CATERPILLAR;
				// sprite_index = sPlayerCaterpilarHorizontal;
				sprites = [sCaterpillarIdle, sCaterpillarMove, sCaterpillarShadow, 15];
				spriteOffset = -90;
				spriteRotate = true;
				oGame.gameScore += (TIMER_INTERPHASE / FPS);
				setupBirds(newState);
				audio_play_sound(sfxReproduce, 1, false);
				break;	
				
			case PlayerState.COCOON:
				removeLife = false;
				spd = 0;
				timer = TIMER_INTERPHASE;
				maxTimer = TIMER_INTERPHASE;
				energy = 0;
				life = LIFE_CATERPILLAR;
				maxLife = LIFE_CATERPILLAR;
				cameraWidth = WIDTH_BUTTERFLY;
				cameraHeight = HEIGHT_BUTTERFLY;
				// sprite_index = sPlayerCocoon;
				sprites = [sPlayerCocoon, sPlayerCocoon, noone];
				spriteOffset = 0;
				spriteRotate = false;
				// instance_destroy(oBonus);
				oGame.gameScore += (LIFE_CATERPILLAR / FPS);
				audio_play_sound(sfxReproduce, 1, false);
				
				break;			
				
			case PlayerState.DEATH_BUTTERFLY:			
			case PlayerState.DEATH_CATERPILLAR:
			case PlayerState.DEATH_COCOON:
			case PlayerState.DEATH_EGGS:
			
				audio_play_sound(sfxDeath, 10, false);
				instance_activate_all();
				instance_destroy(oWasp);
				instance_destroy(oBeetle);
				instance_destroy(oBird);
				instance_destroy(oLeaf);
				instance_destroy(oFlower);
				instance_destroy(oFlowerSpider);
				instance_destroy(oButterflyReproduction);
				instance_destroy(oLeafProtection);
				
				// oGame.gameScore += (energy * FPS);
				room_goto_next();
				// removeLife = false;
				// spd = 0;
				// timer = -1;
				// maxTimer = 0;
				// energy = 0;
				// dead = true;
				
				break;			
				
			case PlayerState.EGGS:
				removeLife = false;
				spd = 0;
				timer = TIMER_INTERPHASE;
				maxTimer = TIMER_INTERPHASE;
				energy = 0;
				life = LIFE_CATERPILLAR;
				maxLife = LIFE_CATERPILLAR;
				cameraWidth = WIDTH_CATERPILLAR;
				cameraHeight = HEIGHT_CATERPILLAR;				
				// sprite_index = sPlayerEggs;
				sprites = [sPlayerEggs, sPlayerEggs, noone];
				spriteOffset = 0;
				spriteRotate = false;				
				// instance_destroy(oBonus);
				oGame.gameScore += (LIFE_BUTTERFLY / FPS);
				audio_play_sound(sfxReproduce, 1, false);
		
				
				break;					
				
		}
		
		sprite_index = sprites[0];
		
		state = newState;
	}	
}

function spawnOtherButterfly() {
// (x, y, cameraWidth, cameraHeight, state);
	// zone 1 = upper
	// zone 2 = left
	// zone 3 = right
	// zone 4 = lower
	var _zone1and4HalfWidth = (cameraWidth * 0.5) + cameraWidth;
	
	//var _zonesHeight = (_viewportHeight * 0.5) + _viewportHeight;
	
	var _zoneX1 = x - _zone1and4HalfWidth;
	var _zoneX2 = x + _zone1and4HalfWidth;
	
	var _zoneY1 = y - (cameraHeight * 0.5) - cameraHeight;
	var _zoneY2 = y + (cameraHeight * 0.5) + cameraHeight;
	
	var _x = random_range(_zoneX1, _zoneX2);
	var _y = random_range(_zoneY1, _zoneY2);
	
	instance_create_layer(_x, _y, LAYER_PLAYER, oButterflyReproduction);
	

}