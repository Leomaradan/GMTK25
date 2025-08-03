frame = 1;
gameScore = 0;

// room_set_camera(rLevel, 0, 0);

global.debugVariables = [];

audio_play_sound(music, 10, true, 0.3);
audio_falloff_set_model(audio_falloff_linear_distance);