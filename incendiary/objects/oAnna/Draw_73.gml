///Draw End

//Menu
var view_x = view_set_x;
var view_y = view_set_y;

draw_sprite(sMenu, 0, view_x + 480 - 16, view_y);
var sin_draw = (sin(2 * pi * sin_val) + 1) / 2;

//Combine
if (action_timer != -1){
	var anna_wait_length = (action_timer / action_wait) * 26;
	draw_set_color(make_color_rgb(200, 200, 200));
	draw_rectangle(anna_x - anna_wait_length, anna_y + 7, anna_x + anna_wait_length, anna_y + 8, false);
	draw_set_color(make_color_rgb(230, 230, 230));
	draw_rectangle(anna_x - anna_wait_length, anna_y + 6, anna_x + anna_wait_length, anna_y + 7, false);
	draw_set_color(c_black);
}

//Throwing
if (throw){
	var anna_x_throwpos = anna_x;
	var anna_y_throwpos = anna_y - 20;
	
	var max_arc_alpha = 0.2;
	if (canthrow1){
		if (canthrow2){
			if (outside_throw_distance >= 1){
				max_arc_alpha = 1;
			}
		}
	}
	var arc_alpha = clamp((1 - inside_throw_distance)+ 0.6, 0, max_arc_alpha);
	DrawArcScript(anna_x_throwpos, anna_y_throwpos, mouse_scale_x - 1, mouse_scale_y - 2, make_color_rgb(155, 143, 141), c_white, arc_alpha, surface_arc_1, surface_arc_2);
}

//Shooting
if (shoot){
	var can_reload = false;
	if (!walking){
		if (ammo <= 0){
			if (ItemCheckScript(1)){
				if (reload_alpha < 1){
					reload_alpha += 0.02;
				}
				can_reload = true;
			}
		}
	}
	else {
		reload_alpha = 0;
	}
	if (!can_reload){
		reload_alpha = 0;
	}
	if (!canmove){
		reload_alpha = 0;
	}
	
	if (reload_alpha > 0){
		if (!ammoload){
			draw_sprite_ext(sActions, 8, anna_x, anna_y - 54, 1, 1, 0, c_white, clamp(reload_alpha, 0, 1));
		}
	}
}
else {
	reload_alpha = 0;
}

