event_inherited();

sprite_index = sClosedDoor;

inspect_move = true;

//Text Event
useless_text = noone;
useless_text[0, 0] = "It's locked.";
useless_text[0, 1] = x;
useless_text[0, 2] = y;
useless_text[0, 3] = c_white;

useless_text[1, 0] = "Shit...";
useless_text[1, 1] = x;
useless_text[1, 2] = y;
useless_text[1, 3] = c_white;

move_x = 60;
move_y = 165;