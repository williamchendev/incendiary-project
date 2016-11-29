///Step Event

time += spd;

if (time >= (((__view_get( e__VW.WView, 0 ) + __view_get( e__VW.HView, 0 )) / 2) + limit_add + (wait * spd))){
    instance_destroy();
}

