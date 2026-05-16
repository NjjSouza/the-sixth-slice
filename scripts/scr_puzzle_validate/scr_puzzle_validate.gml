function scr_puzzle_validate() {

    if (!global.puzzle_ativo) exit;

    var resposta_digitada = real(global.puzzle_resposta_jogador);
    var diferenca = abs(resposta_digitada - global.puzzle_resposta_correta);

    // ============================================================
    // RESPOSTA CORRETA
    // ============================================================
    if (diferenca <= 0.01) {

        global.puzzle_resultado = "correto";
        obj_game.player_score += 100;
        global.puzzle_contador_na_fase += 1;

        if (global.puzzle_contador_na_fase >= 6) {
            global.puzzle_fase += 1;
            global.puzzle_contador_na_fase = 0;

            if (global.puzzle_fase > 4) {
                global.puzzle_fase = 4;
            }
        }

    // ============================================================
    // RESPOSTA ERRADA
    // ============================================================
    } else {

        global.puzzle_resultado = "errado";
        obj_hud.energia  -= 15;
        obj_hud.oxigenio -= 10;
        obj_hud.energia  = max(obj_hud.energia,  0);
        obj_hud.oxigenio = max(obj_hud.oxigenio, 0);
    }

    // ============================================================
    // FINALIZA O PUZZLE ATUAL
    // ============================================================
    global.puzzle_ativo = false;
    global.puzzle_feedback_timer = global.puzzle_feedback_duracao;
}