//Inventory
if (gui){
	var xi = round(x);
	var yi = round(y);
	
	var desc_text_distance = 82;
	
	//Item Text
	if (max(combo_slot1, combo_slot2) != -1){
		draw_set_halign(fa_center);
		draw_set_font(DebugFont);
		
		//Surface Outlines
		if (!surface_exists(item_text_surface)){
			item_text_surface = surface_create(room_width, room_height);
		}
		surface_set_target(item_text_surface);
		draw_clear_alpha(c_black, 0);
	
		draw_set_alpha(1);
		draw_set_color(c_black);
		shader_set(shader_outline);
	
		var temp_combo1_text = "";
		var temp_combo2_text = "";
		var temp_combo3_text = "";
		if (combo_slot1 != -1){
			temp_combo1_text = global.item_data[combo_slot1, 0];
		}
		if (combo_slot2 != -1){
			temp_combo2_text = global.item_data[combo_slot2, 0];
		}
		if (min(combo_slot1, combo_slot2) != -1){
			temp_combo2_text = " + " + global.item_data[combo_slot2, 0];
			if (CraftScript(combo_slot1, combo_slot2) != -1){
				temp_combo3_text = "\"" + global.item_data[CraftScript(combo_slot1, combo_slot2), 0] + "\"";
			}
		}
		var temp_combo_item_text = temp_combo1_text + temp_combo2_text;
		
		draw_text(xi + 2, yi - desc_text_distance, temp_combo_item_text);
		draw_text(xi + 1, yi - (desc_text_distance + 1), temp_combo_item_text);
		draw_text(xi, yi - desc_text_distance, temp_combo_item_text);
		draw_text(xi + 1, yi - (desc_text_distance - 1), temp_combo_item_text);
		
		draw_text(xi + 2, yi - (desc_text_distance - 8), temp_combo3_text);
		draw_text(xi + 1, yi - (desc_text_distance - 7), temp_combo3_text);
		draw_text(xi, yi - (desc_text_distance - 8), temp_combo3_text );
		draw_text(xi + 1, yi - (desc_text_distance - 9), temp_combo3_text);
		
		shader_reset();
		surface_reset_target();
					
		draw_surface_ext(item_text_surface, 0, 0, 1, 1, 0, make_color_rgb(84, 28, 34), 0.8);
		
		draw_set_alpha(1);
		draw_set_color(make_color_rgb(229, 229, 229));
	    draw_text(xi + 1, yi - desc_text_distance, temp_combo_item_text);
		draw_text(xi + 1, yi - (desc_text_distance - 8), temp_combo3_text );
	}
    else if (position_meeting(mouse_scale_x, mouse_scale_y, oInventorySlot)){
		var inst_item = instance_position(mouse_scale_x, mouse_scale_y, oInventorySlot);
        if (inst_item != noone){
            if (inst_item.item != -1){
                if (inst_item.alpha > 0.5){
					draw_set_halign(fa_center);
					draw_set_font(DebugFont);
					
					//Surface Outlines
					if (!surface_exists(item_text_surface)){
						item_text_surface = surface_create(room_width, room_height);
					}
					surface_set_target(item_text_surface);
					draw_clear_alpha(c_black, 0);
	
					draw_set_alpha(1);
					draw_set_color(c_black);
					shader_set(shader_outline);
					
					draw_text(xi + 2, yi - desc_text_distance, global.item_data[inst_item.item, 0]);
					draw_text(xi + 1, yi - (desc_text_distance + 1), global.item_data[inst_item.item, 0]);
					draw_text(xi, yi - desc_text_distance, global.item_data[inst_item.item, 0]);
					draw_text(xi + 1, yi - (desc_text_distance - 1), global.item_data[inst_item.item, 0]);
					draw_text(xi + 2, yi - (desc_text_distance - 8), "\"" + global.item_data[inst_item.item, 1] + "\"");
					draw_text(xi + 1, yi - (desc_text_distance - 7), "\"" + global.item_data[inst_item.item, 1] + "\"");
					draw_text(xi, yi - (desc_text_distance - 8), "\"" + global.item_data[inst_item.item, 1] + "\"");
					draw_text(xi + 1, yi - (desc_text_distance - 9), "\"" + global.item_data[inst_item.item, 1] + "\"");
					shader_reset();
					surface_reset_target();
					
					draw_surface_ext(item_text_surface, 0, 0, 1, 1, 0, make_color_rgb(41, 56, 79), 0.8);
					
					//Item Desc Text
					draw_set_alpha(1);
					draw_set_color(make_color_rgb(229, 229, 229));
	                draw_text(xi + 1, yi - desc_text_distance, global.item_data[inst_item.item, 0]);
                    draw_text(xi + 1, yi - (desc_text_distance - 8), "\"" + global.item_data[inst_item.item, 1] + "\"");
                }
            }
        }
    }
	
	//Item Combo Draw
	if (max(combo_slot1, combo_slot2) != -1 or item != -1){
		//Settings
		var combo_distance = 18;
		
		draw_set_alpha(clamp(0.6 + sign(combo_slot1 + 1), 0, 1));
		draw_set_color(make_color_rgb(230, 230, 230));
		draw_circle(xi - combo_distance, yi - 20, 6 + (sin_draw * 2.5), false);
		draw_set_color(make_color_rgb(84, 28, 34));
		draw_circle(xi - combo_distance, yi - 20, 6 + (sin_draw * 2.5), true);
		
		if (combo_slot1 != -1){
			draw_sprite(sInventoryItems, combo_slot1, xi - (combo_distance - 1), yi - 18);
		}
		
		draw_set_alpha(clamp(0.6 + sign(combo_slot2 + 1), 0, 1));
		draw_set_color(make_color_rgb(230, 230, 230));
		draw_circle(xi + combo_distance, yi - 20, 6 + (2.5 - (sin_draw * 2.5)), false);
		draw_set_color(make_color_rgb(84, 28, 34));
		draw_circle(xi + combo_distance, yi - 20, 6 + (2.5 - (sin_draw * 2.5)), true);
		
		if (combo_slot2 != -1){
			draw_sprite(sInventoryItems, combo_slot2, xi + (combo_distance + 1), yi - 18);
		}
	}
	draw_set_color(c_black);
	draw_set_halign(fa_left);
}

