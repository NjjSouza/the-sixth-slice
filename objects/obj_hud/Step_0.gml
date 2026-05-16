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
    // =====================
    // ALERTAS INDIVIDUAIS
    // =====================

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
// GAME OVER
// =====================

if (energia <= 0 || oxigenio <= 0 || integridade <= 0)
{
    if (instance_exists(obj_game) && obj_game.game_state != GAME_STATE.GAMEOVER)
    {
        obj_game.game_state = GAME_STATE.GAMEOVER;
    }
}