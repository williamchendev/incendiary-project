///Init

//Settings
action = instance_create(x, y, oAction);
action.action_type = 3;

move_x = x;
move_y = y;

selected = false;

talk = false;
talk_event = false;
talk_reset = false;

temp_text = noone;

event = 0;
text_index = 1;

//Text Event
type = 0;
text_displace_y = 50;

text1 = noone;
text1[0, 0] = "...";
text1[0, 1] = -1;
text1[0, 2] = c_white;
text1[0, 3] = RegularFont;

text1[1, 0] = "...";
text1[1, 1] = -1;
text1[1, 2] = c_white;
text1[1, 3] = RegularFont;

text1[2, 0] = "...";
text1[2, 1] = -1;
text1[2, 2] = c_white;
text1[2, 3] = RegularFont;

text2 = noone;
text3 = noone;
text4 = noone;
text5 = noone;

