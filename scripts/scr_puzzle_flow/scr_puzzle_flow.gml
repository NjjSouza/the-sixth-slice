function Puzzle_Start(_puzzle_name)
{
    obj_game.game_state = GAME_STATE.PUZZLE;

    global.current_puzzle = _puzzle_name;

    global.system_locked = true;

    show_debug_message("PUZZLE: " + string(_puzzle_name));
}

function Puzzle_End()
{
    obj_game.game_state = GAME_STATE.PLAYING;

    global.current_puzzle = noone;

    global.system_locked = false;

    show_debug_message("PUZZLE FINALIZADO");
}