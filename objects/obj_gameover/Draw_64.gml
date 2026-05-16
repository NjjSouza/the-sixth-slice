
// =====================
// SHAKE
// =====================

var sx = 0;
var sy = 0;

if (shake_timer > 0)
{
    sx = irandom_range(-4, 4);
    sy = irandom_range(-3, 3);
    shake_timer--;
}


// =====================
// FUNDO
// =====================

draw_set_color(make_color_rgb(5,5,10));
draw_rectangle(sx, sy, room_width + sx, room_height + sy, false);


// =====================
// OVERLAY VERMELHO
// =====================

draw_set_alpha(0.15);
draw_set_color(c_red);
draw_rectangle(sx, sy, room_width + sx, room_height + sy, false);
draw_set_alpha(1);


// =====================
// GAME OVER (CENTRALIZADO CORRETO)
// =====================

var texto = "GAME OVER";

var gx = 0;
var gy = 0;

// glitch leve
if (irandom(100) < 3)
{
    gx = irandom_range(-2, 2);
    gy = irandom_range(-2, 2);
}

var scale = 2;

// centro da tela
var center_x = room_width / 2;
var center_y = 140;

// largura real com escala
var text_w = string_width(texto) * scale;

// posição final correta
var draw_x = center_x - (text_w / 2);
var draw_y = center_y;


// =====================
// DESENHO DO TÍTULO
// =====================

// sombra/glitch vermelho
draw_set_color(c_red);
draw_text_transformed(draw_x + gx + sx + 3, draw_y + gy + sy, texto, scale, scale, 0);
draw_text_transformed(draw_x + gx + sx - 2, draw_y + gy + sy, texto, scale, scale, 0);

// principal
draw_set_color(c_white);
draw_text_transformed(draw_x + gx + sx, draw_y + gy + sy, texto, scale, scale, 0);


// =====================
// SUBTEXTO
// =====================

var sub = "A NAVE COLAPSOU";

draw_set_color(c_white);
draw_text(room_width/2 - string_width(sub)/2 + sx, 260 + sy, sub);


// =====================
// INSTRUÇÃO
// =====================

var txt = "PRESSIONE R PARA REINICIAR";

draw_set_color(make_color_rgb(180,220,255));
draw_text(room_width/2 - string_width(txt)/2 + sx, 340 + sy, txt);