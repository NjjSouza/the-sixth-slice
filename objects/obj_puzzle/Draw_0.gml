if (global.puzzle_ativo) {

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Pergunta
    draw_set_color(c_white);
    draw_text(room_width * 0.5, room_height * 0.4, global.puzzle_pergunta);

    // Resposta digitada
    draw_text(room_width * 0.5, room_height * 0.5, global.puzzle_resposta_jogador + "_");
}

// Feedback correto/errado
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

draw_set_halign(fa_left);
draw_set_color(c_white);