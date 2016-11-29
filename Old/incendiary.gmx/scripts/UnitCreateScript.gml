///UnitCreateScript(x, y, unitnum);
with(instance_create(argument0, argument1, oUnit)){
    unitnum = argument2;
    if (instance_exists(oSystem)){
        oSystem.unit[argument2] = self;
    }
}
