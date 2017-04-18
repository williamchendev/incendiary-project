///Draw

//Action
if (point_distance(oAnna.mouse_scale_x, oAnna.mouse_scale_y, action.x, action.y) <= (24)){
	//Outline
	if (oAnna.canmove){
		if (!oAnna.shoot){
		    if (!selected){
		        OutlineScript(sprite_index, image_index, outline_surface);
		    }
		}
	}
    
    action.prox = true;
}
else {
    action.prox = false;
}

//Sin Value
if (sin_val < 1){
    sin_val += 0.007;
}
else {
    sin_val = 0;
}

draw_set_alpha(1);
draw_set_color(c_black);

if (buy){
	//Round Rectangle + Trade Sprite
	var x_pos = barter.x;
	var y_pos = barter.y - 76;
	draw_roundrect(x_pos - 51, y_pos - 22, x_pos + 51, y_pos + 22, false);
	draw_sprite(sTrade, 0, x_pos + 1, y_pos + 1);
	
	draw_set_color(c_white);
	draw_roundrect(x_pos - 49, y_pos - 20, x_pos + 49, y_pos + 20, true);
	
	//Player Offers
	var trade_num = 0;
	var trade_value = 0;
	for (var i = 0; i < 2; i++){
		for (var v = 0; v < 2; v++){
			var sin_draw = (sin(2 * pi * (sin_val + (trade_num * 0.25))) + 1) / 2;
			var temp_x_pos = (x_pos - 39) + (abs(v - i) * 20);
			var temp_y_pos = (y_pos - 10) + (i * 20);
			
			draw_set_alpha(1);
			draw_circle(temp_x_pos, temp_y_pos, 6 + (sin_draw * 3), true);
			
			if (point_distance(temp_x_pos, temp_y_pos, oAnna.mouse_scale_x, oAnna.mouse_scale_y) < 9){
				draw_set_alpha(0.6);
				draw_circle(temp_x_pos, temp_y_pos, 5 + (sin_draw * 2), false);
			}
			
			draw_set_alpha(1);
			
			if (trade[trade_num] != -1){
				draw_sprite(sInventoryItems, trade[trade_num], temp_x_pos + 1, temp_y_pos + 1);
				trade_value += global.item_data[trade[trade_num], 4];
			}
			trade_num++;
		}
	}
	
	//Tradable
	var sin_trade = (sin(2 * pi * (sin_val + 0.125)) + 1) / 2;
	if (point_distance(x_pos + 25, y_pos - 8, oAnna.mouse_scale_x, oAnna.mouse_scale_y) < 9){
		draw_set_alpha(0.6);
		draw_circle(x_pos + 25, y_pos - 8, 5 + (sin_trade * 2), false);
	}
	
	draw_set_alpha(1);
	draw_set_font(DebugFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (trade_value < round(global.item_data[item, 4] * cost)){
		draw_set_alpha(0.6);
		draw_set_color(make_color_rgb(155, 59, 69));
	}
	draw_circle(x_pos + 25, y_pos - 8, 6 + (sin_trade * 3), true);
	draw_set_color(c_white);
	draw_text_ext(x_pos + 26, y_pos + 12, global.item_data[item, 0], 7, 40);
	draw_sprite(sInventoryItems, item, x_pos + 26, y_pos - 7);
	
	if (global.debug){
		draw_set_alpha(1);
		draw_set_color(c_black);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_text(x_pos - 48, y_pos - 27, "Trade: " + string(trade_value) + " Real: " + string(global.item_data[item, 4]) + " Total: " + string(round(global.item_data[item, 4] * cost)));
	}
}

draw_set_alpha(1);
draw_set_color(c_black);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

draw_self();