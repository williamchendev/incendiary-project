///Fire Create

event_inherited();

//Create Fire System
partFire_sys = part_system_create();
part_system_depth(partFire_sys, -y);

//Create Fire Particle Shape
partFire = part_type_create();
part_type_sprite(partFire, sFireParticle_medium, 0, 0, 1);
part_type_size(partFire, 1.2, 1.3, -0.02, 0);
part_type_color2(partFire, merge_color(c_orange, c_red, 0.15), c_red);
part_type_alpha3(partFire, 1, 0.8, 0);
part_type_speed(partFire, 0.3, 0.4, 0, 0);
part_type_direction(partFire, 85, 95, 0, 3);
//part_type_orientation(partFire, 0, 359, 0, 0, 0);
//part_type_blend(partFire, 1);
part_type_life(partFire, 25, 45);

//Particle Emitter
partFire_emit = part_emitter_create(partFire_sys);
part_emitter_region(partFire_sys, partFire_emit, x - 2, x + 2, y - 2, y - 1, ps_shape_ellipse, ps_distr_gaussian);

//Create Smoke System
partSmoke_sys = part_system_create();
part_system_depth(partSmoke_sys, -y + 1);

//Smoke Particle
partSmoke = part_type_create();
part_type_sprite(partSmoke, sFireParticle_small, 0, 0, 1);
//part_type_size(partSmoke, 1, 1, 0, 0);
part_type_color2(partSmoke, c_white, c_ltgray);
part_type_alpha3(partSmoke, 1, 1, 0);
part_type_speed(partSmoke, 0.2, 0.25, 0, 0);
part_type_direction(partSmoke, 90, 100, 0, 3);
part_type_orientation(partSmoke, 0, 359, 0, 0, 0);
//part_type_blend(partFire, 1);
part_type_life(partSmoke, 120, 160);

alarm[0] = 1;
alarm[1] = 1;