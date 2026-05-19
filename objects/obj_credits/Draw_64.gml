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

// clip duro - nada renderiza fora da caixa
gpu_set_scissor(box_x + 1, box_y + 1, box_w - 2, box_h - 2);

for (var i = 0; i < array_length(linhas); i++) {
    var linha = linhas[i];
    var ly    = scroll_y + i * 28;

    if (ly < box_y || ly > box_y + box_h) continue;

    if (string_pos("==", linha) > 0) {
        draw_set_color(make_color_rgb(255, 238, 226));
    } else if (linha == "ORBITANDO") {
        draw_set_color(make_color_rgb(185, 13, 3));
    } else if (string_pos("jogar", linha) > 0) {
        draw_set_color(make_color_rgb(120, 255, 255));
    } else {
        draw_set_color(make_color_rgb(235, 235, 255));
    }

    draw_text(cx, ly, linha);
}

gpu_set_scissor(0, 0, display_get_gui_width(), display_get_gui_height()); // reseta para tela cheia

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

draw_set_color(make_color_rgb(222, 164, 131));
draw_set_halign(fa_center);
draw_text(cx, display_get_gui_height() - 24, "[ESC] voltar ao menu");


// =====================
// RESET
// =====================

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// =====================
// RETRATOS DA EQUIPE
// =====================

var retrato_tam = 0.15;

// coluna esquerda e direita (fora da caixa de 500px)
var col_esq = cx - 400;
var col_dir = cx + 400;

// duas alturas
var linha_top = box_y + 185;      
var linha_bot = box_y + box_h - 160;

var membros_sprites = [ spr_julia,   spr_ana_julia,      spr_carol,        spr_samile    ];
var membros_nomes   = [ "Julia ",     "Ana Julia",       "Calorine",        "Samile"   ];
var membros_x       = [ col_esq,      col_dir,           col_esq,            col_dir        ];
var membros_y       = [ linha_top,    linha_top,         linha_bot,          linha_bot      ];

for (var i = 0; i < 4; i++) {
    var rx = membros_x[i];
    var ry = membros_y[i];

    var rw = sprite_get_width(membros_sprites[i])  * retrato_tam;
    var rh = sprite_get_height(membros_sprites[i]) * retrato_tam;

    draw_sprite_ext(
        membros_sprites[i], 0,
        rx - rw / 2,
        ry - rh,
        retrato_tam, retrato_tam,
        0, c_white, 1
    );

    draw_set_halign(fa_center);
    draw_set_color(make_color_rgb(235, 235, 255));
    draw_text(rx, ry + 4, membros_nomes[i]);
}
