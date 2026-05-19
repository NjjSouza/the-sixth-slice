depth = 15;

if (obj_game.game_state != GAME_STATE.PLAYING) exit;

var tile_layer = layer_get_id("tile_layer");
var mapa       = layer_tilemap_get_id(tile_layer);

var dx = 0;
var dy = 0;

if (keyboard_check(ord("A")) || keyboard_check(vk_left))  dx = -1;
if (keyboard_check(ord("D")) || keyboard_check(vk_right)) dx =  1;
if (keyboard_check(ord("W")) || keyboard_check(vk_up))    dy = -1;
if (keyboard_check(ord("S")) || keyboard_check(vk_down))  dy =  1;

if (dx != 0 || dy != 0)
{
    var novo_x = x + dx * move_speed;
    var novo_y = y + dy * move_speed;

    if (tilemap_get_at_pixel(mapa, novo_x, novo_y) == 0)
    {
        x = novo_x;
        y = novo_y;
    }

    if (abs(dx) >= abs(dy))
        sprite_index = (dx > 0) ? spr_player_right : spr_player_left;
    else
        sprite_index = (dy > 0) ? spr_player_down : spr_player_up;
}

// trocada para CTRL
global.tecla_e_pressionada = keyboard_check_pressed(vk_control);