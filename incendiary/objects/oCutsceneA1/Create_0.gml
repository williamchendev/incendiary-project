event_inherited();

x = 582;
y = 115;
image_xscale = 2.09375;
image_yscale = 4.78125;

action = noone;
actor = noone;

actor[0] =  oAnna;
actor[1] =  instance_nearest(x, y, oAI);

action[0, 0] = "text"; //Action Type
action[0, 1] = 0; //Actor
action[0, 2] = "..."; //Action Text
action[0, 3] = c_white; //Action Text Color
action[0, 4] = RegularFont; //Action Text Font

action[1, 0] = "pause"; //Action Type
action[1, 1] = 30; //Action Timer

action[2, 0] = "movement"; //Action Type
action[2, 1] = 1; //Actor
action[2, 2] = actor[1].x + 100; //X Position
action[2, 3] = 154; //Y Position
action[2, 4] = false; //Action Skip

action[3, 0] = "text"; //Action Type
action[3, 1] = 0; //Actor
action[3, 2] = "Hello?"; //Action Text
action[3, 3] = c_white; //Action Text Color
action[3, 4] = RegularFont; //Action Text Font

action[4, 0] = "destroy"; //Action Type
action[4, 1] = actor[1]; //Instance Name

action[5, 0] = "destroy"; //Action Type
action[5, 1] = oBrook; //Instance Name

action[6, 0] = "destroy"; //Action Type
action[6, 1] = oLatern; //Instance Name