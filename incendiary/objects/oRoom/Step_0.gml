/// @description Narp

var temp_ai_trans = noone;
if (click){
	if (position_meeting(move_x, move_y, oAI)){
		temp_ai_trans = instance_position(move_x, move_y, oAI);
	}
}
else {
	if (place_meeting(x, y, oAI)){
		temp_ai_trans = instance_place(x, y, oAI);
	}
}
if (temp_ai_trans != noone){
	if (temp_ai_trans.room_pathfind != noone){
		if (temp_ai_trans.rooms != noone){
			var compatible_rooms = false;
			for (var c = 1; c < array_length_1d(temp_ai_trans.room_pathfind); c++){
				if (temp_ai_trans.rooms[temp_ai_trans.room_pathfind[c]] == room){
					if (temp_ai_trans.rooms[temp_ai_trans.room_pathfind[c - 1]] == room_type){
						var compatible_rooms = true;
						break;
					}
				}
			}
			if (compatible_rooms){
				TempAIScript(temp_ai_trans, room_type);
				with (temp_ai_trans){
					instance_destroy();
				}
			}
		}
	}
}

//Clicked & Character Move Script
if (!touch){
	if (instance_exists(action)){
		//Proximity
		action.x = round(x);
		action.y = round(y - action_height);
		action.selected = selected;
		action.shoot_bypass = true;
	
		if (instance_exists(oAnna)){
			if (point_distance(oAnna.mouse_scale_x, oAnna.mouse_scale_y, action.x, action.y) <= (24)){
			    action.prox = true;
			}
			else {
			    action.prox = false;
			}
		}

		var touched = false;
		if (click){
			if (!selected){
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
			}
			else {
				if (!oAnna.moving){
			        selected = false;
			    }
			    else {
					if (point_distance(oAnna.x, oAnna.y, move_x, move_y) <= 1){
			            touched = true;
					}
			    }
			}
		}
		else {
			action.action_sprite_alpha = 0;
			if (place_meeting(x, y, oAnna)){
				touched = true;
			}
		}
	
		if (touched){
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
			anna_shoot = oAnna.shoot;
		}
	}
	else {
		instance_destroy();
	}
}
if (touch){
	with (oTempAI){
		can_spawn = false;
	}
	
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
				oAnna.shoot= anna_shoot;
				for (var i = 0; i < instance_number(oRoom); i++){
					var inst_room = instance_find(oRoom, i);
					if (inst_room.room_type = previous_room){
						oAnna.x = inst_room.move_x;
						oAnna.y = inst_room.move_y;
						oAnna.anna_x = oAnna.x;
						oAnna.anna_y = oAnna.y;
						break;
					}	
				}
			}
			instance_destroy(trans_obj);
			instance_destroy();
		}
		else {
			instance_destroy(oAnna);
			for (var i = 0; i < instance_number(oRoom); i++){
				var temp_room_inst = instance_find(oRoom, i);
				if (self != temp_room_inst){
					instance_destroy(temp_room_inst);
				}
			}
			if (instance_exists(oAI)){
				var inst_ai = noone;
				for (var o = 0; o < instance_number(oAI); o++){
					inst_ai[o] = instance_find(oAI, o);
				}
				for (var o = 0; o < array_length_1d(inst_ai); o++){
					if (!inst_ai[o].dead){
						TempAIScript(inst_ai[o], room);
					}
					with(inst_ai[o]){
						instance_destroy();
					}
				}
			} 
			room_goto(room_type);
		}
	}
}

visible = global.debug;