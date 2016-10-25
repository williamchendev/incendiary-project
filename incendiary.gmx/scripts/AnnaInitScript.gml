///AdventureInitScript();

//Init
global.debug = false;

//Paths
path = path_add();
grid = noone;

anna_x = x;
anna_y = y;

canmove = true;

//Settings
spd = 1;

//Inventory
item_slot = noone;
for (i = 0; i < 8; i++){
    item_slot[i] = -1;
}

item_slot[0] = 1;
