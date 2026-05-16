function scr_puzzle_draw() {

    var cor_anterior = draw_get_color();

    // PUZZLE ATIVO
    if (global.puzzle_ativo) {

        draw_set_halign(fa_center);
        draw_set_valign(fa_center);

        // Nome da fase
        var nome_fase = "";
        if      (global.puzzle_fase == 1) { nome_fase = "FASE 1 - SOMA / SUBTRACAO"; }
        else if (global.puzzle_fase == 2) { nome_fase = "FASE 2 - MULTIPLICACAO / DIVISAO"; }
        else if (global.puzzle_fase == 3) { nome_fase = "FASE 3 - POTENCIA / RAIZ"; }
        else if (global.puzzle_fase == 4) { nome_fase = "!! EVENTO ALIENIGENA !!"; }

        if (global.puzzle_alieniga) {
            draw_set_color(c_red);
        } else {
            draw_set_color(c_white);
        }
        draw_text(room_width * 0.5, room_height * 0.30, nome_fase);

        // Progresso
        draw_set_color(c_white);
        draw_text(
            room_width * 0.5,
            room_height * 0.36,
            "Puzzle " + string(global.puzzle_contador_na_fase + 1) + " de 6"
        );

        // Pergunta
        draw_set_color(c_yellow);
        if (global.puzzle_alieniga) {
            draw_text(room_width * 0.5, room_height * 0.43, global.puzzle_pergunta);
            draw_text(room_width * 0.5, room_height * 0.50, global.puzzle_pergunta2);
        } else {
            draw_text(room_width * 0.5, room_height * 0.46, global.puzzle_pergunta);
        }

        // Resposta digitada
        draw_set_color(c_white);
        draw_text(
            room_width * 0.5,
            room_height * 0.58,
            global.puzzle_resposta_jogador + "_"
        );
    }

    // FEEDBACK CORRETO / ERRADO
    if (global.puzzle_feedback_timer > 0) {

        draw_set_halign(fa_center);

        if (global.puzzle_resultado == "correto") {
            draw_set_color(c_green);
            draw_text(room_width * 0.5, room_height * 0.5, "CORRETO!");
        } else if (global.puzzle_resultado == "errado") {
            draw_set_color(c_red);
            draw_text(room_width * 0.5, room_height * 0.5, "ERRADO!");
        }
    }

    draw_set_color(cor_anterior);
    draw_set_halign(fa_left);
}