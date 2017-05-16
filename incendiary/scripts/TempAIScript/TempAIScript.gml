///TempAIScript(inst_ai, current_room);
///@param inst_ai AI Instance to be copied
///@param current_room Current room

var inst_ai = instance_create_layer(argument0.x, argument0.y, "Player_Layer", oTempAI);

inst_ai.karma = argument0.karma;
inst_ai.creepy = argument0.creepy;
inst_ai.nature = argument0.nature;

inst_ai.behavior = argument0.behavior;
if (argument0.behavior == "distracted"){
	if (string_count(argument0.temp_behavior, "idle follow chase patrol search guard cutscene dead") > 0){
		inst_ai.behavior = argument0.temp_behavior;
	}
	else {
		inst_ai.behavior = "patrol";
	}
}

inst_ai.vitality = argument0.vitality;

inst_ai.canmove = argument0.canmove;

//Vision
inst_ai.alertness = argument0.alertness;

inst_ai.sight = argument0.sight;
inst_ai.sight_angle = argument0.sight_angle;
inst_ai.sight_radius = argument0.sight_radius;
inst_ai.sight_radius_p = argument0.sight_radius_p;
inst_ai.sight_alert_radius = argument0.sight_alert_radius;

//Movement
inst_ai.spd = argument0.spd;
inst_ai.dash = argument0.dash;
inst_ai.walk_spd = argument0.walk_spd;
inst_ai.run_spd = argument0.run_spd;
inst_ai.dash_spd = argument0.dash_spd;

//Animations
inst_ai.idle_ani = argument0.idle_ani;
inst_ai.walk_ani = argument0.walk_ani;
inst_ai.run_ani = argument0.run_ani;

//Combat
inst_ai.angry = argument0.angry;
inst_ai.angry_reset = argument0.angry_reset;

inst_ai.combat_range = argument0.combat_range;
inst_ai.combat_delay = argument0.combat_delay;

inst_ai.patrol_count = argument0.patrol_count;
inst_ai.patrol_checks = argument0.patrol_checks;
inst_ai.patrol_time = argument0.patrol_time;
inst_ai.patrol_switch = argument0.patrol_switch;

//Guard
inst_ai.guard_room = argument0.guard_room;
inst_ai.guard_facing = argument0.guard_facing;
inst_ai.guard_x = argument0.guard_x;
inst_ai.guard_y = argument0.guard_y;

//Path Finding
inst_ai.path_redirect_range = argument0.path_redirect_range;

inst_ai.follow = argument0.follow;
inst_ai.follow_radius = argument0.follow_radius;
inst_ai.follow_radius_p = argument0.follow_radius_p;

//Rooms
inst_ai.room_path = argument0.room_path;
inst_ai.goal_room = argument0.goal_room;

//knowledge
inst_ai.room_priority = argument0.room_priority;
inst_ai.goal_room = argument0.goal_room;
inst_ai.room_pathfind = argument0.room_pathfind;
inst_ai.current_room = argument1;