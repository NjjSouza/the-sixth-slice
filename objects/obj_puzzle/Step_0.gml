// -----------------------------------------------------------
// LEITURA DO TECLADO
// -----------------------------------------------------------
if (global.puzzle_ativo) {

    for (var i = 0; i <= 9; i++) {
        if (keyboard_check_pressed(ord(string(i))))
            global.puzzle_resposta_jogador += string(i);
    }

    for (var i = 0; i <= 9; i++) {
        if (keyboard_check_pressed(vk_numpad0 + i))
            global.puzzle_resposta_jogador += string(i);
    }

    if (keyboard_check_pressed(ord(".")) || keyboard_check_pressed(vk_decimal)) {
        if (string_pos(".", global.puzzle_resposta_jogador) == 0)
            global.puzzle_resposta_jogador += ".";
    }

    if (keyboard_check_pressed(vk_backspace)) {
        var tamanho = string_length(global.puzzle_resposta_jogador);
        if (tamanho > 0)
            global.puzzle_resposta_jogador = string_delete(global.puzzle_resposta_jogador, tamanho, 1);
    }

    if (keyboard_check_pressed(vk_enter)) {
        if (string_length(global.puzzle_resposta_jogador) > 0)
            scr_puzzle_validate();
    }

    // ESC sai do monitor a qualquer momento
    if (keyboard_check_pressed(vk_escape)) {
        Puzzle_End();
    }
}

// -----------------------------------------------------------
// TIMER DE FEEDBACK
// -----------------------------------------------------------
if (global.puzzle_feedback_timer > 0) {
    global.puzzle_feedback_timer -= 1;

    if (global.puzzle_feedback_timer <= 0) {
        global.puzzle_feedback_timer = 0;
        global.puzzle_resultado      = "";

        if (global.puzzle_restantes <= 0) {
            Puzzle_End();
        } else {
            global.puzzle_resposta_jogador = "";
            scr_puzzle_generate();
            global.puzzle_ativo = true;
            keyboard_clear(vk_enter);
        }
    }
}