if (obj_game.game_state != GAME_STATE.PLAYING)
{
    exit;
}

oxygen -= 0.01;

if (oxygen <= 0)
{
    obj_game.game_state = GAME_STATE.GAMEOVER;
}