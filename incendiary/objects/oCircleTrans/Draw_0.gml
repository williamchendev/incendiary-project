///Draw Event

draw_set_alpha(1);
draw_set_color(color);

for (w = 0; w <= (__view_get( e__VW.WView, 0 ) / radius); w++){
    for (h = 0; h <= (__view_get( e__VW.HView, 0 ) / radius); h++){
        var rad_p = ((w + h) * radius) + (radius / 2);
        var rad_q = (time - rad_p - (radius / 2)) / 24;
        
        var rad_temp = 0.7 * sqr(clamp(rad_q, 0, radius / 2));
        var over = clamp(rad_temp - (radius / 2), 0, 4);
        
        //Left
        var temp_x = __view_get( e__VW.XView, 0 ) + (w * radius) + (radius / 2);
        var temp_y = __view_get( e__VW.YView, 0 ) + (h * radius) + (radius / 2);
        draw_circle(temp_x - 1, temp_y - 1, clamp(rad_temp, 0, radius / 2) + over, false);
        
        //Right
        var temp_x = __view_get( e__VW.XView, 0 ) + (__view_get( e__VW.WView, 0 ) - ((w + 1) * radius)) + (radius / 2);
        var temp_y = __view_get( e__VW.YView, 0 ) + (__view_get( e__VW.HView, 0 ) - ((h + 1) * radius)) + (radius / 2);
        draw_circle(temp_x - 1, temp_y - 1, clamp(rad_temp, 0, radius / 2) + over, false);
    }
}

draw_set_color(c_black);

//draw_circle(view_xview, view_yview, (time * 0.75) - limit_add, false);

