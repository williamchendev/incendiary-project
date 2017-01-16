//Camera

var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);

view_set_x = 0;
view_set_y = 0;

if (!cutscene){
	view_set_x = (((x - 240 + (image_xscale * 12)) - view_x) * camera_speed) + view_x;
	view_set_y = (((y - 135) - view_y) * camera_speed) + view_y;
	if (stand_still){
		if (abs((x - 240 + (image_xscale * 12)) - view_x) < 1.2){
			view_set_x = (x - 240) + (image_xscale * 12);
		}
	}
}
else {
    view_set_x = (((cutscene_x - 240) - view_x) * camera_speed) + view_x;
	view_set_y = (((cutscene_y - 135) - view_y) * camera_speed) + view_y;
}

view_set_x = clamp(view_set_x, 0, room_width - 480);
view_set_y = clamp(view_set_y, 0, room_height - 270);

//Backgrounds
if (layer_exists("Background_3")){
	layer_x("Background_3", view_set_x / 4);
}
if (layer_exists("Background_4")){
	layer_x("Background_4", view_set_x / 3);
}
if (layer_exists("Background_5")){
	layer_x("Background_5", view_set_x / 2);
}

camera_set_view_pos(view_camera[0], view_set_x, view_set_y);