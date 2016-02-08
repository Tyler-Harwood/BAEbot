map = argument2;
vectorA = argument0;
vectorB = argument1;

ax = vectorA[? "x"];
ay = vectorA[? "y"];

bx = vectorB[? "x"];
by = vectorB[? "y"];


//Grab X collision lines
//Grab Y collision lines
//Grab all solid objects that 

startX = ax / global.TILE_SIZE;
endX = bx / global.TILE_SIZE;

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
        //check collision from A to B for each Vertical line inbetween them. 
        //We need an array of points from this
    }
}

startY = aY / global.TILE_SIZE;
endY = bY / global.TILE_SIZE;

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
        //check collision from A to B for each Vertical line inbetween them. 
        //We need an array of points from this
    }
}

//Take points from what was gathered and compare those with the 
E = B-A = ( Bx-Ax, By-Ay )
F = D-C = ( Dx-Cx, Dy-Cy ) 
P = ( -Ey, Ex )
h = ( (A-C) * P ) / ( F * P )
