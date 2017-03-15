/// @Burst Alarm

part_emitter_region(partSnow_sys, partSnow_emit, camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + 520, -5, -5, ps_shape_line, ps_distr_linear);

var i = 0;
for (i = 0; i < snow_amount; i++){
	part_emitter_burst(partSnow_sys, partSnow_emit, partSnow, 1);
}

alarm[0] = snow_delay;