// =====================
// COR POR TIPO
// =====================

var cor;
var label;

if (tipo == "energia")
{
    cor   = make_color_rgb(120, 255, 120);
    label = "NRG";
}
else if (tipo == "oxigenio")
{
    cor   = make_color_rgb(100, 200, 255);
    label = "O2";
}
else // integridade
{
    cor   = make_color_rgb(255, 210, 80);
    label = "INT";
}


// =====================
// CORPO DO MONITOR
// =====================

draw_set_color(make_color_rgb(20, 30, 45));
draw_rectangle(x - 28, y - 36, x + 28, y + 36, false);

// Borda pulsante quando player está perto
var borda_cor = player_perto
    ? merge_colour(cor, c_white, pulso * 0.4)
    : merge_colour(cor, make_color_rgb(30, 40, 55), 0.5);

draw_set_color(borda_cor);
draw_rectangle(x - 28, y - 36, x + 28, y + 36, true);


// =====================
// TELA INTERNA
// =====================

draw_set_color(make_color_rgb(8, 14, 22));
draw_rectangle(x - 20, y - 28, x + 20, y + 16, false);


// =====================
// LABEL NA TELA
// =====================

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(cor);
draw_text(x, y - 8, label);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


// =====================
// PROMPT DE INTERAÇÃO
// =====================

if (player_perto)
{
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(x, y - 52, "[E] ACESSAR");
    draw_set_halign(fa_left);
}


// =====================
// RESET
// =====================

draw_set_color(c_white);