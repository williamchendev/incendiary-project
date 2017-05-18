event_inherited();

if (end_event){
	global.story[2] = true;
	var kane;
	kane[0] = instance_create_depth(x, y, 0, oAI);
	kane[0].behavior = "guard";
	kane[0].guard_room = downstairs_room;
	kane[0].guard_facing = -1;
	kane[0].guard_x = 376;
	kane[0].guard_y = 188;
	kane[1] = instance_create_depth(x, y, 0, oAI);
	kane[2] = instance_create_depth(x, y, 0, oAI);
	kane[3] = instance_create_depth(x, y, 0, oAI);
	for (var k = 0; k < 4; k++){
		TempAIScript(kane[k], downstairs_room);
		instance_destroy(kane[k]);
	}
}