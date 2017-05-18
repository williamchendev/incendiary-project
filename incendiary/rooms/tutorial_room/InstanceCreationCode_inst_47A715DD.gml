if (global.story[0]){
	instance_destroy();
}

var brook_color = make_color_rgb(200, 175, 214);

actor[0] =  oAnna;
actor[1] =  instance_nearest(x, y, oAI);

action[0, 0] = "pause"; //Action Type
action[0, 1] = 30; //Action Timer

action[1, 0] = "text"; //Action Type
action[1, 1] = 1; //Actor
action[1, 2] = "The engine is busted."; //Action Text
action[1, 3] = brook_color; //Action Text Color
action[1, 4] = RegularFont; //Action Text Font

action[2, 0] = "text"; //Action Type
action[2, 1] = 1; //Actor
action[2, 2] = "..piece of shit..."; //Action Text
action[2, 3] = brook_color; //Action Text Color
action[2, 4] = RegularFont; //Action Text Font

action[3, 0] = "text"; //Action Type
action[3, 1] = 0; //Actor
action[3, 2] = "Are we.."; //Action Text
action[3, 3] = c_white; //Action Text Color
action[3, 4] = RegularFont; //Action Text Font

action[4, 0] = "movement"; //Action Type
action[4, 1] = 1; //Actor
action[4, 2] = oAnna.x - 28; //X Position
action[4, 3] = oAnna.y; //Y Position
action[4, 4] = false; //Action Skip

action[5, 0] = "text"; //Action Type
action[5, 1] = 1; //Actor
action[5, 2] = "Stuck?"; //Action Text
action[5, 3] = brook_color; //Action Text Color
action[5, 4] = RegularFont; //Action Text Font

action[6, 0] = "text"; //Action Type
action[6, 1] = 1; //Actor
action[6, 2] = "Yeah."; //Action Text
action[6, 3] = brook_color; //Action Text Color
action[6, 4] = RegularFont; //Action Text Font

action[7, 0] = "text"; //Action Type
action[7, 1] = 1; //Actor
action[7, 2] = "It looks like there\'s a house up ahead."; //Action Text
action[7, 3] = brook_color; //Action Text Color
action[7, 4] = RegularFont; //Action Text Font

action[8, 0] = "text"; //Action Type
action[8, 1] = 1; //Actor
action[8, 2] = "See if they have a phone."; //Action Text
action[8, 3] = brook_color; //Action Text Color
action[8, 4] = RegularFont; //Action Text Font

action[9, 0] = "pause"; //Action Type
action[9, 1] = 30; //Action Timer

action[10, 0] = "text"; //Action Type
action[10, 1] = 1; //Actor
action[10, 2] = "Oh, don\'t forget this..."; //Action Text
action[10, 3] = brook_color; //Action Text Color
action[10, 4] = RegularFont; //Action Text Font

action[11, 0] = "pause"; //Action Type
action[11, 1] = 40; //Action Timer

action[12, 0] = "create"; //Action Type
action[12, 1] = oGun; //Instance Name
action[12, 2] = oAnna.x - 14; //X
action[12, 3] = oAnna.y + 4; //Y

action[13, 0] = "pause"; //Action Type
action[13, 1] = 20; //Action Timer

action[14, 0] = "text"; //Action Type
action[14, 1] = 1; //Actor
action[14, 2] = "In case they're not \"neighbourly.\""; //Action Text
action[14, 3] = brook_color; //Action Text Color
action[14, 4] = RegularFont; //Action Text Font

action[15, 0] = "create"; //Action Type
action[15, 1] = oBrook; //Instance Name
action[15, 2] = oAnna.x - 29; //X
action[15, 3] = oAnna.y; //Y

action[16, 0] = "destroy"; //Action Type
action[16, 1] = actor[1] //Instance Name

action[17, 0] = "create";
action[17, 1] = oCutsceneA1;
action[17, 2] = 500; //X
action[17, 3] = 500; //Y