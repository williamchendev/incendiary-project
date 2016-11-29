///UnitMovePauseScript(grid);
with(oUnit){
    if (moving){
        if (mp_grid_path(argument0, path, x, y, path_goalx, path_goaly, true)){
            path_start(path, move_spd, path_action_stop, false);
            path_set_precision(path, 3);
        }
    }
}
