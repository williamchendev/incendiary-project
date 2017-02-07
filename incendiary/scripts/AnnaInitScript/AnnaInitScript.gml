///AdventureInitScript();

//Init
/*
global.debug = false;
global.escape_game = -1;
global.music_vol = 0;
global.sfx_vol = 0;
global.dog_fluff = 0;
*/

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
sprite_index = sAnna;

sin_val = 0;

spd = 1;
item = -1;
item_stack = -1;

cutscene = false;
cutscene_y = 0;
cutscene_x = 0;
view_set_x = 0;
view_set_y = 0;
camera_speed = 0.06;

gui = false;
gui_circle_length = 38;
combo_slot1 = -1;
combo_slot2 = -1;
combo_item = -1;

ammo = 5;
ammoloaded = 0;

throw = false;
inside_throw_distance = false;
canthrow1 = false;
canthrow2 = false;
surface_arc_1 = surface_create(room_width, room_height);
surface_arc_2 = surface_create(room_width, room_height);

gungui_alpha = 0;
item_text_surface = surface_create(room_width, room_height);

//Inventory
item_slot = noone;
for (i = 0; i < 12; i++){
    item_slot[i] = instance_create_layer(x, y, layer_get_id("GUI_Layer"), oInventorySlot);
	item_slot[i].sin_val = (1 / 12) * (11 - i);
	item_slot[i].item = i + 5;
}
item_slot[0].item = -1;

//Item Array
//ItemDataScript();