CONTROL_SLIDE = ord('C');
CONTROL_HOOK = ord('X');
CONTROL_JUMP = vk_space;

CONTROL_LEFT = ord('A');
CONTROL_RIGHT = ord('D');


FRICTION = .15;
ACCELERATION = 1.05;

Y_FRICTION = .03;
GRAVITY = 1;
JUMP_STRENGTH = 14;
HOOK_RELEASE_JUMP = -14;

currentSpeed = 0;

lineList = ds_list_create();

directionVector[0] = 0;
directionVector[1] = 0;

currentMovement[0] = 0;
currentMovement[1] = 0;

frictionVector[0] = 0;
frictionVector[1] = 0;

movementPosition[0] = xstart;
movementPosition[1] = ystart;

collisionPoint[0] = xstart;
collisionPoint[1] = ystart;

//Hook
hooking = false;

HOOK_SPEED = 25;
HOOK_STRENGTH = 0.5;

hookPoint[0] = 0;
hookPoint[1] = 0;

hookDirection[0] = 0;
hookDirection[1] = 0;

//Sliding
sliding = false
slideBoost = false;
slideAnimationFix = 0;

//Jumping
jumpAnimationFix = 0;

//Falling
fallAnimationFix = 0;
previousFall = 0;

hurt = false;
