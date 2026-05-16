
// =====================
// FUNDO BASE
// =====================

draw_set_color(make_color_rgb(10,15,25));
draw_rectangle(0,0,room_width,room_height,false);


// =====================
// BOOT MODE
// =====================

if (booting)
{
    var start_y = room_height/2 - 80;
    var g = irandom_range(-2, 2);

    for (var i = 0; i < boot_index; i++)
    {
        var txt = boot_texts[i];

        if (i == array_length(boot_texts) - 1)
        {
            draw_set_color(make_color_rgb(80,255,120));
        }
        else
        {
            draw_set_color(make_color_rgb(180,220,255));
        }

        draw_text(
            room_width/2 - string_width(txt)/2 + g,
            start_y + i * 22,
            txt
        );
    }

    // CURSOR PISCANTE
    if (cursor_visivel && boot_index < array_length(boot_texts))
    {
        draw_set_color(make_color_rgb(80,255,120));
        draw_text(
            room_width/2 - string_width("_")/2,
            start_y + boot_index * 22,
            "_"
        );
    }

    // overlay escuro leve
    draw_set_alpha(0.4);
    draw_set_color(c_black);
    draw_rectangle(0,0,room_width,room_height,false);
    draw_set_alpha(1);

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
// STATUS
// =====================

draw_set_color(make_color_rgb(80,180,220));
draw_text(20, 20, "SISTEMA: INATIVO");

draw_set_color(make_color_rgb(255,80,80));
draw_text(20, 40, "NAVE: INSTAVEL");


// =====================
// TÍTULO
// =====================

var titulo = "NAVE EM COLAPSO";

var gx = 0;
var gy = 0;

if (glitch_timer > 0)
{
    gx = irandom_range(-3, 3);
    gy = irandom_range(-2, 2);
}

var titulo_x = room_width/2 - string_width(titulo)/2;
var titulo_y = 140;

draw_set_color(c_red);
draw_text(titulo_x + gx + 2, titulo_y + gy, titulo);

draw_set_color(c_white);
draw_text(titulo_x + gx, titulo_y + gy, titulo);


// =====================
// INSTRUÇÕES
// =====================

draw_set_color(make_color_rgb(180,220,255));
draw_text(
    room_width/2 - string_width("[ ENTER ] INICIAR   |   [ ESC ] SAIR")/2,
    320,
    "[ ENTER ] INICIAR   |   [ ESC ] SAIR"
);


// =====================
// STATUS FINAL
// =====================

draw_set_color(make_color_rgb(255,210,80));
draw_text(
    room_width/2 - string_width(">> SISTEMA AGUARDANDO <<")/2,
    360,
    ">> SISTEMA AGUARDANDO <<"
);


// =====================
// RESET FINAL
// =====================

draw_set_alpha(1);
draw_set_color(c_white);