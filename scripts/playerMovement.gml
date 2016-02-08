if(canMove) {

convertInputToDirection(directionVector);

yPullOut = currentMovement[1];

yHold = currentMovement[1];
currentMovement[1] = 0;

jumpAnimationFix++;

if(!hit){
    disAcceleration = ACCELERATION;
    //Player acceleration
    if(SpeedBoostDuration > 0){
        disAcceleration += SpeedBoost;
        SpeedBoostDuration--;
    }
    scaleVector(directionVector, disAcceleration);
    addVector(currentMovement, directionVector);
    if(slideBoost = true) {
        currentMovement[0] += 10;
        slideBoost = false;
    }
}

//Subtract friction
copyVector(frictionVector, currentMovement);
scaleVector(frictionVector, FRICTION);
subtractVector(currentMovement, frictionVector);

//Gravity
collisionPointCheck1[0] = x + global.HALF_PLAYER_WIDTH;
collisionPointCheck1[1] = y + 1;
collisionPointCheck2[0] = x - global.HALF_PLAYER_WIDTH;
collisionPointCheck2[1] = y + 1;

asdf[0] = collisionPoint[0];
asdf[1] = collisionPoint[1] - currentMovement[1] - 1;

asdf2[0] = collisionPoint[0];
asdf2[1] = collisionPoint[1] - currentMovement[1] - 1;

//Control
asdf[0] = collisionPoint[0] - global.HALF_PLAYER_WIDTH;
asdf[1] = collisionPoint[1] + 2;

asdf2[0] = collisionPoint[0] - global.HALF_PLAYER_WIDTH;
asdf2[1] = collisionPoint[1] + 2;
//Slide
if(keyboard_check(CONTROL_SLIDE)){
    if(!sliding && currentMovement[1] == 0 && checkMapCollision(asdf) && checkMapCollision(asdf2)) {
        audio_play_sound(slide, 1, false);
        audio_sound_gain(slide, global.SFX_VOLUME, 0);
        sliding = true;
        slideBoost = false;
        slideAnimationFix = 0;
        alarm[0] = 20;
    }
}

//Jump
if (((checkMapCollision(collisionPointCheck1) == 1 || checkMapCollision(collisionPointCheck2) == 1) ||
    (checkMapCollision(collisionPointCheck1) == 2 && checkMapCollision(asdf) == 0) ||
    (checkMapCollision(collisionPointCheck2) == 2 && checkMapCollision(asdf2) == 0))
    && (keyboard_check_pressed(CONTROL_JUMP))) {
    pressedJump = true;
    audio_play_sound(jump, 1, false);
    audio_sound_gain(jump,  global.SFX_VOLUME, 0);

    asdf3[0] = x - global.HALF_PLAYER_WIDTH;
    asdf3[1] = y - global.PLAYER_SIZE_HEIGHT;

    asdf4[0] = x - global.HALF_PLAYER_WIDTH;
    asdf4[1] = y - global.PLAYER_SIZE_HEIGHT;

    if(sliding){
        if(!checkMapCollision(asdf3) && !checkMapCollision(asdf4)) {
            yHold -= JUMP_STRENGTH;
            jumpAnimationFix = 0;
            sliding = false;
        }
    } else {
        yHold -= JUMP_STRENGTH;
        jumpAnimationFix = 0;
        sliding = false;
    }
}

//Variable jump height
if(!keyboard_check(CONTROL_JUMP) && yHold < 0 && pressedJump){
    yHold *= 0.9;
}

xHold = currentMovement[0];
currentMovement[0] = 0;
currentMovement[1] = yHold;

resetVector(directionVector);

collisionPointCheck[0] = x + currentMovement[0];
collisionPointCheck[1] = y + 1;

if(checkMapCollision(collisionPointCheck) != 1) {
    directionVector[1] = 1;

    scaleVector(directionVector, GRAVITY);

    addVector(currentMovement, directionVector);
}

currentMovement[0] = xHold;

//External Forces?
//hooking
if(hooking) {
    hookCount++;
    playerHookPoint[0] = x;
    playerHookPoint[1] = y + global.HALF_PLAYER_HEIGHT;

    if(currentMovement[1] < 0) {
        currentMovement[1] = 0;
    }

    if(x < hookPoint[0] && hookDirection[0] < 4){
        hookDirection[0] += HOOK_STRENGTH;
    } else if(hookDirection[0] > 0){
        hookDirection[0] -= HOOK_STRENGTH;
    }

    if(currentMovement[1] > 0 && hookDirection[1] > -20){
        hookDirection[1] -= HOOK_STRENGTH * 1.75;
    } else {
        hookDirection[1] *= 0.9;
    }

    addVector(currentMovement, hookDirection);

    if(hookCount >= hookCountMax){
        hooking = false;
        hookCount = 0;
        with(hookshot){
            instance_destroy();
        }
    }
}

//Hook control
if(keyboard_check_pressed(CONTROL_HOOK) && !hooking && !hit){
    audio_play_sound(hook_shoot, 1, false);
    audio_sound_gain(hook_shoot,  global.SFX_VOLUME, 0);
    asdf[0] = x + global.HALF_PLAYER_WIDTH + 1;
    asdf[1] = y -1;

    if(!instance_exists(hookshot) && !sliding && !checkMapCollision(asdf)) {
        instance_create(x, y - global.HALF_PLAYER_HEIGHT, hookshot);
    }
}

if(!keyboard_check(CONTROL_HOOK) && hooking) {
    audio_play_sound(hook_release, 1, false);
    audio_sound_gain(hook_release,  global.SFX_VOLUME, 0);
    hookDirection[0] = 0;
    hookDirection[1] = 0;
    currentMovement[1] = HOOK_RELEASE_JUMP;
    hooking = false;
    with(hookshot){
        instance_destroy();
    }
}

if(!sliding) {
    //Check x
    collisionPoint[0] = x + currentMovement[0];
    collisionPoint[1] = y;

    if(collisionPoint[0] > x) {
        var collision = false;
        collisionPoint[0] += global.HALF_PLAYER_WIDTH;
        collisionPoint[1] += 0;

        if (checkMapCollision(collisionPoint) == 1) {
            collision = true;
        } else {
            collisionPoint[1] -= global.PLAYER_SIZE_HEIGHT;
            if (checkMapCollision(collisionPoint) == 1) {
                collision = true;
            }
        }

        if (collision) {
            x = floor(collisionPoint[0] / global.TILE_SIZE) * global.TILE_SIZE - global.HALF_PLAYER_WIDTH - .01;
            currentMovement[0] = 0;
        }

    } else if(collisionPoint[0] < x) {
        var collision = false;
        collisionPoint[0] -= global.HALF_PLAYER_WIDTH;
        collisionPoint[1] += 0;

        if (checkMapCollision(collisionPoint) == 1) {
            collision = true;
        } else {
            collisionPoint[1] -= global.PLAYER_SIZE_HEIGHT;
            if (checkMapCollision(collisionPoint) == 1) {
                collision = true;
            }
        }

        if (collision) {
            x = ceil(collisionPoint[0] / global.TILE_SIZE) * global.TILE_SIZE + global.HALF_PLAYER_WIDTH + .01;
            currentMovement[0] = 0;

        }
    }

    collisionPoint[0] = x + currentMovement[0];
    collisionPoint[1] = y;

    if(collisionPoint[0] > x) {
        var collision = false;
        collisionPoint[0] += global.HALF_PLAYER_WIDTH;
        collisionPoint[1] -= global.HALF_PLAYER_HEIGHT;

        if (checkMapCollision(collisionPoint) == 1) {
            collision = true;
        } else {
            collisionPoint[1] += global.HALF_PLAYER_HEIGHT;
            if (checkMapCollision(collisionPoint) == 1) {
                collision = true;
            }
        }

        if (collision) {
            x = floor(collisionPoint[0] / global.TILE_SIZE) * global.TILE_SIZE - global.HALF_PLAYER_WIDTH - .01;
            currentMovement[0] = 0;
        }

    } else if(collisionPoint[0] < x) {
        var collision = false;
        collisionPoint[0] -= global.HALF_PLAYER_WIDTH;
        collisionPoint[1] -= global.HALF_PLAYER_HEIGHT;

        if (checkMapCollision(collisionPoint) == 1) {
            collision = true;
        } else {
            collisionPoint[1] += global.HALF_PLAYER_HEIGHT;
            if (checkMapCollision(collisionPoint) == 1) {
                collision = true;
            }
        }

        if (collision) {
            x = ceil(collisionPoint[0] / global.TILE_SIZE) * global.TILE_SIZE + global.HALF_PLAYER_WIDTH + .01;
            currentMovement[0] = 0;
        }
    }

    //Check y
    collisionPoint[0] = x;
    collisionPoint[1] = y + currentMovement[1];

    if(collisionPoint[1] > y) {
        var collision = false;
        collisionPoint[0] += global.HALF_PLAYER_WIDTH;
        collisionPoint[1] += 0;

        otherPoint[0] = collisionPoint[0];
        otherPoint[1] = collisionPoint[1] - currentMovement[1] - 1;
        if (checkMapCollision(collisionPoint) == 1 || (checkMapCollision(collisionPoint) == 2 && checkMapCollision(otherPoint) == 0)) {
            collision = true;
        } else {
            collisionPoint[0] -= global.PLAYER_SIZE_WIDTH;
            otherPoint[0] = collisionPoint[0];
            otherPoint[1] = collisionPoint[1] - currentMovement[1] - 1;
            if (checkMapCollision(collisionPoint) == 1 || (checkMapCollision(collisionPoint) == 2 && checkMapCollision(otherPoint) == 0)) {
                collision = true;
            }
        }

        if (collision) {
            y = floor(collisionPoint[1] / global.TILE_SIZE) * global.TILE_SIZE - .01;
            currentMovement[1] = 0;
            pressedJump = false;
            hit = false;
        }

    } else if(collisionPoint[1] < y) {
        var collision = false;
        collisionPoint[0] += global.HALF_PLAYER_WIDTH;
        collisionPoint[1] -= global.PLAYER_SIZE_HEIGHT;

        if (checkMapCollision(collisionPoint) == 1) {
            collision = true;
        } else {
            collisionPoint[0] -= global.PLAYER_SIZE_WIDTH;
            if (checkMapCollision(collisionPoint) == 1) {
                collision = true;
            }
        }

        if (collision) {
            y = ceil(collisionPoint[1] / global.TILE_SIZE) * global.TILE_SIZE + global.PLAYER_SIZE_HEIGHT + .01;
            currentMovement[1] = 0;
        }
    }
} else {
    //Sliding
    collisionPoint[0] = x + currentMovement[0];
    collisionPoint[1] = y;

    if(collisionPoint[0] > x) {
        var collision = false;
        collisionPoint[0] += global.HALF_PLAYER_WIDTH;
        collisionPoint[1] += 0;

        if (checkMapCollision(collisionPoint) == 1) {
            collision = true;
        
            x = floor(collisionPoint[0] / global.TILE_SIZE) * global.TILE_SIZE - global.HALF_PLAYER_WIDTH - .01;
            currentMovement[0] = 0;
        }
    }

    collisionPoint[0] = x;
    collisionPoint[1] = y + currentMovement[1];

    if(collisionPoint[1] > y) {
        var collision = false;
        collisionPoint[0] += global.HALF_PLAYER_WIDTH;
        collisionPoint[1] += 0;

        if (checkMapCollision(collisionPoint) == 1 || (checkMapCollision(collisionPoint) == 2 && checkMapCollision(otherPoint) == 0)) {
            collision = true;

            y = floor(collisionPoint[1] / global.TILE_SIZE) * global.TILE_SIZE - .01;
            currentMovement[1] = 0;
        }
    }
}

x += currentMovement[0];
y += currentMovement[1];

if(previousFall >= 0 && currentMovement[1] < 0) {
    fallAnimationFix = 0;
}

previousFall = currentMovement[1];

score += currentMovement[0] * global.DISTANCE_SCORE;

//Camera
view_xview[0] = max(view_xview[0] + ((x - 280) - view_xview[0])*0.35, 0);

return currentMovement;

}