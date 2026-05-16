function ExecuteEvent(_event)
{
    obj_game.game_state = GAME_STATE.PUZZLE;

    switch(_event)
    {
        case EVENT_TYPE.SYSTEM_CHECK:
            Puzzle_Start("system_check");
        break;

        case EVENT_TYPE.OXYGEN_LEAK:
            if (instance_exists(obj_hud)) {
                obj_hud.oxigenio -= 10;
                obj_hud.oxigenio = max(obj_hud.oxigenio, 0);
            }
            Puzzle_Start("oxygen_fix");
        break;

        case EVENT_TYPE.ALIEN_SIGNAL:
            if (instance_exists(obj_hud)) {
                obj_hud.energia -= 10;
                obj_hud.energia = max(obj_hud.energia, 0);
            }
            Puzzle_Start("alien_signal");
        break;
    }
}