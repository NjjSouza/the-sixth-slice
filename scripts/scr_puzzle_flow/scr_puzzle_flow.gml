function Puzzle_Start(_puzzle_name)
{
    obj_game.game_state            = GAME_STATE.PUZZLE;
    global.current_puzzle          = _puzzle_name;
    global.system_locked           = true;

    global.puzzle_restantes        = 3;
    global.puzzle_resposta_jogador = "";
    global.puzzle_resultado        = "";
    global.puzzle_feedback_timer   = 0;

    scr_puzzle_generate();
    global.puzzle_ativo = true;

    keyboard_clear(vk_enter);
}

function Puzzle_End()
{
    obj_game.game_state            = GAME_STATE.PLAYING;
    global.current_puzzle          = noone;
    global.system_locked           = false;
    global.puzzle_ativo            = false;
    global.puzzle_feedback_timer   = 0;
    global.puzzle_restantes        = 0;
    global.puzzle_resposta_jogador = "";
    global.puzzle_resultado        = "";
    keyboard_clear(vk_enter);
}