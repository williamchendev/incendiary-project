///AdventureInitScript();

//Init
global.debug = false;
ControlScript();

//Paths
path = path_add();
grid = noone;

anna_x = x;
anna_y = y;

canmove = true;
moving = false;

//Settings
spd = 1;
item = 0;

cutscene = false;
cutscene_y = 0;
cutscene_x = 0;
camera_speed = 0.1;

gui = false;
gui_circle_length = 32;

//Inventory
item_slot = noone;
for (i = 0; i < 12; i++){
    item_slot[i] = instance_create(x, y, oInventorySlot);
}
