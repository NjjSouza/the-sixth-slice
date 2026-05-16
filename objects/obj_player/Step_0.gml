// trava durante puzzle
if (obj_game.game_state != GAME_STATE.PLAYING)
{
    exit;
}


// =====================
// DESTINO COM CLIQUE DO MOUSE
// =====================

if (mouse_check_button_pressed(mb_left))
{
    target_x = mouse_x;
    target_y = mouse_y;
}


// =====================
// MOVIMENTO SUAVE TOWARD TARGET
// =====================

var dx   = target_x - x;
var dy   = target_y - y;
var dist = point_distance(x, y, target_x, target_y);

if (dist > 4)
{
    hspd = (dx / dist) * move_speed;
    vspd = (dy / dist) * move_speed;
    x   += hspd;
    y   += vspd;
}
else
{
    hspd = 0;
    vspd = 0;
}


// =====================
// SPRITES POR DIREÇÃO
// =====================

if (abs(hspd) > abs(vspd))
{
    if (hspd > 0) sprite_index = spr_player_right;
    else           sprite_index = spr_player_left;
}
else if (vspd != 0)
{
    if (vspd > 0) sprite_index = spr_player_down;
    else           sprite_index = spr_player_up;
}