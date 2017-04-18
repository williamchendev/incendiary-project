/// @description Init
layer = layer_get_id("Player_Layer");

///Settings
karma = -0.3; //hostile - (-1), neutral - (0), friendly - (1)
creepy = 0.8; //random_range(0, 1)
nature = "alone"; //support, leader, alone
behavior = "idle"; //idle - nothing/sulk, follow - support/tag, chase - attack/pursue, patrol, search
draw_ui = true;

//Vision
alertness = 0.2;
sight_angle = 60;
sight_radius = 94;
aware_radius = 132;

//Movement
spd = 0.8;
dash = 1;
walk_spd = 0.8;
run_spd = 1.2;
dash_spd = 2;

//Animations
idle_ani = en_f;
walk_ani = en_fwalk;

//Combat
combat_range = 10;

combat_delay = 60;

//Knowledge
rooms = noone;
rooms[0] = room;

//Path Finding
path_redirect_range = 20;

follow = oAnna;
follow_radius = 120;
follow_radius_p = 0.6;

///Variables
path = path_add();

canmove = true;
dead = false;
attack = false;
attack_timer = 0;

move_x = x;
move_y = y;

draw_x = x;
draw_y = y;

walking = false;

anna_vis = false;
alert = 0;

sight = 0;
sight_tilt = 0;
sight_wide = 0;