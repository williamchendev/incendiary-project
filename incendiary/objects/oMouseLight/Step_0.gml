x = (window_mouse_get_x() / (window_get_width() / 480)) + camera_get_view_x(view_camera[0]);
y = (window_mouse_get_y() / (window_get_height() / 270)) +camera_get_view_y(view_camera[0]);

event_inherited();