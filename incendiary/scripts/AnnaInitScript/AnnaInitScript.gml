///AdventureInitScript();

//Init
layer = layer_get_id("Player_Layer");
ControlScript();

//Paths
path = path_add();
grid = noone;

anna_x = x;
anna_y = y;

canmove = true;
moving = false;
walking = false;
stand_still = false;

move_x = x;
move_y = y;

//Settings
camera_type = 0;
gui_access = true;

//Variables
sprite_index = sAnna;

sin_val = 0;

spd = 1;
item = -1;

cutscene = false;
cutscene_y = 0;
cutscene_x = 0;
view_set_x = 0;
view_set_y = 0;
camera_speed = 0.06;

light = false;
visibility = 1;

gui = false;
gui_circle_length = 38;
combo_slot1 = -1;
combo_slot2 = -1;
combo_item = -1;
action_timer = -1;
action_wait = 90;
pick = false;
end_pick = false;

ammo = 0;
maxammo = 6;
ammoload = false;
shoot = false;
shoot_aim = 60;
reload = false;
reload_alpha = 0;
recoil = 0;

throw = false;
inside_throw_distance = false;
outside_throw_distance = false;
canthrow1 = false;
canthrow2 = false;
surface_arc_1 = surface_create(room_width, room_height);
surface_arc_2 = surface_create(room_width, room_height);

drop = false;
drop_start = true;

gungui_alpha = 0;
item_text_surface = surface_create(room_width, room_height);

//Inventory
item_slot = noone;
for (i = 0; i < 12; i++){
    item_slot[i] = instance_create_layer(x, y, layer_get_id("GUI_Layer"), oInventorySlot);
	item_slot[i].sin_val = (1 / 12) * (11 - i);
	//item_slot[i].item = i;
}
item_slot[0].item = 15;

item_slot[3].item = 6;
item_slot[4].item = 7;
item_slot[5].item = 6;
item_slot[6].item = 7;

item_slot[7].item = 1;
item_slot[8].item = 1;
item_slot[9].item = 1;
item_slot[10].item = 1;

//Clamp Screen
var view_x = x - 240 + (image_xscale * 12);
var view_y = y - 135;

camera_set_view_pos(view_camera[0], clamp(view_x, 0, room_width - 480), clamp(view_y, 0, room_height - 270));