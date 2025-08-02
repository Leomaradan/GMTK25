// states:
// 0 = caterpilar
// 1 = cocoon
// 2 = butterfly 1
// 3 = butterfly reproduction
// 4 = butterfly 2
// 5 = death/eggs

spd = 5;
maxEnergy = 100 * FPS;
state = PlayerState.CATERPILLAR;
energy = 0;
life = 30 * FPS; // 30 life = 30s
maxLife = 30 * FPS;
timer = -1; // timer for butterfly event
maxTimer = 0;

reproduction = false;
dead = false;
removeLife = true;
moving = false;

cameraWidth = camera_get_view_width(view_camera[0]);
cameraHeight = camera_get_view_height(view_camera[0]);
currentCameraWidth = cameraWidth;
currentCameraHeight = cameraHeight;

inputDirection = 0;
inputMagnitude = 0;

initializeLevel();
createInstances(state);
spawnObjects(x, y, cameraWidth, cameraHeight, state);
