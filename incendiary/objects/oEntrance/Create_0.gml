///Init

action = instance_create_layer(x, y, layer_get_id("Action_Layer"), oAction);
action.action_type = 4;

selected = false;

inspecting = false;
useful = false;
inspect_event = false;
event = 0;

//Text Event
type = 0;
text_spd = 0.35;
text_font = RegularFont;
text_displace_y = 50;

inspect_text = noone;
inspect_text[0, 0] = "...";
inspect_text[0, 1] = x;
inspect_text[0, 2] = y;
inspect_text[0, 3] = c_white;

inspect_text[1, 0] = "...";
inspect_text[1, 1] = x;
inspect_text[1, 2] = y;
inspect_text[1, 3] = c_white;

inspect_text[2, 0] = "...";
inspect_text[2, 1] = x;
inspect_text[2, 2] = y;
inspect_text[2, 3] = c_white;

useless_text = noone;
useless_text[0, 0] = "...";
useless_text[0, 1] = x;
useless_text[0, 2] = y;
useless_text[0, 3] = c_white;

useless_text[1, 0] = "...";
useless_text[1, 1] = x;
useless_text[1, 2] = y;
useless_text[1, 3] = c_white;

useless_text[2, 0] = "...";
useless_text[2, 1] = x;
useless_text[2, 2] = y;
useless_text[2, 3] = c_white;

move_x = x;
move_y = y + (sprite_height / 2);

