///Init

event_inherited();

image_xscale = 1;

move_x = x + 40;
move_y = y;

text1 = noone;
text1[0, 0] = "You look like you died.";
text1[0, 1] = self;
text1[0, 2] = make_color_rgb(150, 123, 182);
text1[0, 3] = RegularFont;

text1[1, 0] = "I\'m alive, aren\'t I?";
text1[1, 1] = -1;
text1[1, 2] = c_white;
text1[1, 3] = RegularFont;

text1[2, 0] = "Get";
text1[2, 1] = self;
text1[2, 2] = make_color_rgb(150, 123, 182);
text1[2, 3] = RegularFont;

text1[3, 0] = "To";
text1[3, 1] = self;
text1[3, 2] = make_color_rgb(150, 123, 182);
text1[3, 3] = RegularFont;

text1[4, 0] = "A";
text1[4, 1] = self;
text1[4, 2] = make_color_rgb(150, 123, 182);
text1[4, 3] = RegularFont;

text1[5, 0] = "Hospital.";
text1[5, 1] = self;
text1[5, 2] = make_color_rgb(150, 123, 182);
text1[5, 3] = RegularFont;

text2 = noone;
text3 = noone;
text4 = noone;
text5 = noone;