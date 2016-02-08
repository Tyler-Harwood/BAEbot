requestedPosition = argument0;

requestedX = requestedPosition[@ 0] % (3 * global.SCREEN_TILE_WIDTH * global.TILE_SIZE);
requestedY = requestedPosition[@ 1] % (3 * global.SCREEN_TILE_HEIGHT * global.TILE_SIZE);

requestedMapX = floor(requestedX / global.TILE_SIZE);
requestedMapY = floor(requestedY / global.TILE_SIZE);

//Top of screen collision
if (requestedMapX < 0 ||
    requestedMapY < 0 ||
    requestedMapX >= ds_grid_width(global.collisionMap) ||
    requestedMapY >= ds_grid_height(global.collisionMap)) {
    return false;    
}

return global.collisionMap[# requestedMapX, requestedMapY];