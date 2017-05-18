/// @description Init

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

action[4, 0] = "lights"; //Action Type
action[4, 1] = 140; //Action Time
action[4, 2] = 0.3; //Min Flicker
action[4, 3] = 0.8; //Max Flicker
action[4, 4] = -1; //Destroy Instance

action[5, 0] = "create"; //Action Type
action[5, 1] = oGun; //Instance Name
action[5, 2] = x; //X
action[5, 3] = y; //Y

action[6, 0] = "destroy"; //Action Type
action[6, 1] = oGun; //Instance Name

action = noone;
actor = noone;

//Variables
text_displace_y = 56;
text_spd = 0.35;

event = 0;
start_event = true;
end_event = false;

triggered = false;

light_time = 0;
light_trigger = 0;
light_alpha = 0;
light_destroy = false;