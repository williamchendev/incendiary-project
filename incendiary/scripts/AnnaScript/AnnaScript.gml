///AnnaScipt();

//Controls
ControlScript();
if (keyboard_check_pressed(vk_f11)){
    window_set_fullscreen(!window_get_fullscreen());
}
var self_box_click = point_in_rectangle(mouse_scale_x, mouse_scale_y, x - 6, y - 40, x + 6, y + 4);

//Movement
if (canmove){
    if (mouse_click){
        if (position_meeting(mouse_scale_x, mouse_scale_y, oAction)){
            var inst_act = instance_position(mouse_scale_x, mouse_scale_y, oAction);
            if (inst_act != noone){
                if (inst_act.action_sprite_scale == 1){
                    inst_act.clicked = true;
                }
            }
        }
        else if (self_box_click){
            if (item != -1){
                gui = true;
            }
            else {
                gui = true;
            }
            canmove = false;
            moving = false;
			walking = false;
        }
        else {
            //Pathfinding on Click
            path_end();
            
            move_x = round(mouse_scale_x);
            move_y = round(mouse_scale_y);
            
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
else {
    if (path_index != -1){
        path_end();
    }
    
    //GUI
    if (gui){
        if (mouse_click){
            if (self_box_click){
                gui = false;
                canmove = true;
				//Toss Combo Items On Ground
				if (max(combo_slot1, combo_slot2) != -1){
					if (combo_slot1 != -1){
						ItemAddScript(combo_slot1);
						combo_slot1 = -1;
					}
					if (combo_slot2 != -1){
						ItemAddScript(combo_slot2);
						combo_slot2 = -1;
					}
				}
				if (item != -1){
					if (global.item_data[item, 2] == 2){
						canmove = false;
						throw = true;
					}
				}
            }
            else {
                //Switch Items
                if (position_meeting(mouse_scale_x, mouse_scale_y, oInventorySlot)){
                    var inst_item = instance_position(mouse_scale_x, mouse_scale_y, oInventorySlot);
                    if (inst_item != noone){
						if (item == -1){
							if (inst_item.combo_item != -1){
								inst_item.item = inst_item.combo_item;
								inst_item.combo_item = -1;
								combo_slot1 = -1;
								combo_slot2 = -1;
							}
						}
						var temp_item = inst_item.item
						inst_item.item = item;
						item = temp_item;
                    }
                }
				if (max(combo_slot1, combo_slot2) != -1 or item != -1){
					if (point_distance(mouse_scale_x, mouse_scale_y, x - 14, y - 18) <= 7.5){
						var temp_combo_item1 = item;
						item = combo_slot1;
						combo_slot1 = temp_combo_item1;
					}
					else if (point_distance(mouse_scale_x, mouse_scale_y, x + 16, y - 18) <= 7.5){
						var temp_combo_item2 = item;
						item = combo_slot2;
						combo_slot2 = temp_combo_item2;
					}
				}
            }
        }
		
		combo_item = -1;
		if (min(combo_slot1, combo_slot2) != -1){
			if (CraftScript(combo_slot1, combo_slot2) != -1){
				combo_item = CraftScript(combo_slot1, combo_slot2);
			}
		}
    }
	else if (throw){
		var anna_x_throwpos = anna_x;
		var anna_y_throwpos = anna_y - 19;
		
		inside_throw_distance = (sqr(mouse_scale_x - anna_x_throwpos) / sqr(120) + sqr(mouse_scale_y - anna_y_throwpos) / sqr(54));
		
		canthrow1 = false;
		canthrow2 = false;
		if (instance_position(mouse_scale_x, mouse_scale_y, oMove) != noone){
			canthrow1 = true;
		}
		if (instance_position(mouse_scale_x, mouse_scale_y, oSolid) == noone){
			canthrow2 = true;
		}
		
		if (mouse_click){
            if (self_box_click){
				gui = true;
				throw = false;
			}
		}
	}
}

//Move Inventory
var empty_slot = true;
for (i = 0; i < 12; i++){
    if (item_slot[i] != noone){
        item_slot[i].x = lengthdir_x(gui_circle_length, ((360 / 12) * -i) + 90) + x;
        item_slot[i].y = lengthdir_y(gui_circle_length, ((360 / 12) * -i) + 90) + y - 19;
        
        if (gui){
            if (item_slot[i].alpha < 0.8){
                item_slot[i].alpha += 0.01;
                item_slot[i].alpha *= 1.1;
            }
        }
        else {
            if (item_slot[i].alpha > 0){
                item_slot[i].alpha -= 0.01;
                item_slot[i].alpha *= 0.9;
            }
        }
		
		item_slot[i].combo_item = -1;
		if (empty_slot == true){
			if (item_slot[i].item == -1){
				if (combo_item != -1){
					item_slot[i].combo_item = combo_item;
					empty_slot = false;
				}
			}
		}
    }
}

//Camera
CameraScript();

//Sin Val
if (sin_val >= 1){
	sin_val = 0;
}
else {
	sin_val += 0.007;
}
sin_val = clamp(sin_val, 0, 1);

//If OS is paused
if (os_is_paused()){
	GamePauseScript();
}

//Menu
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);

if (mouse_click){
	if (mouse_scale_x - view_x > 464){
		if (mouse_scale_y - view_y < 16){
			GamePauseScript();
		}
	}
}

//Debug Keys

//Restart
if (restart_key){
    path_end();
    room_restart();
    randomize();
}

//Test
if (test_key){
    instance_create_layer(0, 0, "Action_Layer", oCircleTrans);
}
