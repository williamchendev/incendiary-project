///Init
path = path_add();

layer = layer_get_id("Player_Layer");

//Settings
follow = oAnna;
follow_radius = 120;
follow_radius_p = 0.6;

draw_x = x;
draw_y = y;
spd = 0.8;

idle_ani = en_f;
walk_ani = en_fwalk;

//Variables
canmove = true;

move_x = x;
move_y = y;
walking = false;