///TextScript(x, y, text, shakingtext, color, spd);

with(instance_create_layer(argument0, argument1, layer_get_id("Solids_Layer"), oTextShake)){
    text = argument2;
	shake_text = argument3;
    text_color = argument4;
    spd = argument5;
}
