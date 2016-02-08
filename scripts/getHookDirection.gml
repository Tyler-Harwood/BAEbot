hookDirection = argument0;
currentPosition = argument1;
hookPosition = argument2;

hookDirectionRad = arctan2(hookPosition[@ 1] - currentPosition[@ 1], 
                            hookPosition[@ 0] - currentPosition[@ 0]);

hookDirection[0] = cos(hookDirectionRad);
hookDirection[1] = sin(hookDirectionRad);