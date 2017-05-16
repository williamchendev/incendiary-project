/// @description Init
layer = layer_get_id("Player_Layer");

///Settings
karma = -0.3; //hostile - (-1), neutral - (0), friendly - (1)
creepy = 0.8; //random_range(0, 1)
nature = "alone"; //support, leader, alone
behavior = "guard"; //idle - nothing/sulk, follow - support/tag, chase - attack/pursue, patrol, search, guard - watch one location, cutscene - theatric movement
draw_ui = true;

vitality = 2;

//Vision
alertness = 0.2;

sight = 0;
sight_angle = 60;
sight_radius = 132;
sight_radius_p = 0.6;
sight_alert_radius = 20;

//Movement
spd = 0.8;
dash = 1;
walk_spd = 0.8;
run_spd = 2;
dash_spd = 2;

//Animations
idle_ani = en_f;
walk_ani = en_fwalk;
run_ani = en_frun;

//Combat
angry = 0;
angry_reset = 180;

combat_range = 20;
combat_delay = 60;

//Knowledge
rooms = noone;
room_path = noone;
room_priority = noone;
if (instance_exists(oPatrol)){
	rooms = oPatrol.rooms;
	room_path = oPatrol.room_path;
}
if (rooms != noone){
	for (var i = 0; i < array_length_1d(rooms); i++){
		room_priority[i] = irandom_range(0, 100);
	}
}
current_room = room;
goal_room = room;
room_pathfind = noone;

//Guard
guard_room = room;
guard_facing = image_xscale;
guard_x = x;
guard_y = y;

//Path Finding
path_redirect_range = 20;

follow = oAnna;
follow_radius = 120;
follow_radius_p = 0.6;

patrol_count = 0;
patrol_checks = 4;
patrol_time = 0;
patrol_switch = 120;

///Variables
path = path_add();

canmove = true;
dead = false;
bleed = 0;
attack = false;
attack_timer = 0;
attack_move = true;

move_x = x;
move_y = y;
move_x_p = move_x;
move_y_p = move_y;

draw_x = x;
draw_y = y;
cutscene_x = x;
cutscene_y = y;
patrol_x = x;
patrol_y = y;

walking = false;
stand_still = false;

temp_behavior = behavior;
distracted_x = x;
distracted_y = y;

anna_vis = false;
alert = 0;

sight_track = (90 + (90 * sign(image_xscale)));
sight_wide = 0;
sight_tilt = 8;

sin_val = 0;

hit_p[0, 0] = false;
hit_p[1, 0] = false;
hit_p[2, 0] = false;