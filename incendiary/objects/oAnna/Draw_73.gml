///Draw End

//Menu
var view_x = view_set_x;
var view_y = view_set_y;

draw_sprite(sMenu, 0, view_x + 480 - 16, view_y);
var sin_draw = (sin(2 * pi * sin_val) + 1) / 2;

if (gui){
	var xi = round(x);
	var yi = round(y);
	
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
		if (combo_slot1 != -1){
			temp_combo1_text = global.item_data[combo_slot1, 0];
		}
		if (combo_slot2 != -1){
			temp_combo2_text = global.item_data[combo_slot2, 0];
		}
		if (min(combo_slot1, combo_slot2) != -1){
			temp_combo2_text = " + " + global.item_data[combo_slot2, 0];
		}
		var temp_combo_item_text = temp_combo1_text + temp_combo2_text;
		draw_text(xi + 2, yi - 78, temp_combo_item_text);
		draw_text(xi + 1, yi - 79, temp_combo_item_text);
		draw_text(xi, yi - 78, temp_combo_item_text);
		draw_text(xi + 1, yi - 77, temp_combo_item_text);
		shader_reset();
		surface_reset_target();
					
		draw_surface_ext(item_text_surface, 0, 0, 1, 1, 0, make_color_rgb(84, 28, 34), 0.8);
		
		draw_set_alpha(1);
		draw_set_color(make_color_rgb(229, 229, 229));
	    draw_text(xi + 1, yi - 78, temp_combo_item_text);
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
					
					draw_text(xi + 2, yi - 78, global.item_data[inst_item.item, 0]);
					draw_text(xi + 1, yi - 79, global.item_data[inst_item.item, 0]);
					draw_text(xi, yi - 78, global.item_data[inst_item.item, 0]);
					draw_text(xi + 1, yi - 77, global.item_data[inst_item.item, 0]);
					draw_text(xi + 2, yi - 70, "\"" + global.item_data[inst_item.item, 1] + "\"");
					draw_text(xi + 1, yi - 71, "\"" + global.item_data[inst_item.item, 1] + "\"");
					draw_text(xi, yi - 70, "\"" + global.item_data[inst_item.item, 1] + "\"");
					draw_text(xi + 1, yi - 69, "\"" + global.item_data[inst_item.item, 1] + "\"");
					shader_reset();
					surface_reset_target();
					
					draw_surface_ext(item_text_surface, 0, 0, 1, 1, 0, make_color_rgb(41, 56, 79), 0.8);
					
					//Item Desc Text
					draw_set_alpha(1);
					draw_set_color(make_color_rgb(229, 229, 229));
	                draw_text(xi + 1, yi - 78, global.item_data[inst_item.item, 0]);
                    draw_text(xi + 1, yi - 70, "\"" + global.item_data[inst_item.item, 1] + "\"");
                }
            }
        }
    }
	
	//Item Combo Draw
	if (max(combo_slot1, combo_slot2) != -1 or item != -1){
		draw_set_alpha(clamp(0.6 + sign(combo_slot1 + 1), 0, 1));
		draw_set_color(make_color_rgb(230, 230, 230));
		draw_circle(xi - 15, yi - 19, 6 + (sin_draw * 2.5), false);
		draw_set_color(make_color_rgb(84, 28, 34));
		draw_circle(xi - 15, yi - 19, 6 + (sin_draw * 2.5), true);
		
		if (combo_slot1 != -1){
			draw_sprite(sInventoryItems, combo_slot1, xi - 14, yi - 18);
		}
		
		draw_set_alpha(clamp(0.6 + sign(combo_slot2 + 1), 0, 1));
		draw_set_color(make_color_rgb(230, 230, 230));
		draw_circle(xi + 15, yi - 19, 6 + (2.5 - (sin_draw * 2.5)), false);
		draw_set_color(make_color_rgb(84, 28, 34));
		draw_circle(xi + 15, yi - 19, 6 + (2.5 - (sin_draw * 2.5)), true);
		
		if (combo_slot2 != -1){
			draw_sprite(sInventoryItems, combo_slot2, xi + 16, yi - 18);
		}
	}
	draw_set_color(c_black);
}

//Gun GUI
if (ItemCheckScript(0)){
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
	draw_set_color(make_colour_hsv(0, 0, 10));
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
    draw_set_color(c_black);
    draw_set_font(DebugFont);
    draw_set_halign(fa_left);
    
    draw_text(view_x + 1, view_y + 1, "FPS: " + string(fps));
    draw_text(view_x + 1, view_y + 8, "Anna_x: " + string(x));
    draw_text(view_x + 1, view_y + 15, "Anna_y: " + string(y));
	draw_text(view_x + 1, view_y + 22, "Still: " + string(stand_still));
	draw_text(view_x + 1, view_y + 29, "Half: " + string(x - view_x) + ":240");
	
	draw_set_color(c_white);
	draw_line(view_x + 240, view_y, view_x + 240, view_y + 270);
	draw_set_color(c_black);
}

//Mouse
if (!cutscene){
    if (item != -1){
        draw_sprite(sInventoryItems, item, mouse_scale_x, mouse_scale_y);
    }
}