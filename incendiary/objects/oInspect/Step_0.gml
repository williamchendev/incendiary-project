///Step Event

//Settings
depth = -y;
action.x = x;
action.y = y - ((sprite_height div 2) + 8);
action.selected = selected;
draw_set_font(text_font);

if (inspect_type == 1){
    if (inspect_event){
        inspect_event = false;
    }
}

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
		if (!inspect_move){
			move_x = oAnna.x;
			move_y = oAnna.y;
		}
        if (abs(oAnna.x - move_x) < 1){
            if (abs(oAnna.y - move_y) < 1){
                oAnna.canmove = false;
                oAnna.moving = false;
                inspecting = true;
                event = 0;
            }
        }
    }
}

if (inspecting){
    if (!instance_exists(oText)){
        if (useful){
            if (event < array_height_2d(inspect_text)){
                if (type == 0){
                        inspect_text[event, 1] = oAnna.x;
                        inspect_text[event, 2] = oAnna.y - (text_displace_y + (string_height_ext(string_hash_to_newline(inspect_text[event, 0]), -1, 120) / 2));
                        inspect_text[event, 3] = c_white;
                }
                TextScript(inspect_text[event, 1], inspect_text[event, 2], inspect_text[event, 0], inspect_text[event, 3], text_spd);
                event++;
            }
            else {
                oAnna.canmove = true;
                inspect_event = true;
                inspecting = false;
                selected = false;
            }
        }
        else {
            if (event < array_height_2d(useless_text)){
                if (type == 0){
                        useless_text[event, 1] = oAnna.x;
                        useless_text[event, 2] = oAnna.y - (text_displace_y + (string_height_ext(string_hash_to_newline(useless_text[event, 0]), -1, 120) / 2));
                        useless_text[event, 3] = c_white;
                }
                TextScript(useless_text[event, 1], useless_text[event, 2], useless_text[event, 0], inspect_text[event, 3], text_spd);
                event++;
            }
            else {
                oAnna.canmove = true;
                inspecting = false;
                selected = false;
            }
        }
    }
}

