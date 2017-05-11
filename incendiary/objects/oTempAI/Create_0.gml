/// @description Init

//Settings
room_behavior = "idle";

room_spd = 1;
room_reset_time = 120;
room_timer = 0;

room_stay_time = 60 * 20;

///AI DATA
karma = 0;
creepy = random_range(0, 1);
nature = "alone";
behavior = "idle";
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

//Path Finding
path_redirect_range = 20;

follow = oAnna;
follow_radius = 120;
follow_radius_p = 0.6;

//Rooms
current_room = noone;
room_path = noone;
goal_room = noone;
guard_room = noone;

//Knowledge
rooms = noone;
room_priority = noone;
if (instance_exists(oPatrol)){
	rooms = oPatrol.rooms;
}
if (rooms != noone){
	for (var i = 0; i < array_height_2d(rooms); i++){
		rooms_priority[i] = irandom_range(0, 100);
	}
}