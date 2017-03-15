///TextScript(x, y, text, shiftingtext, shifttype, color, spd);

with(instance_create_layer(argument0, argument1, layer_get_id("Solids_Layer"), oTextShake)){
    text = argument2;
	shift_text = argument3;
	shift_style = argument4;
    text_color = argument5;
    spd = argument6;
}
