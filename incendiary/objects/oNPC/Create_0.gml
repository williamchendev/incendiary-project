///Init

//Settings
action = instance_create_layer(x, y, layer_get_id("Action_Layer"), oAction);
action.action_type = 3;

move_x = x;
move_y = y;

selected = false;

talk = false;
talk_event = false;
talk_reset = false;
talk_end = false;

temp_text = noone;

event = 0;
text_index = 1;

give_item = false;

//Text Event
type = 0;
text_displace_y = 56;

text1 = noone; //Init
text1[0, 0] = "..."; //Text
text1[0, 1] = ""; //Special Text
text1[0, 2] = 0; //Text Type
text1[0, 3] = -1; //Text Character
text1[0, 4] = 0.35; //Text Speed
text1[0, 5] = c_white; //Text Color
text1[0, 6] = RegularFont; //Text Font

text1[1, 0] = "..."; //Text
text1[1, 1] = ""; //Special Text
text1[1, 2] = 0; //Text Type
text1[1, 3] = -1; //Text Character
text1[1, 4] = 0.35; //Text Speed
text1[1, 5] = c_white; //Text Color
text1[1, 6] = RegularFont; //Text Font

text1[2, 0] = "..."; //Text
text1[2, 1] = ""; //Special Text
text1[2, 2] = 0; //Text Type
text1[2, 3] = -1; //Text Character
text1[2, 4] = 0.35; //Text Speed
text1[2, 5] = c_white; //Text Color
text1[2, 6] = RegularFont; //Text Font

text2 = noone;
text3 = noone;
text4 = noone;
text5 = noone;