///CombatRoomScript();
//Randomize
randomize();

//Init System
if (instance_exists(oSystem)){
    //Init Units
    oSystem.room_type = "combat";
    for (i = 0; i < 3; i++){
        oSystem.unit[i] = noone;
        if (i < oSystem.unitnum){
            UnitCreateScript(48, (irandom_range(1, 6) * 16) + 162, i);
        }
    }
    
    //Init Movement Planning
    oSystem.movement_grid = mp_grid_create(0, 170, room_width div 32, 6, 32, 16);
    mp_grid_add_instances(oSystem.movement_grid, oObstacle, false);
}