//Gun GUI
if (max(ItemCheckScript(0), item == 0, combo_slot1 == 0, combo_slot2 == 0) != false){
	gungui_alpha += 0.02;
}
else {
	gungui_alpha -= 0.02;
}
gungui_alpha = clamp(gungui_alpha, 0, 1);
draw_set_alpha(gungui_alpha);
draw_sprite(sGunGUI, 0, view_x + 2, view_y + 240);

var ammo_count;
for (ammo_count = 0; ammo_count < ammo; ammo_count++){
	var rect_start_x = 100 + view_x + (ammo_count * 8);
	var rect_start_y = 252 + view_y;
	draw_set_alpha(sqr(gungui_alpha * 0.6));
	draw_set_color(make_color_rgb(167, 90, 33));
	draw_rectangle(rect_start_x + 1, rect_start_y + 2, rect_start_x + 3, rect_start_y + 8, false);
	draw_set_alpha(gungui_alpha);
	draw_set_color(make_color_rgb(181, 176, 18));
	draw_rectangle(rect_start_x, rect_start_y + 1, rect_start_x + 2, rect_start_y + 7, false);
	draw_set_color(make_color_rgb(182, 50, 18));
	draw_rectangle(rect_start_x, rect_start_y + 1, rect_start_x + 2, rect_start_y + 5, false);
}
draw_set_alpha(1);
draw_set_color(c_black);

//Escape Key
if (escape){
	global.escape_game++;
}

if (global.escape_game != -1){
	draw_set_font(RegularFont);
	draw_set_color(make_colour_rgb(25, 25, 25));
	draw_sprite(sSandTimer, round(global.escape_game / 6), view_x, view_y);
	draw_text(view_x + 16, view_y + 4, "Exit");
	
	if (!escape){
		global.escape_game = -1;
	}
	if (global.escape_game == 80){
		game_end();
	}
}

//Debug
if (debug_key){
    global.debug = !global.debug;
	show_debug_overlay(global.debug);
}

if (global.debug){
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_font(DebugFont);
    draw_set_halign(fa_left);
    
    draw_text(view_x + 1, view_y + 1, "FPS: " + string(fps));
    draw_text(view_x + 1, view_y + 8, "Anna_x: " + string(x));
    draw_text(view_x + 1, view_y + 15, "Anna_y: " + string(y));
	draw_text(view_x + 1, view_y + 22, "Still: " + string(stand_still));
	draw_text(view_x + 1, view_y + 29, "Room: " + room_get_name(room));
	draw_text(view_x + 1, view_y + 36, "Visibility: " + string(visibility));
	
	draw_set_alpha(0.3);
    draw_set_color(c_blue);
	//draw_rectangle(anna_x - 6, anna_y - 42, anna_x + 6, anna_y + 2, false);
	//draw_circle(anna_x, anna_y - 20, 42, true);
	
	draw_set_alpha(1);
    draw_set_color(c_black);
}

//Mouse
if (!cutscene){
	if (throw != true){
	    if (item != -1){
	        draw_sprite(sInventoryItems, item, mouse_scale_x, mouse_scale_y);
	    }
	}
}