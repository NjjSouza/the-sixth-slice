function Puzzle_Start(_puzzle_name)
{
    obj_game.game_state = GAME_STATE.PUZZLE;
    global.current_puzzle = _puzzle_name;
    global.system_locked = true;

    global.puzzle_resposta_jogador = "";
    scr_puzzle_generate();
    global.puzzle_ativo = true;
    global.puzzle_feedback_timer = -1;
    global.puzzle_resultado = "";

    keyboard_clear(vk_enter);
}

function Puzzle_End()
{
    obj_game.game_state = GAME_STATE.PLAYING;
    global.current_puzzle = noone;
    global.system_locked = false;
    global.puzzle_ativo = false;
    global.puzzle_resposta_jogador = "";
    keyboard_clear(vk_enter);
}