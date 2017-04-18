event_inherited();

sprite_index = sChurchConfession;

inspect_move = true;

//Text Event
useless_text = noone;
useless_text[0, 0] = "...";
useless_text[0, 1] = x;
useless_text[0, 2] = y;
useless_text[0, 3] = c_white;

useless_text[1, 0] = "Later";
useless_text[1, 1] = x;
useless_text[1, 2] = y;
useless_text[1, 3] = c_white;

move_x = x - 64;
move_y = y + 8;