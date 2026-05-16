// -----------------------------------------------------------
// LEITURA DO TECLADO (só quando o puzzle está ativo)
// -----------------------------------------------------------
if (global.puzzle_ativo) {

    // Teclas numéricas da linha superior (0 a 9)
    // ord("0") = código ASCII do "0", ord("1") = código do "1", etc.
    for (var i = 0; i <= 9; i++) {
        if (keyboard_check_pressed(ord(string(i)))) {
            global.puzzle_resposta_jogador += string(i);
        }
    }

    // Teclas do NUMPAD (0 a 9) — vk_numpad0 até vk_numpad9
    // No GameMaker, vk_numpad0 = 96, vk_numpad1 = 97, etc.
    // Então vk_numpad0 + i acessa cada tecla do numpad
    for (var i = 0; i <= 9; i++) {
        if (keyboard_check_pressed(vk_numpad0 + i)) {
            global.puzzle_resposta_jogador += string(i);
        }
    }

    // Ponto decimal — tanto o "." normal quanto o do numpad (vk_decimal)
    if (keyboard_check_pressed(ord(".")) or keyboard_check_pressed(vk_decimal)) {
        // Só adiciona ponto se ainda não tiver um na resposta
        if (string_pos(".", global.puzzle_resposta_jogador) == 0) {
            global.puzzle_resposta_jogador += ".";
        }
    }

    // Backspace apaga o último caractere digitado
    if (keyboard_check_pressed(vk_backspace)) {
        var tamanho = string_length(global.puzzle_resposta_jogador);
        if (tamanho > 0) {
            global.puzzle_resposta_jogador = string_delete(
                global.puzzle_resposta_jogador,
                tamanho, // posição do último caractere
                1        // remove 1 caractere
            );
        }
    }

    // Enter confirma — funciona tanto no Enter normal quanto no Enter do numpad
   // No GameMaker, o Enter do numpad = vk_enter (mesma constante)
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

    // Quando zera, gera o próximo puzzle automaticamente
    if (global.puzzle_feedback_timer <= 0 and !global.puzzle_ativo) {
        if (!global.game_over) {
            scr_puzzle_generate();
        }
    }
}