audio_emitter_free(audioEmitter);

if(sfx != noone && audioPlayed != -1) {
	audio_stop_sound(audioPlayed);
}