/// @function scr_puzzle_draw()
/// @description Desenha o puzzle na tela.
///              Chame isso no Draw Event do obj_puzzle.

function scr_puzzle_draw() {

    // Salva as configurações de fonte/cor atuais para restaurar depois
    // (boa prática para não bagunçar o Draw de outros objetos)
    var cor_anterior = draw_get_color();

    // -----------------------------------------------------------
    // DESENHA O PUZZLE ATIVO
    // -----------------------------------------------------------
    if (global.puzzle_ativo) {

        // Fundo semi-transparente atrás do puzzle (caixa escura)
        // room_width e room_height são o tamanho da tela
        draw_set_alpha(0.7);          // 70% opaco
        draw_set_color(c_black);
        draw_rectangle(
            room_width  * 0.2,   // x esquerdo  (20% da tela)
            room_height * 0.3,   // y de cima   (30% da tela)
            room_width  * 0.8,   // x direito   (80% da tela)
            room_height * 0.7,   // y de baixo  (70% da tela)
            false                // false = preenchido, true = só borda
        );
        draw_set_alpha(1); // volta para 100% opaco

        // Borda da caixa em amarelo
        draw_set_color(c_yellow);
        draw_rectangle(
            room_width  * 0.2,
            room_height * 0.3,
            room_width  * 0.8,
            room_height * 0.7,
            true // true = só a borda
        );

        // Título da fase (ex: "FASE 1 — SOMA E SUBTRAÇÃO")
        draw_set_color(c_white);
        draw_set_halign(fa_center);  // alinha texto ao centro horizontalmente
        draw_set_valign(fa_top);     // alinha texto ao topo verticalmente

        // Texto do nome da fase
        var nome_fase = "";
        if      (global.puzzle_fase == 1) { nome_fase = "FASE 1 — SOMA / SUBTRAÇÃO"; }
        else if (global.puzzle_fase == 2) { nome_fase = "FASE 2 — MULTIPLICAÇÃO / DIVISÃO"; }
        else if (global.puzzle_fase == 3) { nome_fase = "FASE 3 — POTÊNCIA / RADICIAÇÃO"; }
        else if (global.puzzle_fase == 4) { nome_fase = "FASE 4 — FRAÇÕES"; }

        draw_text(room_width * 0.5, room_height * 0.33, nome_fase);

        // Indicador de progresso (ex: "Puzzle 2 de 3")
        var progresso = "Puzzle "
                       + string(global.puzzle_contador_na_fase + 1)
                       + " de " + string(global.puzzle_por_fase);
        draw_text(room_width * 0.5, room_height * 0.38, progresso);

        // A pergunta principal (grande, no centro)
        draw_set_color(c_yellow);
        // GameMaker não tem draw_text com tamanho embutido sem font asset
        // Você vai precisar criar uma Font no GameMaker e usar draw_set_font()
        // Por agora, usa a fonte padrão
        draw_text(room_width * 0.5, room_height * 0.46, global.puzzle_pergunta);

        // A resposta que o jogador está digitando
        draw_set_color(c_white);
        draw_text(
            room_width * 0.5,
            room_height * 0.55,
            "Sua resposta: " + global.puzzle_resposta_jogador + "_" // _ simula cursor
        );

        // Instrução para o jogador
        draw_set_color(c_ltgray); // cinza claro
        draw_text(
            room_width * 0.5,
            room_height * 0.62,
            "Digite e pressione ENTER"
        );
    }

    // -----------------------------------------------------------
    // FEEDBACK DE CORRETO / ERRADO (aparece por 2 segundos)
    // -----------------------------------------------------------
    if (global.puzzle_feedback_timer > 0) {

        if (global.puzzle_resultado == "correto") {
            // Texto verde de acerto
            draw_set_color(c_green);
            draw_text(room_width * 0.5, room_height * 0.1, "✓ CORRETO! +100 pontos");

        } else if (global.puzzle_resultado == "errado") {
            // Texto vermelho de erro
            draw_set_color(c_red);
            draw_text(
                room_width * 0.5,
                room_height * 0.1,
                "✗ ERRADO!  Energia -15  Oxigênio -10"
            );
        }
    }

    // -----------------------------------------------------------
    // HUD: SCORE E STATUS (sempre visível)
    // -----------------------------------------------------------
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_text(10, 10, "Score: " + string(global.score));
    draw_text(10, 30, "Energia:  " + string(global.energia));
    draw_text(10, 50, "Oxigênio: " + string(global.oxigenio));
    draw_text(10, 70, "Fase: "     + string(global.puzzle_fase));

    // Restaura a cor original (boa prática)
    draw_set_color(cor_anterior);
    draw_set_halign(fa_left);
}