var offset_left = 800;
var levels = floor(argument0 / 3);

for (var j=0; j<(argument0 - (levels * 3)); j++) 
{
    draw_sprite(spr_levelgreen, 0, offset_left, argument1);
    offset_left += 29;
}

if((argument0 - (levels * 3)) < 3) {
    for (var j=0; j<(3 - (argument0 - (levels * 3))); j++) 
    {
        draw_sprite(spr_levelgray, 0, offset_left, argument1);
        offset_left += 29;
    }  
}

draw_text(920, (argument1 + 6), string(levels + 1));
