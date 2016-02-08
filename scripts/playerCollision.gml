requestedMovement = argument0;

var HALF_TILE = global.TILE_SIZE / 2;

///////////////////////////////////

currentMapX1 = floor((x + HALF_TILE) / global.TILE_SIZE);
currentMapX2 = ceil((x - HALF_TILE) / global.TILE_SIZE);

var requestedX = x + requestedMovement[@ 0];

var mapX;

if (requestedX > x) {
    mapX = floor((requestedX + HALF_TILE) / global.TILE_SIZE);
} else if (requestedX < x) {
    mapX = floor((requestedX - HALF_TILE) / global.TILE_SIZE);
} else {
    mapX = requestedX / global.TILE_SIZE;
}


///////////////////////////////////

currentMapY1 = floor((y + HALF_TILE) / global.TILE_SIZE);
currentMapY2 = ceil((y - HALF_TILE) / global.TILE_SIZE);

var requestedY = y + requestedMovement[@ 1];

var mapY;

if (requestedY > y) {
    mapY = floor((requestedY + HALF_TILE) / global.TILE_SIZE);
} else if (requestedY < y) {
    mapY = floor((requestedY - HALF_TILE) / global.TILE_SIZE);
} else {
    mapY = requestedY / global.TILE_SIZE;
}

if(global.collisionMap[# currentMapX1, mapY] == true || global.collisionMap[# currentMapX2, mapY] == true) {
    requestedX = x;
}
   
if(global.collisionMap[# mapX, currentMapY1] == true || global.collisionMap[# mapX, currentMapY2] == true) {
    requestedY = y;
}

x = requestedX;
y = requestedY;


