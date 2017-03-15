///Init

//item = irandom_range(0, array_height_2d(global.item_data) - 1);
item = irandom_range(0, 15);

action = instance_create_layer(x, y, layer_get_id("Action_Layer"), oAction);
action.action_type = 9;

selected = false;
buy = false;

barter = instance_nearest(x, y, oBarterNPC);
move_x = x;
move_y = barter.y;

sin_val = 0;

trade = noone;
trade[0] = -1;
trade[1] = -1;
trade[2] = -1;
trade[3] = -1;

cost = random_range(1.25, 1.75);

outline_surface = surface_create(room_width, room_height);