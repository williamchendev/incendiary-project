///Fire Create

//Settings
snow_amount = 10 * (room_width / 480);
snow_delay = 8;

//Create Snow System
partSnow_sys = part_system_create();
part_system_depth(partSnow_sys, -9999);

//Create Particle Shape
partSnow = part_type_create();
part_type_shape(partSnow, pt_shape_disk);
part_type_size(partSnow, 0.02, 0.05, 0, 0);
part_type_color_mix(partSnow, c_ltgray, c_white);
part_type_alpha3(partSnow, 0.8, 0.6, 0);
part_type_speed(partSnow, 0.4, 0.7, -0.0005, 0);
part_type_direction(partSnow, 260, 270, -0.07, 0);
part_type_life(partSnow, 400, 580);

//Particle Emitter
partSnow_emit = part_emitter_create(partSnow_sys);
part_emitter_region(partSnow_sys, partSnow_emit, 0, room_width + 50, -5, -5, ps_shape_line, ps_distr_linear);

alarm[0] = 1;