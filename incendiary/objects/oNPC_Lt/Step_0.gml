///Step Event

//Settings
depth = -y;
action.x = x;
action.y = y - 58;
action.selected = selected;

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
        if (abs(oAnna.x - move_x) < 1){
            if (abs(oAnna.y - move_y) < 1){
                oAnna.canmove = false;
                oAnna.moving = false;
				oAnna.walking = false;
                talk = true;
                event = 0;
                talk_reset = true;
				talk_end = false;
            }
        }
    }
}

//Talking Event
if (talk){
    //text order
    if (talk_reset){
        temp_text = noone;
        if (text_index == 1){
            temp_text = text1;
            if (text2 != noone){
                text_index++;
            }
        }
        else if (text_index == 2){
            temp_text = text2;
            if (text3 != noone){
                text_index++;
            }
            else {
                text_index = 1;
            }
        }
        else if (text_index == 3){
            temp_text = text3;
            if (text4 != noone){
                text_index++;
            }
            else {
                text_index = 1;
            }
        }
        else if (text_index == 4){
            temp_text = text4;
            if (text5 != noone){
                text_index++;
            }
            else {
                text_index = 1;
            }
        }
        else if (text_index == 5){
            temp_text = text5;
            text_index = 1;
        }
        talk_reset = false;
    }

	if (oAnna.x - x != 0){
		if (oAnna.stand_still){
			oAnna.image_xscale = sign(x - oAnna.x);
		}
	}

    //Text
    if (!instance_exists(oText)){
        if (event < array_height_2d(temp_text)){
            var text_x = 0;
            var text_y = 0;
            draw_set_font(temp_text[event, 3]);
            if (temp_text[event, 1] == -1){
                text_x = oAnna.x;
                text_y = oAnna.y - (text_displace_y + (string_height_ext(temp_text[event, 0], -1, 220) / 2));
            }
            else {
                text_x = temp_text[event, 1].x;
                text_y = temp_text[event, 1].y - ((((temp_text[event, 1].sprite_height div 4) * 3) + 8) + (string_height_ext(temp_text[event, 0], -1, 220) / 2));
            }
            TextFontScript(text_x, text_y, temp_text[event, 0], temp_text[event, 3], temp_text[event, 2], 220, text_spd);
            event++;
        }
        else {
            oAnna.canmove = true;
            talk = false;
            selected = false;
			talk_end = true;
        }
    }
}

