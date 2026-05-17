// =====================
// COOLDOWN PÓS-SESSÃO
// =====================

if (!variable_instance_exists(id, "cooldown_timer")) cooldown_timer = 0;

if (cooldown_timer > 0) {
    cooldown_timer -= 1;
}


// =====================
// DETECTAR PROXIMIDADE DO PLAYER
// =====================

player_perto = false;

if (instance_exists(obj_player) && obj_game.game_state == GAME_STATE.PLAYING) {
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    player_perto = (dist <= raio_interacao);
}


// =====================
// ANIMAÇÃO DE PULSO
// =====================

pulso = (sin(current_time / 300) + 1) / 2;


// =====================
// INTERAÇÃO
// =====================

if (player_perto && cooldown_timer <= 0 && global.tecla_e_pressionada) {
    if (obj_game.game_state == GAME_STATE.PLAYING) {
        global.puzzle_tipo_monitor = tipo;
        cooldown_timer = 90; // 1.5s de cooldown antes de poder reativar
        Puzzle_Start(tipo);
    }
}