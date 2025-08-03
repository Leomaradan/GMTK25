/*show_debug_message("event_type: {0}", event_data[? "event_type"])

if (event_data[? "event_type"] == "sprite event") // or you can check "sprite event"
{
	
	show_debug_message("message: {0}", event_data[? "message"])
    switch (event_data[? "message"])
    {
        case "walk":
            audio_play_sound(sfxWalk, 0, false);
        break;

        case "destroy":
            sequence_destroy(event_data[? "element_id"]);
        break;
    }
}*/