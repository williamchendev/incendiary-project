///Fire Create

//Create Fire System
partFire_sys = part_system_create();

//Create Particle Shape
partFire = part_type_create();
part_type_sprite(partFire, sFireParticle_small, 0, 0, 1);
part_type_size(partFire, 1.1, 1.7, -0.01, 0);
part_type_color2(partFire, c_orange, c_red);
part_type_alpha3(partFire, 1, 0.6, 0);
part_type_speed(partFire, 0.1, 0.25, 0.005, 0);
part_type_direction(partFire, 90, 90, 0, 10);
part_type_orientation(partFire, 0, 359, 0, 0, 0);
part_type_blend(partFire, 1);
part_type_life(partFire, 25, 40);

alarm[0] = 1;