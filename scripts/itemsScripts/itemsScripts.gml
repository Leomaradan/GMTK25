levelItemsGrid = ds_grid_create(ROOM_SIZE, ROOM_SIZE); // This grid is only used to check value positions
levelItems = ds_list_create();


function initializeLevel() {
	var _numberLeaf = 200;
	var _numberLeafProtection = 50;
	var _numberFlower = 100;
	var _numberFlowerSpider = 25;
	var _numberWasp = 20;
	var _numberBird = 20;
	var _numberBeetle = 40;
	
	addToPosition(oLeaf, _numberLeaf, GameplayState.CATERPILLAR, LAYER_BONUS);
	//addToPosition(oWasp, _numberWasp, GameplayState.CATERPILLAR, LAYER_ENEMY);
	//addToPosition(oBeetle, _numberBeetle, GameplayState.CATERPILLAR, LAYER_ENEMY);
	
	addToPosition(oFlower, _numberFlower, GameplayState.BUTTERFLY, LAYER_BONUS);
	addToPosition(oFlowerSpider, _numberFlowerSpider, GameplayState.BUTTERFLY, LAYER_BONUS);
	//for()
}

function createInstances(_gameplayState) {
	for(var _i = 0; _i < ds_list_size(global.levelItems); _i++) {
		var _ref = ds_list_find_value(global.levelItems, _i);
		if(_ref.state == _gameplayState) {
			var _instance = (instance_create_layer(_ref.x, _ref.y, _ref.layer, _ref.obj));		
		
			instance_deactivate_object(_instance);
		}
	}
}

function spawnObjects(_x, _y, _viewportWidth, _viewportHeight, _playerState) {
	// Calculate the 4 zone around the viewport
	// zone 1 = upper
	// zone 2 = left
	// zone 3 = right
	// zone 4 = lower
	var _zone1and4HalfWidth = (_viewportWidth * 0.5) + _viewportWidth;
	var _gameplayState = getGameplayState(_playerState);
	//var _zonesHeight = (_viewportHeight * 0.5) + _viewportHeight;
	
	var _zoneX1 = _x - _zone1and4HalfWidth;
	var _zoneX2 = _x + _zone1and4HalfWidth;
	
	var _zoneY1 = _y - (_viewportHeight * 0.5) - _viewportHeight;
	var _zoneY2 = _y + (_viewportHeight * 0.5) + _viewportHeight;
	
	instance_activate_region(_zoneX1, _zoneY1, _viewportWidth * 3, _viewportHeight * 3, true);
	instance_deactivate_region(_zoneX1, _zoneY1, _viewportWidth * 3, _viewportHeight * 3, false, true);
	instance_activate_object(oPlayer);
	instance_activate_object(oGame);

}

function createBird(_gameplayState) {
	if(_gameplayState == GameplayState.CATERPILLAR) {
		
		for(var _i = 0; _i < 10; _i++) {
			instance_create_layer(0, 0, LAYER_ENEMY, oBirdCaterpillar);		
		}
		

	}
}

function cleanupPhaseObjects(_playerState) {
	var _gameplayState = getGameplayState(_playerState);
	switch(_gameplayState) {
		case GameplayState.BUTTERFLY:
				instance_activate_object(oWasp);				
				instance_activate_object(oBeetle);
				instance_activate_object(oBirdCaterpillar);

				instance_destroy(oWasp);				
				instance_destroy(oBeetle);				
				instance_destroy(oBirdCaterpillar);	
				break;
		case GameplayState.CATERPILLAR:
				// Nothing for the moment		
				break;
		case GameplayState.COCOON:
				instance_activate_object(oLeaf);				
				
				instance_destroy(oLeaf);				
			
				break;				
		case GameplayState.EGGS:
				instance_activate_object(oFlower);
				instance_activate_object(oFlowerSpider);
				instance_activate_object(oButterflyReproduction);
				instance_destroy(oFlower);
				instance_destroy(oFlowerSpider);
				instance_destroy(oButterflyReproduction);
				break;				

	}
	
	createInstances(_gameplayState);

}


function addToPosition(_obj, _count, _state, _layer) {
	
	var _i = 0;
	while(_i < _count) {
		var _posX =  round(random_range(10, room_width - 10));
		var _posY =  round(random_range(10, room_height - 10));
		
		if(!ds_grid_value_exists(global.levelItemsGrid, _posX - 64, _posY - 64, _posX + 64, _posY + 64, "obj")) {
			ds_grid_add(global.levelItemsGrid, _posY, _posY, "obj");
			ds_list_add(global.levelItems, {x: _posX, y: _posY, obj: _obj, state: _state, layer: _layer });
			
			_i++;
		}
	}

}

