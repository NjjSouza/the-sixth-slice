// GAMEPLAY
if (game_state == GAME_STATE.PLAYING)
{
    game_time += delta_time / 1000000;

    score_timer += delta_time / 1000000;

    if (score_timer >= 1)
    {
        player_score += 1;
        score_timer = 0;
    }
}

// GAME OVER
if (game_state == GAME_STATE.GAMEOVER)
{
    if (keyboard_check_pressed(ord("R")))
    {
        room_restart();
    }
}