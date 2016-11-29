///Draw End

//Menu
draw_sprite(sMenu, 0, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) - 16, __view_get( e__VW.YView, 0 ));

if (gui){
    if (position_meeting(mouse_x, mouse_y, oInventorySlot)){
    var inst_item = instance_position(mouse_x, mouse_y, oInventorySlot);
        if (inst_item != noone){
            if (inst_item.item != -1){
                if (inst_item.alpha > 0.5){
                    draw_set_halign(fa_center);
                    draw_set_color(c_white);
                    draw_set_font(DebugFont);
                    
                    draw_set_alpha(0.3);
                    draw_text(x + 1, y - 75, string_hash_to_newline(item_data[inst_item.item, 0]));
                    draw_set_alpha(1);
                    draw_text(x + 1, y - 76, string_hash_to_newline(item_data[inst_item.item, 0]));
                    
                    draw_set_alpha(0.3);
                    draw_text(x + 1, y - 67, string_hash_to_newline("\"" + item_data[inst_item.item, 1] + "\""));
                    draw_set_alpha(1);
                    draw_text(x + 1, y - 68, string_hash_to_newline("\"" + item_data[inst_item.item, 1] + "\""));
                    
                    draw_set_halign(fa_left);
                }
            }
        }
    }
}

//Item
if (!cutscene){
    if (item != -1){
        draw_sprite(sInventoryItems, item, mouse_x, mouse_y);
    }
}

//Debug
if (debug_key){
    global.debug = !global.debug;
}

if (global.debug){
    draw_set_alpha(1);
    draw_set_color(c_black);
    draw_set_font(DebugFont);
    draw_set_halign(fa_left);
    
    draw_text(__view_get( e__VW.XView, 0 ) + 1, __view_get( e__VW.YView, 0 ), string_hash_to_newline("FPS: " + string(fps)));
    draw_text(__view_get( e__VW.XView, 0 ) + 1, __view_get( e__VW.YView, 0 ) + 7, string_hash_to_newline("Anna_x: " + string(x)));
    draw_text(__view_get( e__VW.XView, 0 ) + 1, __view_get( e__VW.YView, 0 ) + 14, string_hash_to_newline("Anna_y: " + string(y)));
}

