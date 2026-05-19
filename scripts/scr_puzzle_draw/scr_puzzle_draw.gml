function scr_puzzle_draw() {

    var cx = display_get_gui_width()  * 0.5;
    var cy = display_get_gui_height() * 0.5;

    if (global.puzzle_ativo) {

        draw_set_alpha(0.85);
        draw_set_color(c_black);
        draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
        draw_set_alpha(1);

        draw_set_halign(fa_center);
        draw_set_valign(fa_center);

        var nome_fase = "";
        if      (global.puzzle_fase == 1) nome_fase = "FASE 1 - SOMA / SUBTRACAO";
        else if (global.puzzle_fase == 2) nome_fase = "FASE 2 - MULTIPLICACAO / DIVISAO";
        else if (global.puzzle_fase == 3) nome_fase = "FASE 3 - POTENCIA / RAIZ";
        else if (global.puzzle_fase == 4) nome_fase = "!! EVENTO ALIENIGENA !!";

        draw_set_color(global.puzzle_alieniga ? c_red : c_white);
        draw_text(cx, cy - 140, nome_fase);

        draw_set_color(c_white);
        draw_text(cx, cy - 108, "Pergunta " + string(4 - global.puzzle_restantes) + " de 3");

        draw_set_color(c_yellow);
        if (global.puzzle_alieniga) {
            draw_text(cx, cy - 68, global.puzzle_pergunta);
            draw_text(cx, cy - 36, global.puzzle_pergunta2);
        } else {
            draw_text(cx, cy - 52, global.puzzle_pergunta);
        }

        draw_set_color(c_white);
        draw_text(cx, cy + 10, global.puzzle_resposta_jogador + "_");
        draw_set_color(make_color_rgb(120, 120, 120));
        draw_text(cx, cy + 30, "[ESC] sair do monitor");

        // ← reset aqui, antes de fechar o bloco
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }

    if (global.puzzle_feedback_timer > 0) {

        var fb_cor;
        var fb_txt;

        if (global.puzzle_resultado == "correto") {
            fb_cor = make_color_rgb(80, 255, 120);
            fb_txt = "CORRETO!";
        } else {
            fb_cor = make_color_rgb(255, 80, 80);
            fb_txt = "ERRADO!";
        }

        // caixinha de fundo
        var fb_w = 160;
        draw_set_alpha(0.75);
        draw_set_color(c_black);
        draw_rectangle(cx - fb_w, 62, cx + fb_w, 98, false);
        draw_set_alpha(1);
        draw_set_color(fb_cor);
        draw_rectangle(cx - fb_w, 62, cx + fb_w, 98, true);

        // texto
        draw_set_halign(fa_center);
        draw_set_valign(fa_center);
        draw_set_color(fb_cor);
        draw_text_transformed(cx, 80, fb_txt, 1.6, 1.6, 0);
    }

    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}