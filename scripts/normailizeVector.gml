vector = argument0;

xVector = vector[? "x"];
yVector = vector[? "y"];

c = sqrt(sqr(xVector) + sqr(yVector));

if(xVector == 0) {
    vector[? "x"] = 0;
} else {
    vector[? "x"] = xVector / c;
}

if(yVector == 0) {
    vector[? "y"] = 0;
} else {
    vector[? "y"] = yVector / c;
}

return vector;