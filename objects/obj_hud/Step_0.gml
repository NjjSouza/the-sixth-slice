// =====================
// DECAY DAS BARRAS (só durante PLAYING)
// =====================

if (instance_exists(obj_game) && obj_game.game_state == GAME_STATE.PLAYING)
{
    energia     -= 2.5 * (delta_time / 1000000);
    oxigenio    -= 2.0 * (delta_time / 1000000);
    integridade -= 1.5 * (delta_time / 1000000);

    energia     = max(energia,     0);
    oxigenio    = max(oxigenio,    0);
    integridade = max(integridade, 0);
}


// =====================
// RESET
// =====================

alerta = "SISTEMAS ESTAVEIS";
var sistemas_criticos = 0;


// =====================
// CHECAGEM DE CRÍTICOS
// =====================

if (energia     <= 15) sistemas_criticos += 1;
if (oxigenio    <= 15) sistemas_criticos += 1;
if (integridade <= 15) sistemas_criticos += 1;


// =====================
// PRIORIDADE MÁXIMA
// =====================

if (sistemas_criticos == 3)
{
    alerta = "NAVE EM COLAPSO";
}
else if (sistemas_criticos >= 2)
{
    alerta = "MULTIPLAS FALHAS";
}
else
{
    if (energia <= 30)
    {
        alerta = "ENERGIA CRITICA";
    }
    else if (oxigenio <= 30)
    {
        alerta = "OXIGENIO BAIXO";
    }
    else if (integridade <= 30)
    {
        alerta = "FALHA ESTRUTURAL";
    }
}


// =====================
// DETECTAR MUDANÇA DE ALERTA
// =====================

if (alerta != alerta_anterior)
{
    shake_alerta    = 10;
    alerta_anterior = alerta;
}


// =====================
// SYNC SCORE E TEMPO
// =====================

if (instance_exists(obj_game))
{
    tempo_segundos = floor(obj_game.game_time);
    hud_score      = obj_game.player_score;
}


// =====================
// GAME OVER — define causa antes de trocar de estado
// =====================

if (energia <= 0 || oxigenio <= 0 || integridade <= 0)
{
    if (instance_exists(obj_game) && obj_game.game_state != GAME_STATE.GAMEOVER)
    {
        if      (energia <= 0)     global.causa_morte = "energia";
        else if (oxigenio <= 0)    global.causa_morte = "oxigenio";
        else                       global.causa_morte = "estrutura";

        obj_game.game_state = GAME_STATE.GAMEOVER;
    }
}