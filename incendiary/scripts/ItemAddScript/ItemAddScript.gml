///ItemAddScript(item_id, item_stack);

var temp_stack = argument1;

var i;
for (i = 0; i < 12; i++){
	if (temp_stack > 0){
		if (oAnna.item_slot[i].item == argument0){
			if (oAnna.item_slot[i].item_stack < global.item_data[argument0, 2]){
				var item_add_stack = clamp(global.item_data[argument0, 2] - oAnna.item_slot[i].item_stack, 0, temp_stack);
				oAnna.item_slot[i].item_stack += item_add_stack;
				temp_stack -= item_add_stack;
			}
		}
	}
}
for (i = 0; i < 12; i++){
	if (temp_stack > 0){
		if (oAnna.item_slot[i].item == -1){
			var item_add_stack = clamp(temp_stack, 0, global.item_data[argument0, 2]);
	        oAnna.item_slot[i].item = argument0;
			oAnna.item_slot[i].item_stack = item_add_stack;
			temp_stack -= item_add_stack;
	    }
	}
}
return temp_stack;
