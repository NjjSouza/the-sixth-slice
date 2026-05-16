if (obj_game.game_state != GAME_STATE.PLAYING)
{
    exit;
}

event_timer += delta_time / 1000000;

if (event_timer >= event_cooldown)
{
    TriggerRandomEvent();
    event_timer = 0;
}