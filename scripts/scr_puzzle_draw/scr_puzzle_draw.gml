function scr_puzzle_draw() {

    var cx = display_get_gui_width()  * 0.5;
    var cy = display_get_gui_height() * 0.5;

    if (global.puzzle_ativo) {

        // FUNDO ESCURO SEMI-TRANSPARENTE
        draw_set_alpha(0.85);
        draw_set_color(c_black);
        draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
        draw_set_alpha(1);

        draw_set_halign(fa_center);
        draw_set_valign(fa_center);

        // nome da fase
        var nome_fase = "";
        if      (global.puzzle_fase == 1) nome_fase = "FASE 1 - SOMA / SUBTRACAO";
        else if (global.puzzle_fase == 2) nome_fase = "FASE 2 - MULTIPLICACAO / DIVISAO";
        else if (global.puzzle_fase == 3) nome_fase = "FASE 3 - POTENCIA / RAIZ";
        else if (global.puzzle_fase == 4) nome_fase = "!! EVENTO ALIENIGENA !!";

        draw_set_color(global.puzzle_alieniga ? c_red : c_white);
        draw_text(cx, cy * 0.60, nome_fase);

        draw_set_color(c_white);
        draw_text(cx, cy * 0.72, "Puzzle " + string(global.puzzle_contador_na_fase + 1) + " de 6");

        draw_set_color(c_yellow);
        if (global.puzzle_alieniga) {
            draw_text(cx, cy * 0.86, global.puzzle_pergunta);
            draw_text(cx, cy,        global.puzzle_pergunta2);
        } else {
            draw_text(cx, cy * 0.92, global.puzzle_pergunta);
        }

        draw_set_color(c_white);
        draw_text(cx, cy * 1.16, global.puzzle_resposta_jogador + "_");
    }

    if (global.puzzle_feedback_timer > 0) {
        draw_set_halign(fa_center);
        if (global.puzzle_resultado == "correto") {
            draw_set_color(c_green);
            draw_text(cx, cy, "CORRETO!");
        } else if (global.puzzle_resultado == "errado") {
            draw_set_color(c_red);
            draw_text(cx, cy, "ERRADO!");
        }
    }

	draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}