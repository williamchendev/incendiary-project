///UnitMoveScript(id, grid, goal_x, goal_y);
with(argument0){
    moving = true;
    if (mp_grid_path(argument1, path, x, y, argument2, argument3, true)){
        path_start(path, move_spd, path_action_stop, false);
        path_set_precision(path, 3);
    }
}
