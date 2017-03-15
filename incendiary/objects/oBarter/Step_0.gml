///Step

//Settings
depth = -y;
action.x = x;
action.y = y - (sprite_height div 2);
action.selected = selected;

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

if (selected){
	if (!oAnna.moving){
        selected = false;
    }
    else {
        if (point_distance(oAnna.x, oAnna.y, move_x, move_y) <= 1){
            oAnna.canmove = false;
            oAnna.moving = false;
			oAnna.walking = false;
			oAnna.gui = true;
            buy = true;
        }
    }
}

if (buy){
	if (oAnna.stand_still){
		if (oAnna.x - barter.x != 0){
			oAnna.image_xscale = sign(barter.x - oAnna.x);
		}
	}
	
	if (oAnna.mouse_click){
		var trade_clicked = false;
		
		var x_pos = barter.x;
		var y_pos = barter.y - 74;
	
		var trade_num = 0;
		var trade_value = 0;
		for (var i = 0; i < 2; i++){
			for (var v = 0; v < 2; v++){
				if (!trade_clicked){
					var temp_x_pos = (x_pos - 39) + (abs(v - i) * 20);
					var temp_y_pos = (y_pos - 10) + (i * 20);
			
					if (point_distance(temp_x_pos, temp_y_pos, oAnna.mouse_scale_x, oAnna.mouse_scale_y) < 9){
						var temp_item = trade[trade_num];
						trade[trade_num] = oAnna.item;
						oAnna.item = temp_item;
						trade_clicked = true;
					}
				}
			
				if (trade[trade_num] != -1){
					trade_value += global.item_data[trade[trade_num], 4];
				}
				trade_num++;
			}
		}
		
		if (!trade_clicked){
			if (point_distance(x_pos + 25, y_pos - 10, oAnna.mouse_scale_x, oAnna.mouse_scale_y) < 9){
				if (trade_value >= round(global.item_data[item, 4] * cost)){
					if (ItemAddScript(item)){
						selected = false;
						buy = false;
						instance_destroy();
					}
				}
			}
		}
	}
	
	if (!oAnna.gui){
		for (var i = 0; i < 4; i++){
			if(ItemAddScript(trade[i])){
				trade[i] = -1;
			}
		}
		selected = false;
		buy = false;
	}
}