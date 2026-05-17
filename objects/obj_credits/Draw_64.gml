var cx = display_get_gui_width()  / 2;
var cy = display_get_gui_height() / 2;

// =====================
// CAIXA CENTRAL
// =====================

var box_w = 500;
var box_h = display_get_gui_height() - 80;
var box_x = cx - box_w / 2;
var box_y = 40;

draw_set_alpha(0.80);
draw_set_color(make_color_rgb(8, 6, 24)); // fundo roxo escuro
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, false);
draw_set_alpha(1);

draw_set_color(make_color_rgb(0, 255, 255)); // cyan neon
draw_rectangle(box_x, box_y, box_x + box_w, box_y + box_h, true);


// =====================
// SCROLL DE LINHAS
// =====================

draw_set_halign(fa_center);
draw_set_valign(fa_top);

for (var i = 0; i < array_length(linhas); i++) {

    var linha = linhas[i];
    var ly    = scroll_y + i * 28;

    // só desenha se estiver dentro da caixa
    if (ly < box_y || ly > box_y + box_h) continue;

    // estilo por conteúdo
    if (string_pos("==", linha) > 0) {
        draw_set_color(make_color_rgb(255, 230, 120)); // amarelo neon
    } else if (linha == "NAVE EM COLAPSO") {
        draw_set_color(make_color_rgb(255, 60, 200)); // rosa neon
    } else if (linha == "Obrigada por jogar! o7") {
        draw_set_color(make_color_rgb(120, 255, 255)); // cyan claro
    } else {
        draw_set_color(make_color_rgb(235, 235, 255)); // branco azulado
    }

    draw_text(cx, ly, linha);
}


// =====================
// MÁSCARA FADE NAS BORDAS DA CAIXA
// =====================

var fade_h = 40;

// topo
for (var f = 0; f < fade_h; f++) {
    draw_set_alpha((1 - f / fade_h) * 0.92);
    draw_set_color(make_color_rgb(8, 6, 24));
    draw_rectangle(box_x + 1, box_y + f, box_x + box_w - 1, box_y + f + 1, false);
}

// base
for (var f = 0; f < fade_h; f++) {
    draw_set_alpha((f / fade_h) * 0.92);
    draw_set_color(make_color_rgb(8, 6, 24));
    draw_rectangle(box_x + 1, box_y + box_h - f, box_x + box_w - 1, box_y + box_h - f + 1, false);
}

draw_set_alpha(1);


// =====================
// HINT ESC
// =====================

draw_set_color(make_color_rgb(180, 140, 255)); // lilás neon suave
draw_set_halign(fa_center);
draw_text(cx, display_get_gui_height() - 24, "[ESC] voltar ao menu");


// =====================
// RESET
// =====================

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
