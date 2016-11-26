///AnnaScipt();

//Controls
ControlScript();
if (keyboard_check_pressed(vk_f11)){
    window_set_fullscreen(!window_get_fullscreen());
}

//Movement
if (canmove){
    if (mouse_click){
        if (point_in_rectangle(mouse_x, mouse_y, x - 6, y - 40, x + 6, y + 4)){
            if (item != -1){
                gui = true;
            }
            else {
                gui = true;
            }
            canmove = false;
            moving = false;
        }
        else if (position_meeting(mouse_x, mouse_y, oAction)){
            var inst_act = instance_position(mouse_x, mouse_y, oAction);
            if (inst_act != noone){
                if (!moving){
                    if (inst_act.action_sprite_scale == 1){
                        inst_act.clicked = true;
                    }
                }
            }
        }
        else {
            //Pathfinding on Click
            path_end();
            
            move_x = round(mouse_x);
            move_y = round(mouse_y);
            
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
            if (point_in_rectangle(mouse_x, mouse_y, x - 6, y - 40, x + 6, y + 4)){
                gui = false
                canmove = true;
            }
            else {
                //Switch Items
                if (position_meeting(mouse_x, mouse_y, oInventorySlot)){
                    var inst_item = instance_position(mouse_x, mouse_y, oInventorySlot);
                    if (inst_item != noone){
                        var temp_item = inst_item.item;
                        inst_item.item = item;
                        item = temp_item;
                    }
                }
            }
        }
    }
}

//Move Inventory
for (i = 0; i < 12; i++){
    if (item_slot[i] != noone){
        item_slot[i].x = lengthdir_x(gui_circle_length, ((360 / 12) * i) + 90) + x;
        item_slot[i].y = lengthdir_y(gui_circle_length, ((360 / 12) * i) + 90) + y - 18;
        
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
    }
}

//Camera
if (!cutscene){
    view_xview += ((x - (view_wview / 2)) - view_xview) * camera_speed;
    view_yview += ((y - (view_hview / 2)) - view_yview) * camera_speed;
}
else {
    view_xview += ((cutscene_x - (view_wview / 2)) - view_xview) * camera_speed;
    view_yview += ((cutscene_y - (view_hview / 2)) - view_yview) * camera_speed;
}

view_xview = clamp(view_xview, 0, room_width - view_wview);
view_yview = clamp(view_yview, 0, room_height - view_hview);

//Restart
if (restart_key){
    path_end();
    room_restart();
    randomize();
}
