///AnnaMoveScript(x, y);
if (instance_exists(oAnna)){
    with(oAnna){
        path_end();
                    
        move_x = round(argument0);
        move_y = round(argument1);
        
        if (mp_grid_path(grid, path, x, y, move_x, move_y, true)){
            var point_a = 0;
            var point_b = 2;
            
            while (point_b < path_get_number(path)){
                if (!collision_line(path_get_point_x(path, point_a), path_get_point_y(path, point_a), path_get_point_x(path, point_b),path_get_point_y(path, point_b), oSolid, false, true) and (point_b < path_get_number(path) - 1)){
                    point_b += 1;
                }
                else {
                    repeat((point_b - 2) - point_a){
                        path_delete_point(path, point_a + 1);
                    }
                    
                    point_a += 1;
                    point_b = point_a + 2;
                }
            }
            
            path_delete_point(path, path_get_number(path) - 2);
            
            path_start(path, spd, path_action_stop, true);
            path_set_kind(path, 0);
			
			walking = true;
			moving = true;
        }
    }
}
