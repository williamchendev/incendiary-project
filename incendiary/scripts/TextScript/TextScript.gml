///TextScript(x, y, text, color, spd);

with(instance_create_layer(argument0, argument1, layer_get_id("Solids_Layer"), oText)){
    text = argument2;
    text_color = argument3;
    spd = argument4;
}
