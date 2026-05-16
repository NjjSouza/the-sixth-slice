function ExecuteEvent(_event)
{
    obj_game.game_state = GAME_STATE.PUZZLE;

    switch(_event)
    {
        case EVENT_TYPE.SYSTEM_CHECK:
            show_debug_message("System Check Puzzle");
            Puzzle_Start("system_check");
        break;

        case EVENT_TYPE.OXYGEN_LEAK:
            show_debug_message("Oxygen Leak Puzzle");
            obj_hud.oxigenio -= 10;
            obj_hud.oxigenio = max(obj_hud.oxigenio, 0);
            Puzzle_Start("oxygen_fix");
        break;

        case EVENT_TYPE.ALIEN_SIGNAL:
            show_debug_message("Alien Signal Puzzle");
            obj_hud.energia -= 10;
            obj_hud.energia = max(obj_hud.energia, 0);
            Puzzle_Start("alien_signal");
        break;
    }
}