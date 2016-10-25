//RoomInitScript();

//Anna
if (!instance_exists(oAnna)){
    instance_create(room_width / 2, room_height / 2, oAnna);
}

//Grid
if (instance_exists(oAnna)){
    if (instance_exists(oMove)){
        var cellwidth = 1;
        var cellheight = 1;
        
        var grid = mp_grid_create(oMove.x, oMove.y, oMove.sprite_width div cellwidth, oMove.sprite_height div cellheight, cellwidth, cellheight);
        mp_grid_add_instances(grid, oSolid, true);
        oAnna.grid = grid;
    }
}
