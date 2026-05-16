// trava durante puzzle
if (obj_game.game_state != GAME_STATE.PLAYING)
{
    exit;
}

// INPUT
hspd = keyboard_check(vk_right) - keyboard_check(vk_left);
vspd = keyboard_check(vk_down) - keyboard_check(vk_up);

// NORMALIZA DIAGONAL
var len = point_distance(0, 0, hspd, vspd);

if (len > 0)
{
    hspd /= len;
    vspd /= len;
}

// MOVIMENTO
x += hspd * move_speed;
y += vspd * move_speed;

// SPRITES
if (abs(hspd) > abs(vspd))
{
    if (hspd > 0)
        sprite_index = spr_player_right;
    else if (hspd < 0)
        sprite_index = spr_player_left;
}
else if (abs(vspd) > 0)
{
    if (vspd > 0)
        sprite_index = spr_player_down;
    else if (vspd < 0)
        sprite_index = spr_player_up;
}