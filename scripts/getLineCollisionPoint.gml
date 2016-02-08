Ax = argument0;
Ay = argument1;

Bx = argument2;
By = argument3;

Cx = argument4;
Cy = argument5;

Dx = argument6;
Dy = argument7;

/*
    E = B-A = ( Bx-Ax, By-Ay )
    F = D-C = ( Dx-Cx, Dy-Cy ) 
    P = ( -Ey, Ex )
    h = ( (A-C) * P ) / ( F * P )

    intersection = C + F*h
*/

Ex = Bx - Ax;
Ey = -(By - Ay);

Fx = Dx - Cx;
Fy = Dy - Cy;


FP = Fx * Ey + Fy * Ex;

if (FP == 0) {
    return noone;
}


h = ((Ax - Cx) * Ey + (Ay - Cy) * Ex) / FP;



if (h >= 0 && h <= 1) {
    //intersection = ds_map_create();
    
    //intersection[? "x"] = Cx + Fx * h;
    //intersection[? "y"] = Cy + Fy * h;
    
    return "ab"//intersection;
} else {

    return ""//noone;
}









/*
Ex = Bx - Ax;
Ey = By - Ay;

Fx = Dx - Cx;
Fy = Dy - Cy;

Px = -Ey;
Py = Ex;

FP = Fx * Px + Fy * Py;

if (FP == 0) {
    return noone;
}

ACx = Ax - Cx;
ACy = Ay - Cy;

ACP = ACx * Px + ACy * Py;

h = ACP / FP;

if (h >= 0 && h <= 1) {
    Fhx = Fx * h;
    Fhy = Fy * h;
    
    Ix = Cx + Fhx;
    Iy = Cy + Fhy;
    
    intersection = ds_map_create();
    
    intersection[? "x"] = Ix;
    intersection[? "y"] = Iy;
    
    return intersection;
} else {
    return noone;
}
*/
