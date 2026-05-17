// =====================
// DECAY COM PROGRESSÃO DE DIFICULDADE
// =====================

var _diff = 1;
if (instance_exists(obj_difficulty)) {
    _diff = obj_difficulty.difficulty_level;
}

var _mult;
if      (_diff == 1) { _mult = 1.0; }
else if (_diff == 2) { _mult = 2.0; }
else                 { _mult = 3.5; }

var _base_e = 1.5 * _mult;
var _base_o = 1.2 * _mult;
var _base_i = 0.9 * _mult;

if (instance_exists(obj_game)) {
    if (obj_game.game_state == GAME_STATE.PLAYING) {
        energia     -= _base_e * (delta_time / 1000000);
        oxigenio    -= _base_o * (delta_time / 1000000);
        integridade -= _base_i * (delta_time / 1000000);
    }
    else if (obj_game.game_state == GAME_STATE.PUZZLE) {
        energia     -= (_base_e * 0.35) * (delta_time / 1000000);
        oxigenio    -= (_base_o * 0.35) * (delta_time / 1000000);
        integridade -= (_base_i * 0.35) * (delta_time / 1000000);
    }
}

energia     = max(energia,     0);
oxigenio    = max(oxigenio,    0);
integridade = max(integridade, 0);


// =====================
// RESET
// =====================

alerta = "SISTEMAS ESTAVEIS";
var sistemas_criticos = 0;

if (energia     <= 15) sistemas_criticos += 1;
if (oxigenio    <= 15) sistemas_criticos += 1;
if (integridade <= 15) sistemas_criticos += 1;

if (sistemas_criticos == 3) {
    alerta = "NAVE EM COLAPSO";
}
else if (sistemas_criticos >= 2) {
    alerta = "MULTIPLAS FALHAS";
}
else {
    if      (energia     <= 30) alerta = "ENERGIA CRITICA";
    else if (oxigenio    <= 30) alerta = "OXIGENIO BAIXO";
    else if (integridade <= 30) alerta = "FALHA ESTRUTURAL";
}

if (alerta != alerta_anterior) {
    shake_alerta    = 10;
    alerta_anterior = alerta;
}

if (instance_exists(obj_game)) {
    tempo_segundos = floor(obj_game.game_time);
    hud_score      = obj_game.player_score;
}

if (energia <= 0 || oxigenio <= 0 || integridade <= 0) {
    if (instance_exists(obj_game) && obj_game.game_state != GAME_STATE.GAMEOVER) {
        if      (energia     <= 0) global.causa_morte = "energia";
        else if (oxigenio    <= 0) global.causa_morte = "oxigenio";
        else                       global.causa_morte = "estrutura";

        obj_game.game_state = GAME_STATE.GAMEOVER;
    }
}