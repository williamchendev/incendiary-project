event_inherited();

//Settings
actor[0] =  oAnna;
actor[1] =  instance_nearest(x, y, oAI);

action[0, 0] = "create"; //Action Type
action[0, 1] = oCeilingLight; //Instance Name
action[0, 2] = 243; //X
action[0, 3] = 81; //Y

action[1, 0] = "pause"; //Action Type
action[1, 1] = 30; //Action Timer

action[2, 0] = "text"; //Action Type
action[2, 1] = 1; //Actor
action[2, 2] = "You shouldn\'t have come..."; //Action Text
action[2, 3] = c_white; //Action Text Color
action[2, 4] = RegularFont; //Action Text Font

action[3, 0] = "lights"; //Action Type
action[3, 1] = 140; //Action Time
action[3, 2] = 0.5; //Min Flicker
action[3, 3] = 1; //Max Flicker
action[3, 4] = 1; //Destroy Instance

action[4, 0] = "destroy"; //Action Type
action[4, 1] = oCeilingLight; //Instance Name

if (global.story[2]){
	with(actor[1]){
		instance_destroy();
	}
	instance_destroy();
}