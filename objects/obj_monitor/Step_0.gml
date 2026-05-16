// =====================
// DETECTAR PROXIMIDADE DO PLAYER
// =====================

player_perto = false;

if (instance_exists(obj_player) && obj_game.game_state == GAME_STATE.PLAYING)
{
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    player_perto = (dist <= raio_interacao);
}


// =====================
// ANIMAÇÃO DE PULSO
// =====================

pulso = (sin(current_time / 300) + 1) / 2; // 0.0 a 1.0


// =====================
// INTERAÇÃO
// =====================

if (player_perto && keyboard_check_pressed(ord("E")))
{
    if (obj_game.game_state == GAME_STATE.PLAYING)
    {
        global.puzzle_tipo_monitor = tipo;
        Puzzle_Start(tipo);
    }
}