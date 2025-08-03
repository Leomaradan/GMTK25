cooldown = 0;
targetX = 0;
targetY = 0;
inputDirection = 0;
moving = false;
moveAngle = 0;
z = 0;
depthstart = depth;

audioEmitter = audio_emitter_create();
audioMaxDistance = 1000;
audioDrop = 100;
audioPlayed = -1;

audio_emitter_position(audioEmitter, x, y, 0);
audio_emitter_falloff(audioEmitter, audioDrop, audioMaxDistance, 1);

//audio_play_sound_at(sfxWasp, x, y, 0, 100, 300, 1, true, 1);
//audio_play_sound(sfxWasp)