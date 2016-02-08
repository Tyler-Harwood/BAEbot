vector = argument0;

var xVector = vector[@ 0];
var yVector = vector[@ 1];

c = sqrt(sqr(xVector) + sqr(yVector));

if(xVector == 0) {
    vector[@ 0] = 0;
} else {
    vector[@ 0] = xVector / c;
}

if(yVector == 0) {
    vector[@ 1] = 0;
} else {
    vector[@ 1] = yVector / c;
}

vector[@ 2] = c;