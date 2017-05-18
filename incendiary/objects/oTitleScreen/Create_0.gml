/// Create
event_inherited();

alpha = 1;
main_light_alpha = 0.7;
secondary_light_alpha = 0.4;

ControlScript();

//Global Variables
global.debug = false;
global.escape_game = -1;
global.music_vol = 0;
global.sfx_vol = 0;
global.dog_fluff = 0;
StoryInitScript();

//Item Array
ItemDataScript();

//Scale 2
var window_w = 0;
var window_h = 0;
var scale_temp = round(sqrt((display_get_width() / 480) * (display_get_height() / 270)));
var window_scale_temp = clamp(scale_temp, 1, 3);
if (!window_get_fullscreen()){
	window_w = (window_scale_temp * 480);
	window_h = (window_scale_temp * 270);
}
else {
	window_w = 480;
	window_h = 270;
}
window_set_size(window_w, window_h);
window_set_position(clamp((display_get_width() - window_w) / 2, 10, display_get_width() - 10), clamp((display_get_height() - window_h) / 2, 40, display_get_height() - 40));

//Variables
cursor_num = -1;

colorB = c_white;

wait = 60;
start_time = wait;
outline_num = 0;
credits_show = false;

button_data = noone;

button_data[0, 0] = "Play";
button_data[0, 1] = 100;
button_data[0, 2] = 130;

button_data[1, 0] = "Options";
button_data[1, 1] = 100;
button_data[1, 2] = 160;

button_data[2, 0] = "End";
button_data[2, 1] = 100;
button_data[2, 2] = 190;

button_data[3, 0] = "Credits";
button_data[3, 1] = 100;
button_data[3, 2] = 220;

credits_data = noone;

credits_data[0] = "Code + Art: William Spelman";
credits_data[1] = "Music: Jack Barenbrugge";
credits_data[2] = "Special Thanks to Ms.Haga and Mr.Dwyer";
credits_data[3] = "Emotional Wreck: William Spelman";