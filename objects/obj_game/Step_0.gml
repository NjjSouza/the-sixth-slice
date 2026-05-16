if (game_state == GAME_STATE.PLAYING)
{
    game_time += delta_time / 1000000;

    player_score += 1;
}

// TESTE TEMPORÁRIO
if (keyboard_check_pressed(vk_space))
{
    if (game_state == GAME_STATE.PUZZLE)
    {
        game_state = GAME_STATE.PLAYING;
    }
}

if (game_state == GAME_STATE.GAMEOVER)
{
    if (keyboard_check_pressed(ord("R")))
    {
        room_restart();
    }
}