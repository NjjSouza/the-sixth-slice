function scr_puzzle_validate() {

    var resposta_digitada = real(global.puzzle_resposta_jogador);
    var diferenca = abs(resposta_digitada - global.puzzle_resposta_correta);

    // ============================================================
    // RESPOSTA CORRETA
    // ============================================================
    if (diferenca <= 0.01) {

        global.puzzle_resultado = "correto";
        global.score += 100;
        global.puzzle_contador_na_fase += 1;

        if (global.puzzle_contador_na_fase >= 6) {
            global.puzzle_fase += 1;
            global.puzzle_contador_na_fase = 0;

            // Trava na fase 4 (alienígena) — depois de completar tudo
            // continua gerando funções f(x) infinitamente até a nave morrer
            if (global.puzzle_fase > 4) {
                global.puzzle_fase = 4;
            }
        }

    // ============================================================
    // RESPOSTA ERRADA
    // ============================================================
    } else {

        global.puzzle_resultado = "errado";
        global.energia  -= 15;
        global.oxigenio -= 10;

        if (global.energia  < 0) { global.energia  = 0; }
        if (global.oxigenio < 0) { global.oxigenio = 0; }

        if (global.energia <= 0 or global.oxigenio <= 0) {
            global.game_over = true;
        }
    }

    // ============================================================
    // FINALIZA O PUZZLE ATUAL
    // ============================================================
    global.puzzle_ativo = false;
    global.puzzle_feedback_timer = global.puzzle_feedback_duracao;
}