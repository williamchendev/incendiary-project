///AnnaScipt();

//Controls
ControlScript();
if (keyboard_check_pressed(vk_f11)){
    window_set_fullscreen(!window_get_fullscreen());
}
var self_box_click = point_in_rectangle(mouse_scale_x, mouse_scale_y, anna_x - 6, anna_y - 42, anna_x + 6, anna_y + 2);

//Movement
if (canmove){
	if (!shoot){
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
				if (gui_access){
		            if (item != -1){
		                gui = true;
		            }
		            else {
		                gui = true;
		            }
		            canmove = false;
		            moving = false;
					walking = false;
					drop = false;
				}
	        }
			else if (item != -1){
				if (position_meeting(mouse_scale_x, mouse_scale_y, oMove)){
					if (!position_meeting(mouse_scale_x, mouse_scale_y, oSolid)){
						drop = true;
						drop_start = true;
						gui = false;
						AnnaMoveScript(mouse_scale_x, mouse_scale_y);
					}
				}
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
	
		//Drop Items
		if (drop){
			if (item != -1){
				if (point_distance(x, y, move_x, move_y) <= 1){
					if (drop_start){
						var dropped_item = false;
						if (global.item_data[item, 3] != noone){
							for (var u = 5; u > 2; u--){
								var drop_x = x + (u * image_xscale);
								var can_drop_item = (position_meeting(drop_x, round(y + 1), oMove) and (!position_meeting(drop_x, round(y + 1), oSolid)));
								if (can_drop_item){
									dropped_item = true;
									break;
								}
							}
						}
						if (dropped_item){
							pick = true;
							oAnna.image_index = 0;
							drop_start = false;
						}
						else {
							drop = false;
						}
					}
					
					if (end_pick){
						drop_start = true;
						canmove = false;
					}
				}
			}
		}
	}
	else {
		//Shoot Aim Counter
		if (reload != true){
			if (ammo > 0){
				var dest_inst = instance_position(mouse_scale_x, mouse_scale_y, oDestructible);
				var enemy_inst = instance_position(mouse_scale_x, mouse_scale_y, oAI);
				var enemy_inst_aim = false;
				if (dest_inst != noone){
					shoot_aim--;
					enemy_inst_aim = true;
				}
				else if (enemy_inst != noone){
					if (enemy_inst.karma < 0.8){
						shoot_aim--;
						enemy_inst_aim = true;
					}
				}
				if (!enemy_inst_aim){
					shoot_aim += (60 - shoot_aim) * 0.05;
				}
			}
		}
		else {
			shoot_aim += (60 - shoot_aim) * 0.1;
			if (round(shoot_aim - 60) == 0){
				reload = false;
			}
			if (recoil != 0){
				recoil *= 0.95;
				if (abs(recoil) < 0.5){
					recoil = 0;
				}
			}
		}
		
		//Click Mouse
		if (mouse_click){
			var shooting = false;
			if (self_box_click){
				gui = true;
				canmove = false;
				moving = false;
				walking = false;
				shoot = false;
				shoot_aim = 60;
			}
			else if (position_meeting(mouse_scale_x, mouse_scale_y, oDestructible)){
				shooting = true;
			}
			else if (position_meeting(mouse_scale_x, mouse_scale_y, oAI)){
				var inst_shoot_hit = instance_position(mouse_scale_x, mouse_scale_y, oAI);
				if (inst_shoot_hit != noone){
					if (inst_shoot_hit.karma < 0.8){
						shooting = true;
					}
				}
			}
			
			if (shooting){
				if (ammo > 0){
					if (shoot_aim <= 3){
						ammo--;
						var temp_direct_shot = point_direction(x + (2 * image_xscale), y - 30, mouse_scale_x, mouse_scale_y) + irandom_range(-3, 3);
						ShotScript(x + (2 * image_xscale) + lengthdir_x(22, temp_direct_shot), y - 30 + lengthdir_y(22, temp_direct_shot), temp_direct_shot, 20, make_color_rgb(178, 174, 124));
						recoil = random_range(-3, -6);
						reload = true;
					}
				}
			}
			else {
				if (!gui){
					var click_reload = false;
					if (ammo <= 0){
						if (point_distance(mouse_scale_x, mouse_scale_y, anna_x, anna_y - 54) < 7){
							if (ItemSubScript(1)){
								click_reload = true;
								ammoload = true;
								canmove = false;
								image_index = 0;
							}
						}
					}
					if (!click_reload){
						AnnaMoveScript(mouse_scale_x, mouse_scale_y);
						moving = false;
					}
				}
			}
		}
		shoot_aim = clamp(shoot_aim, 3, 60);
	}
}
else {
    if (path_index != -1){
        path_end();
    }
    
    if (action_timer != -1){
		action_timer--;
		if (action_timer == -1){
			gui = true;
		}
	}
	else if (ammoload){
		if (ammo == maxammo){
			shoot = true;
			gui = false;
			canmove = true;
			ammoload = false;
		}
		else {
			if (image_index >= image_number - 1){
				image_index = 0;
				ammo++;
			}
		}
	}
    else if (gui){
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
					if (item == 0){
						shoot = true;
						ItemAddScript(0);
						item = -1;
					}
					else if (item == 1){
						if (ItemCheckScript(0)){
							if (ammo <= 0){
								item = -1;
								canmove = false;
								ammoload = true;
								image_index = 0;
							}
						}
					}
					else if (item == 15){
						ItemAddScript(16);
						item = -1;
					}
					else if (global.item_data[item, 2] == 2){
						canmove = false;
						throw = true;
					}
					else if (global.item_data[item, 2] == 4){
						ItemAddScript(item - 1);
						item = -1;
					}
				}
            }
            else {
                //Switch Items
                var item_switch = false;
				if (position_meeting(mouse_scale_x, mouse_scale_y, oInventorySlot)){
                    var inst_item = instance_position(mouse_scale_x, mouse_scale_y, oInventorySlot);
                    if (inst_item != noone){
						if (inst_item.combo_item != -1){
							if (item == -1){
								inst_item.item = inst_item.combo_item;
								inst_item.combo_item = -1;
								combo_slot1 = -1;
								combo_slot2 = -1;
								action_timer = action_wait;
								gui = false
							}
						}
						if (action_timer == -1){
							var temp_item = inst_item.item
							inst_item.item = item;
							item = temp_item;
						}
						item_switch = true;
                    }
                }
				if (max(combo_slot1, combo_slot2) != -1 or item != -1){
					if (point_distance(mouse_scale_x, mouse_scale_y, x - 17, y - 20) <= 7.5){
						var temp_combo_item1 = item;
						item = combo_slot1;
						combo_slot1 = temp_combo_item1;
						item_switch = true;
					}
					else if (point_distance(mouse_scale_x, mouse_scale_y, x + 19, y - 20) <= 7.5){
						var temp_combo_item2 = item;
						item = combo_slot2;
						combo_slot2 = temp_combo_item2;
						item_switch = true;
					}
				}
				if (!item_switch){
					if (point_distance(mouse_scale_x, mouse_scale_y, anna_x, anna_y - 20) > 42){
						if (position_meeting(mouse_scale_x, mouse_scale_y, oMove)){
							if (!position_meeting(mouse_scale_x, mouse_scale_y, oSolid)){
								if (item != -1){
									gui = false;
									canmove = true;
									drop = true;
									AnnaMoveScript(mouse_scale_x, mouse_scale_y);
								}
							}
						}
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
	else if (drop){
		if (item != -1){
			var dropped_item = false;
			for (var u = 5; u > 2; u--){
				var drop_x = x + (u * image_xscale);
				var can_drop_item = (position_meeting(drop_x, round(y + 1), oMove) and (!position_meeting(drop_x, round(y + 1), oSolid)));
				if (can_drop_item){
						dropped_item = true;
						with(instance_create_depth(drop_x, round(y + 4), round(-1 * (y + 4)), global.item_data[item, 3])){
							pick_up_text = noone;
						}
						break;
				}
			}
			if (dropped_item){
				item = -1;
			}
		}
		if (!pick){
			drop = false;
			drop_start = true;
			canmove = true;
		}
	}
	else if (throw){
		var anna_x_throwpos = anna_x;
		var anna_y_throwpos = (anna_y - 20);
		
		inside_throw_distance = (sqr(mouse_scale_x - anna_x_throwpos) / sqr(150) + sqr(mouse_scale_y - anna_y_throwpos) / sqr(54));
		outside_throw_distance = (sqr(mouse_scale_x - anna_x_throwpos) / sqr(48) + sqr(mouse_scale_y - anna_y_throwpos) / sqr(28));
		
		canthrow1 = false;
		canthrow2 = false;
		if (instance_position(mouse_scale_x, mouse_scale_y, oMove) != noone){
			canthrow1 = true;
		}
		if (instance_position(mouse_scale_x, mouse_scale_y, oSolid) == noone){
			canthrow2 = true;
		}
		
		var canthrow = false;
		if (canthrow1){
			if (canthrow2){
				if (inside_throw_distance <= 1){
					if (outside_throw_distance >= 1){
						canthrow = true;
					}
				}
			}
		}
		
		if (mouse_click){
            if (self_box_click){
				gui = true;
				throw = false;
			}
			else if (canthrow){
				var temp_throw = instance_create_depth(x, y, -y, oThrow);
				temp_throw.start_x = anna_x_throwpos;
				temp_throw.start_y = anna_y_throwpos;
				with(temp_throw){
					ThrowScript(other.mouse_scale_x, other.mouse_scale_y, start_x, start_y, path);
					path_start(path, spd, path_action_stop, true);
					path_set_kind(path, 0);
				}
				ItemAddScript(item);
				item = -1;
				gui = false;
				throw = false;
				canmove = true;
			}
		}
	}
}

//Move Inventory
var empty_slot = true;
for (i = 0; i < 12; i++){
    if (item_slot[i] != noone){
        item_slot[i].x = lengthdir_x(gui_circle_length, ((360 / 12) * -i) + 90) + x;
        item_slot[i].y = lengthdir_y(gui_circle_length, ((360 / 12) * -i) + 90) + y - 20;
        
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

//Light Source
var light_equip = false;
for (var l = 0; l < 14; l++){
	if (!light_equip){
		if (l < 12){
			if (item_slot[l].item != -1){
				if (global.item_data[item_slot[l].item, 2] == 4){
					light_equip = true;
				}
			}
		}
		else {
			if (l == 12){
				if (item != -1){
					if (global.item_data[item, 2] == 4){
						light_equip = true;
					}
				}
			}
			else if (l == 13){
				if (combo_slot1 != -1){
					if (global.item_data[combo_slot1, 2] == 4){
						light_equip = true;
					}
				}
			}
			else if (l == 14){
				if (combo_slot2 != -1){
					if (global.item_data[combo_slot2, 2] == 4){
						light_equip = true;
					}
				}
			}
		}
	}
	else {
		break;
	}
}
light = light_equip;

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
