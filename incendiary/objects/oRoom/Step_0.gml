/// @description Narp

if (touch){
	if (trans_obj == noone){
		trans_obj = AnnaTransitionScript(transition_type);
	}
	if (trans_obj.trans){
		if (room == room_type){
			if (instance_exists(oAnna)){
				for (var c = 0; c < 12; c++){
					oAnna.item_slot[c].item = anna_items[c];
				}
				oAnna.ammo = anna_ammo;
				for (var i = 0; i < instance_number(oRoom); i++){
					var inst_room = instance_find(oRoom, i);
					if (inst_room.room_type = previous_room){
						oAnna.x = inst_room.move_x;
						oAnna.y = inst_room.move_y;
						break;
					}	
				}
				instance_destroy(trans_obj);
				instance_destroy();
			}
		}
		else {
			instance_destroy(oAnna);
			room_goto(room_type);
		}
	}
}
else {
	if (active){
		if (point_in_rectangle(oAnna.x, oAnna.y, x, y, x + (sprite_width * image_xscale), y + (sprite_height * image_yscale))){
			touch = true;
			
			oAnna.canmove = false;
		    oAnna.moving = false;
			oAnna.walking = false;
			
			var anna_item = oAnna.item;
			for (var c = 0; c < 12; c++){
				anna_items[c] = oAnna.item_slot[c].item;
				if (anna_item != -1){
					if (anna_items[c] == -1){
						anna_items[c] = anna_item;
						anna_item = -1;
					}
				}
			}
			anna_ammo = oAnna.ammo;
		}
	}
}

visible = global.debug;