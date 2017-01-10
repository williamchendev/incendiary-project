///Init

//Settings
item = 0;
item_stack = 1;

action = instance_create_layer(x, y, layer_get_id("Action_Layer"), oAction);
action.action_type = 1;

selected = false;

can_pick = true;
pick_up = false;
put_down = true;
event = 0;

//Text Event
type = 0;
text_font = RegularFont;
text_spd = 0.35;
no_room_text = "My pockets are full right now...";
text_displace_y = 50;

pick_up_text = noone;
pick_up_text[0, 0] = "...";
pick_up_text[0, 1] = x;
pick_up_text[0, 2] = y;
pick_up_text[0, 3] = c_white;

pick_up_text[1, 0] = "...";
pick_up_text[1, 1] = x;
pick_up_text[1, 2] = y;
pick_up_text[1, 3] = c_white;

pick_up_text[2, 0] = "...";
pick_up_text[2, 1] = x;
pick_up_text[2, 2] = y;
pick_up_text[2, 3] = c_white;

put_down_text = noone;
put_down_text[0, 0] = "...";
put_down_text[0, 1] = x;
put_down_text[0, 2] = y;
put_down_text[0, 3] = c_white;

put_down_text[1, 0] = "...";
put_down_text[1, 1] = x;
put_down_text[1, 2] = y;
put_down_text[1, 3] = c_white;

put_down_text[2, 0] = "...";
put_down_text[2, 1] = x;
put_down_text[2, 2] = y;
put_down_text[2, 3] = c_white;

move_x = x;
move_y = y - 3;

