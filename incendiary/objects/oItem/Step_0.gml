///Step Event

//Settings
depth = -y;
action.x = x;
action.y = y - (sprite_height div 2);
action.selected = selected;
draw_set_font(text_font);

x = round(x);
y = round(y);

//Clicked & Character Move Script
if (action.clicked){
    with(oItem){
        selected = false;
    }
    with(oInspect){
        selected = false;
    }
    with(oNPC){
        selected = false;
    }
	with(oRoom){
        selected = false;
    }
    AnnaMoveScript(move_x, move_y);
    action.clicked = false;
    selected = true;
}

//Selected & Character Touch Event
if (selected){
    if (!oAnna.moving){
        selected = false;
    }
    else {
		if (point_distance(oAnna.x, oAnna.y, move_x, move_y) <= 1){
            oAnna.canmove = false;
            oAnna.moving = false;
			oAnna.walking = false;
			oAnna.shoot = false;
            pick_up = true;
			pick_ani = true;
			pick_ani_end = false;
            event = 0;
		}
    }
}

//Item Scripts & Dialogue
if (pick_up){
    if (can_pick){
        if (!instance_exists(oText)){
            if (event < array_height_2d(pick_up_text)){
                if (type == 0){
                        pick_up_text[event, 1] = oAnna.x;
                        pick_up_text[event, 2] = oAnna.y - (text_displace_y + (string_height_ext(pick_up_text[event, 0], -1, 120) / 2));
                        pick_up_text[event, 3] = c_white;
                }
                TextScript(pick_up_text[event, 1], pick_up_text[event, 2], pick_up_text[event, 0], pick_up_text[event, 3], text_spd);
                event++;
            }
            else {
				if (pick_ani){
					oAnna.pick = true;
					oAnna.image_index = 0;
					pick_ani = false;
				}
				else {
					if (oAnna.sprite_index == sAnnaItem){
						if (oAnna.image_speed == -1){
							pick_ani_end = true;
						}
					}
				}
				
				if (pick_ani_end){
					if(ItemAddScript(item)){
					    with (action){
					        instance_destroy();
					    }
					    instance_destroy();
					    oAnna.gui = true;
					}
					else {
					    if (put_down){
					        TextScript(oAnna.x, oAnna.y - (text_displace_y + (string_height_ext(no_room_text, -1, 120) / 2)), no_room_text, c_white, text_spd);
					        put_down = false;
					    }
					    else {
					        oAnna.canmove = false;
					        pick_up = false;
					        put_down = true;
					        selected = false;
							oAnna.gui = true;
						}
					}
				}	
            }
        }
    }
    else {
        if (!instance_exists(oText)){
            if (event < array_height_2d(put_down_text)){
                if (type == 0){
                        put_down_text[event, 1] = oAnna.x;
                        put_down_text[event, 2] = oAnna.y - (text_displace_y + (string_height_ext(put_down_text[event, 0], -1, 120) / 2));
                        put_down_text[event, 3] = c_white;
                }
                TextScript(put_down_text[event, 1], put_down_text[event, 2], put_down_text[event, 0], put_down_text[event, 3], text_spd);
                event++;
            }
            else {
                oAnna.canmove = true;
                pick_up = false;
                selected = false;
            }
        }
    }
}

