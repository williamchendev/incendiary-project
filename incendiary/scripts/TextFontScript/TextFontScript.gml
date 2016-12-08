///TextFontScript(x, y, text, font, color, width, spd);

with(instance_create_layer(argument0, argument1, layer_get_id("Solids_Layer"), oText)){
    text = argument2;
    text_font = argument3;
    text_color = argument4;
    text_limit = argument5;
    spd = argument6;
}
