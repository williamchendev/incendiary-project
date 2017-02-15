///ShotScript(x, y, direction, spd);

var inst_shot = instance_create_depth(argument0, argument1, depth, oShot);
inst_shot.hit_direction = argument2;
inst_shot.spd = argument3;