// -----------------------------------------------------------
// LEITURA DO TECLADO (só quando o puzzle está ativo)
// -----------------------------------------------------------
if (global.puzzle_ativo) {

    // Teclas numéricas da linha superior (0 a 9)
    for (var i = 0; i <= 9; i++) {
        if (keyboard_check_pressed(ord(string(i)))) {
            global.puzzle_resposta_jogador += string(i);
        }
    }

    // Teclas do NUMPAD (0 a 9)
    for (var i = 0; i <= 9; i++) {
        if (keyboard_check_pressed(vk_numpad0 + i)) {
            global.puzzle_resposta_jogador += string(i);
        }
    }

    // Ponto decimal
    if (keyboard_check_pressed(ord(".")) or keyboard_check_pressed(vk_decimal)) {
        if (string_pos(".", global.puzzle_resposta_jogador) == 0) {
            global.puzzle_resposta_jogador += ".";
        }
    }

    // Backspace apaga o último caractere
    if (keyboard_check_pressed(vk_backspace)) {
        var tamanho = string_length(global.puzzle_resposta_jogador);
        if (tamanho > 0) {
            global.puzzle_resposta_jogador = string_delete(
                global.puzzle_resposta_jogador,
                tamanho,
                1
            );
        }
    }

    // Enter confirma
    if (keyboard_check_pressed(vk_enter)) {
        if (string_length(global.puzzle_resposta_jogador) > 0) {
            scr_puzzle_validate();
        }
    }
}

// -----------------------------------------------------------
// TIMER DE FEEDBACK (conta regressivamente a 60fps)
// -----------------------------------------------------------

if (global.puzzle_feedback_timer > 0) {
    global.puzzle_feedback_timer -= 1;
    if (global.puzzle_feedback_timer == 0 && !global.puzzle_ativo) {
        Puzzle_End();
    }
}