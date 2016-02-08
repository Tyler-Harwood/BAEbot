clearSection = argument0;

startingX = clearSection * global.SCREEN_TILE_WIDTH;

for(var X = startingX; X < startingX + global.SCREEN_TILE_WIDTH; X++) {
    for(var Y = 0; Y < global.SCREEN_TILE_CEILING + global.SCREEN_TILE_HEIGHT; Y++) {
        global.collisionMap[# X, Y] = 0;
    }
}