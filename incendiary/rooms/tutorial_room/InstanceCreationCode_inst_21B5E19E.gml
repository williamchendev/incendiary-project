if (global.story[0]){
	instance_destroy();
}

karma = 1; //hostile - (-1), neutral - (0), friendly - (1)
creepy = 0; //random_range(0, 1)
nature = "alone"; //support, leader, alone
behavior = "cutscene"; //idle - nothing/sulk, follow - support/tag, chase - attack/pursue, patrol, search, guard - watch one location, cutscene - theatric movement
draw_ui = false;

vitality = 2;

//Movement
spd = 0.8;
walk_spd = 0.8;
run_spd = 2;

//Animations
idle_ani = sBrook;
walk_ani = sBrookWalk;