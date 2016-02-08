directionVector = argument0;

resetVector(directionVector);

left = keyboard_check(CONTROL_LEFT);
right = keyboard_check(CONTROL_RIGHT);

directionVector[@ 0] = right - left;
directionVector[@ 0] = 1;

normalizeVector(directionVector);

//TODO: GamePad can return more accurate values than 0 / 1 for directions