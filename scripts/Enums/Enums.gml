#macro DEBUG true
#macro FPS 60
#macro WIDTH_BUTTERFLY 800
#macro WIDTH_CATERPILLAR 600
#macro HEIGHT_BUTTERFLY 600
#macro HEIGHT_CATERPILLAR 400

#macro TIMER_PHASE 30 * FPS
#macro TIMER_INTERPHASE 5 * FPS

#macro LIFE_BUTTERFLY 65 * FPS
#macro LIFE_CATERPILLAR 30 * FPS

#macro SPEED_CATERPILLAR 5
#macro SPEED_BUTTERFLY 10
#macro SPEED_BUTTERFLY_EGGS 9

enum PlayerState {
	CATERPILLAR = 0,
	COCOON = 1,
	BUTTERFLY_1 = 2,
	BUTTERFLY_REPRO = 3,
	BUTTERFLY_2 = 4,
	EGGS = 5,
	DEATH_CATERPILLAR = 6,
	DEATH_COCOON = 7,
	DEATH_BUTTERFLY = 8,
	DEATH_EGGS = 9
}

enum GameplayState {
	CATERPILLAR = 0,
	COCOON = 1,
	BUTTERFLY = 2,
	EGGS = 3
}

function getGameplayState(_playerState) {
	switch(_playerState) {
		case PlayerState.BUTTERFLY_1:	
		case PlayerState.BUTTERFLY_2:	
		case PlayerState.BUTTERFLY_REPRO:	
		case PlayerState.DEATH_BUTTERFLY:	
			return GameplayState.BUTTERFLY;
		case PlayerState.CATERPILLAR:
		case PlayerState.DEATH_CATERPILLAR:
			return GameplayState.CATERPILLAR;
		case PlayerState.COCOON:
		case PlayerState.DEATH_COCOON:
			return GameplayState.COCOON;
		case PlayerState.EGGS:
		case PlayerState.DEATH_EGGS:
			return GameplayState.EGGS;			
	}
}