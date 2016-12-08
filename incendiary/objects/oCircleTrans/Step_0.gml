///Step Event

time += spd;

if (time >= (750 / 2) + limit_add + (wait * spd)){
    instance_destroy();
}

