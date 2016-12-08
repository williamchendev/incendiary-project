//Camera

var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);

var view_set_x = 0;
var view_set_y = 0;

if (!cutscene){
	var view_set_x = (((x - 240) - view_x) * camera_speed) + view_x;
	var view_set_y = (((y - 135) - view_y) * camera_speed) + view_y;
}
else {
    var view_set_x = (((cutscene_x - 240) - view_x) * camera_speed) + view_x;
	var view_set_y = (((cutscene_y - 135) - view_y) * camera_speed) + view_y;
}

camera_set_view_pos(view_camera[0], clamp(view_set_x, 0, room_width - 480), clamp(view_set_y, 0, room_height - 270));