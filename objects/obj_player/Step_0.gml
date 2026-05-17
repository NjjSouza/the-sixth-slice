depth = 15;

if (obj_game.game_state != GAME_STATE.PLAYING) exit;

var tile_layer = layer_get_id("tile_layer");
var mapa       = layer_tilemap_get_id(tile_layer);

show_debug_message("tile: " + string(tilemap_get_at_pixel(mapa, x, y)));
show_debug_message("x: " + string(x) + " y: " + string(y));

var dx = 0;
var dy = 0;

if (keyboard_check(ord("A"))) dx = -1;
if (keyboard_check(ord("D"))) dx =  1;
if (keyboard_check(ord("W"))) dy = -1;
if (keyboard_check(ord("S"))) dy =  1;

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