function TriggerEvent()
{
    show_debug_message("EVENTO DISPARADO");

    obj_game.game_state = GAME_STATE.PUZZLE;
}