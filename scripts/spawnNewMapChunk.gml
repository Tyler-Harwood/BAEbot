spawnSection = argument0;
spawnString = argument1;

startingX = spawnSection * global.SCREEN_TILE_WIDTH;

stringPosition = 1;
for(var Y = global.SCREEN_TILE_CEILING; Y < global.SCREEN_TILE_HEIGHT + global.SCREEN_TILE_CEILING; Y++) {
    for(var X = startingX; X < startingX + global.SCREEN_TILE_WIDTH; X++) {
        currentNumber = "";
        meh = true;
        
        while(meh){
            character = string_char_at(spawnString, stringPosition);
            switch(character) {
                case "0":
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                case "6":
                case "7":
                case "8":
                case "9":
                    currentNumber += character;
                    break;
                case ",":
                    meh = false;
                    break;
                default:
                    if(stringPosition > string_length(spawnString)) {
                        meh = false;
                    }
            }
            stringPosition++;
        }
        
        
        switch(currentNumber) {
            case "2":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, platformTop);
                break;
            case "10":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, platform);
                break;
            case "17":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, topLeftStone);
                break;
            case "18":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, topCenterStone);
                break;
            case "19":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, topRightStone);
                break;
            case "20":
                jumpy = instance_create(X * global.TILE_SIZE + 8, Y * global.TILE_SIZE + 32, enemyJumpy);
                jumpy.groundPos = Y * global.TILE_SIZE + 32;
                break;
            case "21":
            
                break;
            case "22":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, thorns);
                break;
            case "25":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, leftCenterStone);
                break;
            case "26":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, centerStone);
                break;
            case "27":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, rightCenterStone);
                break;
            case "28":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, battery);
                break;
            case "33":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, bottomLeftStone);
                break;
            case "34":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, bottomCenterStone);
                break;
            case "35":
                instance_create(X * global.TILE_SIZE, Y * global.TILE_SIZE, bottomRightStone);
                break;
        }
        
    }
}