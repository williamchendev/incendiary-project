/// @description Init

cutscene_switch = true;
if (!cutscene_switch){
	instance_destroy();
}

//Settings
actor[0] =  oAnna;
actor[1] =  instance_nearest(x, y, oAI);

action[0, 0] = "text"; //Action Type
action[0, 1] = 1; //Actor
action[0, 2] = "This is a test."; //Action Text
action[0, 3] = c_white; //Action Text Color
action[0, 4] = RegularFont; //Action Text Font

action[1, 0] = "movement"; //Action Type
action[1, 1] = 1; //Actor
action[1, 2] = x; //X Position
action[1, 3] = y; //Y Position
action[1, 4] = true; //Action Skip

action[2, 0] = "pause"; //Action Type
action[2, 1] = 60; //Action Timer

action[3, 0] = "animation"; //Action Type
action[3, 1] = 1; //Actor
action[3, 2] = en_f; //Action Animation

//Variables
text_displace_y = 56;
text_spd = 0.35;

event = 0;
start_event = true;
end_event = false;

triggered = false;