// GAMEPLAY
if (game_state == GAME_STATE.PLAYING)
{
    game_time    += delta_time / 1000000;
    score_timer  += delta_time / 1000000;

    if (score_timer >= 1)
    {
        player_score += 1;
        score_timer   = 0;
    }
}

// GAME OVER
if (game_state == GAME_STATE.GAMEOVER)
{
    global.score_final = player_score;
    global.tempo_final = floor(game_time);
    room_goto(rm_gameover);
    // room_goto destrói obj_game na transição - não executa duas vezes
}