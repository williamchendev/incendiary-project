///UnitMovePauseScript(grid);
with(oUnit){
    if (path_position != 1){
        moving = true;
        path_goalx = path_get_x(path, 1);
        path_goaly = path_get_y(path, 1);
        if (mp_grid_path(argument0, path, x, y, path_goalx, path_goaly, true)){
            path_start(path, move_spd, path_action_stop, false);
            path_set_precision(path, 3);
        }
        path_end();
    }
}
