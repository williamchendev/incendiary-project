/// @description Move Character

if (oAnna.mouse_click){
	with(oAnna){
		ControlScript();
		
		var temp_move_line_in = position_meeting(mouse_scale_x, mouse_scale_y, other);
		
		if (temp_move_line_in){
			if (canmove){
				var self_box_click = point_in_rectangle(mouse_scale_x, mouse_scale_y, x - 6, y - 40, x + 6, y + 4);
				if (!self_box_click and !position_meeting(mouse_scale_x, mouse_scale_y, oAction)){
					path_end();
					
					var temp_move_inst = instance_nearest(mouse_scale_x, mouse_scale_y, oMove);
					var min_move = temp_move_inst.x;
					var max_move = round(temp_move_inst.x + (temp_move_inst.image_xscale * 32)) - 1;
					
			        move_x = round(clamp(mouse_scale_x, min_move, max_move));
			        move_y = y;
            
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
			        }
            
			        moving = false;
				}
			}
		}
	}
}