///ControlScript();

mouse_scale_x = (window_mouse_get_x() / (window_get_width() / 480)) + camera_get_view_x(view_camera[0]);
mouse_scale_y = (window_mouse_get_y() / (window_get_height() / 270)) +camera_get_view_y(view_camera[0]);

mouse_click = mouse_check_button_pressed(mb_left);
escape = keyboard_check(vk_escape);

debug_key = keyboard_check_pressed(vk_f8);
restart_key = keyboard_check_pressed(ord("R"));
test_key = keyboard_check_pressed(ord("T"));
