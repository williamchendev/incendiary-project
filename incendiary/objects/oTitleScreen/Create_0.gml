/// Create

ControlScript();

//Global Variables
global.debug = false;
global.escape_game = -1;
global.music_vol = 0;
global.sfx_vol = 0;
global.dog_fluff = 0;

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

//Item Array
ItemDataScript();

//Variables
cursor_num = -1;