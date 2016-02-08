map = argument0;

vectorA = argument1;
vectorB = argument2;

collisionPoints = argument3;


ax = vectorA[? "x"];
ay = vectorA[? "y"];

bx = vectorB[? "x"];
by = vectorB[? "y"];

startX = floor(ax / global.TILE_SIZE);
endX = ceil(bx / global.TILE_SIZE);

var xDirection;

if (ax < bx) {
    xDirection = 1;
} else if (ax > bx) {
    xDirection = -1;
} else {
    xDirection = 0;
}

if (xDirection != 0) {
    for(i = startX; i < xDirection * endX; i += xDirection) {
        mapHeight = ds_grid_height(map);
        xPosition = i * global.TILE_SIZE;
        var collisionPoint = getLineCollisionPoint(ax, ay, bx, by, xPosition, 0, xPosition, mapHeight);
        
        if (collisionPoint != ""){//noone) {
            //ds_list_add(collisionPoints, "abc");
            ds_list_add(collisionPoints, collisionPoint);
            //ds_list_mark_as_map(collisionPoints, ds_list_size(collisionPoints) - 1 );
        }
    }
}


startY = floor(ay / global.TILE_SIZE);
endY = ceil(by / global.TILE_SIZE);

var yDirection;

if (ay < by) {
    yDirection = 1;
} else if (ay > by) {
    yDirection = -1;
} else {
    yDirection = 0;
}

if (yDirection != 0) {
    for(i = startY; i < yDirection * endY; i += yDirection) {
        mapWidth = ds_grid_width(map);
        yPosition = i * global.TILE_SIZE;
        var collisionPoint = getLineCollisionPoint(ax, ay, bx, by, 0, yPosition, mapWidth, yPosition);
        
        if (collisionPoint != ""){//noone) {
            ds_list_add(collisionPoints, "abc");
            //ds_list_add(collisionPoints, collisionPoint);
            //ds_list_mark_as_map(collisionPoints, ds_list_size(collisionPoints) - 1);
        }
    }
}

return collisionPoints;