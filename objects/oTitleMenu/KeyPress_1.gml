if(!audio_is_playing(music)) {
	// Browser cannot play music on startup, so ensure it is triggered here
	audio_play_sound(music, 10, true, 0.3);
}



room_goto_next();