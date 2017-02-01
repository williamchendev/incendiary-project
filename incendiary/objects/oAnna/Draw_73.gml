///Draw End

//Menu
var view_x = view_set_x;
var view_y = view_set_y;

draw_sprite(sMenu, 0, view_x + 480 - 16, view_y);

if (gui){
    if (position_meeting(mouse_scale_x, mouse_scale_y, oInventorySlot)){
    var inst_item = instance_position(mouse_scale_x, mouse_scale_y, oInventorySlot);
        if (inst_item != noone){
            if (inst_item.item != -1){
                if (inst_item.alpha > 0.5){
					draw_set_halign(fa_center);
					draw_set_font(DebugFont);
					
					var desc_text_length = round(max(string_width(global.item_data[inst_item.item, 0]), string_width("\"" + global.item_data[inst_item.item, 1] + "\"")) / 2) + 4;
					draw_set_color(make_color_rgb(54, 61, 63));
					draw_roundrect_ext(x - desc_text_length, y - 78, x + desc_text_length, y - 62, 5, 5, false);
					draw_set_color(make_color_rgb(152, 158, 160));
					draw_roundrect_ext(x - desc_text_length, y - 78, x + desc_text_length, y - 62, 5, 5, true);
					
					draw_set_color(make_color_rgb(218, 219, 217));
					
					draw_set_alpha(0.3);
	                draw_text(x + 1, y - 75, global.item_data[inst_item.item, 0]);
					draw_set_alpha(1);
	                draw_text(x + 1, y - 76, global.item_data[inst_item.item, 0]);
                    
                    draw_set_alpha(0.3);
                    draw_text(x + 1, y - 67, "\"" + global.item_data[inst_item.item, 1] + "\"");
                    draw_set_alpha(1);
                    draw_text(x + 1, y - 68, "\"" + global.item_data[inst_item.item, 1] + "\"");
                    
                    draw_set_halign(fa_left);
                }
            }
        }
    }
}

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