left = keyboard_check(ord('A'));
right = keyboard_check(ord('D'));
up = keyboard_check(ord('W'));
down = keyboard_check(ord('S'));

xVector = right - left;
yVector = down - up;

return arctan2(yVector, xVector);
