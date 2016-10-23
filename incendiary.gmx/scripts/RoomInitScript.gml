//RoomInitScript();
if (instance_exists(oAnna)){
    if (instance_exists(oMove)){
        var cellwidth = 1;
        var cellheight = 1;
        
        var grid = mp_grid_create(oMove.x, oMove.y, oMove.sprite_width div cellwidth, oMove.sprite_height div cellheight, cellwidth, cellheight);
        mp_grid_add_instances(grid, oSolid, true);
        AnnaMoveGridScript(grid);
    }
}
