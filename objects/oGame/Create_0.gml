randomize();

frame = 1;
gameScore = 0;

// room_set_camera(rLevel, 0, 0);

global.debugVariables = [];

switch (os_browser) {
    case browser_not_a_browser:
        switch (os_type) {
            case os_windows:
            case os_macosx:
                audio_channel_num(200);
            break;

            default:
                audio_channel_num(64);
            break;
        }
    break;

    default:
        audio_channel_num(16);
    break;
}

audio_play_sound(music, 10, true, 0.3);
audio_falloff_set_model(audio_falloff_linear_distance);