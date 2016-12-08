///Step Event

//Draw Variables
if (sin_val < 1){
    sin_val += 0.007;
}
else {
    sin_val = 0;
}

x = round(x);
y = round(y);

move_x = clamp(((sin(sin_val * 2 * pi) + 1) / 2) * 3.3, 0, 4);
move_y = clamp(((cos(sin_val * 2 * pi) + 1) / 2) * 3.3, 0, 4);

//Alpha
if (exist){
    if (alpha < 1){
        alpha += 0.001;
        alpha *= 1.3;
    }
    
    if (alpha > 0.7){
        if (time < string_length(text)){
            time += spd;
        }
    }
}
else {
    if (alpha > 0){
        alpha -= 0.001;
        alpha *= 0.7;
    }
    else {
        instance_destroy();
    }
}

//Destroy
if (instance_exists(oAnna)){
    if (oAnna.mouse_click){
        if (time >= string_length(text)){
            exist = false;
        }
        else {
            time = string_length(text);
        }
    }
}

alpha = clamp(alpha, 0, 1);

