///Fire Create

//Create Fire System
partFire_sys = part_system_create();
part_system_depth(partFire_sys, -y);

//Create Particle Shape
partFire = part_type_create();
part_type_sprite(partFire, sFireParticle_medium, 0, 0, 1);
part_type_size(partFire, 1, 2.1, 0, 0);
part_type_color2(partFire, c_orange, c_red);
part_type_alpha3(partFire, 1, 1, 0);
part_type_speed(partFire, 0.5, 1, 0, 0);
part_type_direction(partFire, 85, 95, 0, 10);
part_type_orientation(partFire, 0, 359, 0, 0, 0);
//part_type_blend(partFire, 1);
part_type_life(partFire, 20, 40);

//Particle Emitter
partFire_emit = part_emitter_create(partFire_sys);
part_emitter_region(partFire_sys, partFire_emit, x - 6, x + 6, y - 4, y, ps_shape_ellipse, ps_distr_gaussian);

alarm[0] = 1;