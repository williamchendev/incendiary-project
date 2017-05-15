/// @description Init

layer = layer_get_id("Solids_Layer");
action = instance_create_layer(x, y, layer_get_id("Action_Layer"), oAction);

//Settings
room_type = title_screen;
action.action_type = 4;
action_height = 42;
transition_type = -1;

active = true;
click = true;

move_x = x;
move_y = y;

//Variables
trans_obj = noone;
touch = false;
previous_room = room;
selected = false;

//Anna Data
anna_items = noone;
anna_ammo = noone;
anna_shoot = noone;