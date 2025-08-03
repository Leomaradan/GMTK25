// levelItemsGrid = ds_grid_create(ROOM_SIZE, ROOM_SIZE); // This grid is only used to check value positions
levelItems = ds_list_create();


function initializeLevel(_playerX, _playerY) {
	
	ds_list_clear(global.levelItems);
	// ds_grid_clear(global.levelItemsGrid, "");	
	
	var _positionsCaterpillar = [[_playerX, _playerY]];
	var _positionsButterfly = [[_playerX, _playerY]];
	
	var _numberLeaf = 200;
	var _numberLeafProtection = 50;
	var _numberFlower = 100;
	var _numberFlowerSpider = 25;
	var _numberWasp = 20;
	var _numberBird = 20;
	var _numberBeetle = 40;
	
	_positionsCaterpillar = addToPosition(_positionsCaterpillar, oLeaf, _numberLeaf, GameplayState.CATERPILLAR, LAYER_BONUS, sprite_get_width(sLeaf), sprite_get_height(sLeaf));
	_positionsCaterpillar = addToPosition(_positionsCaterpillar, oLeafProtection, _numberLeafProtection, GameplayState.CATERPILLAR, LAYER_LEAF_PROTECTION, sprite_get_width(sLeafProtection), sprite_get_height(sLeafProtection));
	_positionsCaterpillar = addToPosition(_positionsCaterpillar, oWasp, _numberWasp, GameplayState.CATERPILLAR, LAYER_ENEMY, sprite_get_width(sWaspIdle), sprite_get_height(sWaspIdle));
	_positionsCaterpillar = addToPosition(_positionsCaterpillar, oBeetle, _numberBeetle, GameplayState.CATERPILLAR, LAYER_ENEMY, sprite_get_width(sBlackBeetleIdle), sprite_get_height(sBlackBeetleIdle));
	
	_positionsButterfly = addToPosition(_positionsButterfly, oFlower, _numberFlower, GameplayState.BUTTERFLY, LAYER_BONUS, 300, 300);
	_positionsButterfly = addToPosition(_positionsButterfly, oFlowerSpider, _numberFlowerSpider, GameplayState.BUTTERFLY, LAYER_BONUS, 300, 300);
	//for()
}

function createInstances(_gameplayState) {
	for(var _i = 0; _i < ds_list_size(global.levelItems); _i++) {
		var _ref = ds_list_find_value(global.levelItems, _i);
		if(_ref.state == _gameplayState) {
			var _instance = (instance_create_layer(_ref.x, _ref.y, _ref.layer, _ref.obj));		
		
			//instance_deactivate_object(_instance);
		}
	}
}

function spawnObjects(_x, _y, _viewportWidth, _viewportHeight, _playerState, _initial = false) {
	
}

function spawnObjects2(_x, _y, _viewportWidth, _viewportHeight, _playerState, _initial = false) {
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
	
	//if(_initial) {
	//	instance_deactivate_region(_x - (_viewportWidth * 0.5), _y - (_viewportHeight * 0.5), _viewportWidth, _viewportHeight, true);
	//}
	
	instance_activate_object(oPlayer);
	instance_activate_object(oGame);
	instance_activate_object(oBird);
	//instance_activate_object(oBirdButterfly);

}

function setupBirds(_gameplayState) {
	
	//var _existing = instance_find(oBird, all);
	
	var _count = instance_number(oBird);
	
	if(_count < BIRDS_COUNT) {
		for(var _i = _count; _i < BIRDS_COUNT; _i++) {
			instance_create_layer(0, 0, LAYER_ENEMY, oBird, {gameplayState: _gameplayState});		
		}
	}
	
	
	for (var _i = 0; _i < instance_number(oBird); ++_i;)
	{
	    var _bird = instance_find(oBird,_i);
		_bird.gameplayState = _gameplayState;
	}
}

function cleanupPhaseObjects(_playerState) {
	var _gameplayState = getGameplayState(_playerState);
	switch(_gameplayState) {
		case GameplayState.BUTTERFLY:
				instance_activate_object(oLeafProtection);					
				instance_activate_object(oWasp);				
				instance_activate_object(oBeetle);

				instance_destroy(oLeafProtection);				
				instance_destroy(oWasp);				
				instance_destroy(oBeetle);					
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


function addToPosition(_positions, _obj, _count, _state, _layer, _width, _height) {
	
	var _maxAttempts = 1000;
	var _attempts = 0;
	var _radius = max(_width * 0.5, _height * 0.5);
	
	var _i = 0;
	while(_i < _count && _attempts < _maxAttempts) {
		_attempts++;
		
		var _posX =  round(random_range(0 + _radius, room_width - _radius));
		var _posY =  round(random_range(0 + _radius, room_height - _radius));
		
		var _valid = true;
		
		
		for (var _j = 0; _j < array_length(_positions); _j++) {
            var _pos = _positions[_j];
            if (point_distance(_posX, _posY, _pos[0], _pos[1]) < (_radius * 2)) {
                _valid = false;
                break;
            }
			
			if(place_meeting(_posX, _posY, oPlayer.collisionMap)) {
				_valid = false;
                break;
			}
        }

        if (_valid) {
            ds_list_add(global.levelItems, {x: _posX, y: _posY, obj: _obj, state: _state, layer: _layer });
            array_push(_positions, [_posX, _posY]);
			_i++;
        }		
		
		

	}
	
	return _positions;

}

function addToPositionOld(_obj, _count, _state, _layer, _width, _height) {
	
	/*var _halfWidth = _width * 0.5;
	var _halfHeight = _height * 0.5;
	var _i = 0;
	while(_i < _count) {
		var _posX =  round(random_range(10, room_width - 10));
		var _posY =  round(random_range(10, room_height - 10));
		
		if(!ds_grid_value_exists(global.levelItemsGrid, _posX - _halfWidth, _posY - _halfHeight, _posX + _halfWidth, _posY + _halfHeight, "obj")) {
			// ds_grid_add(global.levelItemsGrid, _posY, _posY, "obj");
			ds_grid_add_region(global.levelItemsGrid, _posX - _halfWidth, _posY - _halfHeight, _posX + _halfWidth, _posY + _halfHeight, "obj");
			ds_list_add(global.levelItems, {x: _posX, y: _posY, obj: _obj, state: _state, layer: _layer });
			
			_i++;
		}
	}*/

}

