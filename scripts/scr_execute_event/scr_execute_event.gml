function ExecuteEvent(_event)
{
    obj_game.game_state = GAME_STATE.PUZZLE;

    switch(_event)
    {
        case EVENT_TYPE.SYSTEM_CHECK:
            show_debug_message("System Check Puzzle");
        break;

        case EVENT_TYPE.OXYGEN_LEAK:
            obj_rocket_status.oxygen -= 10;
        break;

        case EVENT_TYPE.ALIEN_SIGNAL:
            obj_rocket_status.energy -= 10;
        break;
    }
}