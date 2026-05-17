if (booting)
{
    // overlay PRIMEIRO — fundo escuro antes de qualquer texto
    draw_set_alpha(0.75);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);

    var start_y = room_height/2 - 80;
    var g = irandom_range(-2, 2);

    for (var i = 0; i < boot_index; i++)
    {
        var txt = boot_texts[i];

        if (i == array_length(boot_texts) - 1)
            draw_set_color(make_color_rgb(80, 255, 120));
        else
            draw_set_color(c_white);

        draw_set_alpha(1);
        draw_text(
            room_width/2 - string_width(txt)/2 + g,
            start_y + i * 22,
            txt
        );
    }

    // CURSOR PISCANTE
    if (cursor_visivel && boot_index < array_length(boot_texts))
    {
        draw_set_color(make_color_rgb(80, 255, 120));
        draw_set_alpha(1);
        draw_text(
            room_width/2 - string_width("_")/2,
            start_y + boot_index * 22,
            "_"
        );
    }

    draw_set_alpha(1);
    draw_set_color(c_white);
    exit;
}


// =====================
// ESTÁTICA
// =====================

draw_set_alpha(0.05);

for (var i = 0; i < 80; i++)
{
    draw_set_color(c_white);
    draw_point(irandom(room_width), irandom(room_height));
}

draw_set_alpha(1);


// =====================
// PULSO
// =====================

var pulse = 0.5 + 0.5 * sin(current_time / 300);

draw_set_alpha(0.08 * pulse);
draw_set_color(make_color_rgb(80,180,220));
draw_rectangle(0,0,room_width,room_height,false);

draw_set_alpha(1);

// =====================
// SCANLINE
// =====================

var y_scan = (current_time div 10) mod room_height;

draw_set_alpha(0.03);
draw_set_color(c_white);
draw_rectangle(0, y_scan, room_width, y_scan + 2, false);

draw_set_alpha(1);

// =====================
// BOTÕES DO MENU
// =====================

var btn_x     = 250;  // posição à esquerda
var btn_scale = 1.8;  // tamanho maior (ajuste ao gosto)

// [ ENTER ] INICIAR — amarelo
var txt_iniciar = "[ ENTER ]  INICIAR";

// sombra
draw_set_color(make_color_rgb(255, 0, 255));
draw_text_transformed(btn_x + 3, 350, txt_iniciar, btn_scale, btn_scale, 0);

// principal
draw_set_color(c_white);
draw_text_transformed(btn_x, 350, txt_iniciar, btn_scale, btn_scale, 0);


// [ CTRL+ALT+C ] CRÉDITOS — rosa
var txt_credits = "[ CTRL + ALT]  CREDITOS";

// sombra
draw_set_color(make_color_rgb(255, 0, 255));
draw_text_transformed(btn_x + 3, 400, txt_credits, btn_scale, btn_scale, 0);

// principal
draw_set_color(c_white);
draw_text_transformed(btn_x, 400, txt_credits, btn_scale, btn_scale, 0);


// =====================
// RESET FINAL
// =====================

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);