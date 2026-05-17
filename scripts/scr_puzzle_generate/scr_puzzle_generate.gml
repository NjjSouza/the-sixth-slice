function scr_puzzle_generate() {

    global.puzzle_resposta_jogador = "";
    global.puzzle_ativo            = true;
    global.puzzle_resultado        = "";
    global.puzzle_pergunta2        = "";

    // FASE ALEATÓRIA a cada pergunta (1 = básico ... 4 = alien)
    var fase = irandom_range(1, 4);
    global.puzzle_fase = fase;

    // FASE 1 — SOMA e SUBTRACAO
    if (fase == 1) {

        global.puzzle_num_a = scr_random_range_int(1, 20);
        global.puzzle_num_b = scr_random_range_int(1, 20);

        if (irandom(1) == 0) {
            global.puzzle_operador         = "+";
            global.puzzle_resposta_correta = global.puzzle_num_a + global.puzzle_num_b;
        } else {
            if (global.puzzle_num_a < global.puzzle_num_b) {
                var temp            = global.puzzle_num_a;
                global.puzzle_num_a = global.puzzle_num_b;
                global.puzzle_num_b = temp;
            }
            global.puzzle_operador         = "-";
            global.puzzle_resposta_correta = global.puzzle_num_a - global.puzzle_num_b;
        }

        global.puzzle_pergunta = string(global.puzzle_num_a)
                               + " " + global.puzzle_operador + " "
                               + string(global.puzzle_num_b) + " = ?";
        global.puzzle_alieniga = false;
    }

    // FASE 2 — MULTIPLICACAO e DIVISAO
    else if (fase == 2) {

        if (irandom(1) == 0) {
            global.puzzle_num_a            = scr_random_range_int(2, 12);
            global.puzzle_num_b            = scr_random_range_int(2, 12);
            global.puzzle_operador         = "X";
            global.puzzle_resposta_correta = global.puzzle_num_a * global.puzzle_num_b;
            global.puzzle_pergunta         = string(global.puzzle_num_a)
                                           + " X " + string(global.puzzle_num_b) + " = ?";
        } else {
            var divisor   = scr_random_range_int(2, 10);
            var resultado = scr_random_range_int(2, 10);
            var dividendo = divisor * resultado;

            global.puzzle_num_a            = dividendo;
            global.puzzle_num_b            = divisor;
            global.puzzle_operador         = "/";
            global.puzzle_resposta_correta = resultado;
            global.puzzle_pergunta         = string(global.puzzle_num_a)
                                           + " / " + string(global.puzzle_num_b) + " = ?";
        }
        global.puzzle_alieniga = false;
    }

    // FASE 3 — POTENCIA e RAIZ
    else if (fase == 3) {

        if (irandom(1) == 0) {
            global.puzzle_num_a            = scr_random_range_int(2, 9);
            global.puzzle_num_b            = 2;
            global.puzzle_operador         = "^2";
            global.puzzle_resposta_correta = global.puzzle_num_a * global.puzzle_num_a;
            global.puzzle_pergunta         = string(global.puzzle_num_a) + "^2 = ?";
        } else {
            var quadrados_perfeitos = [4, 9, 16, 25, 36, 49, 64, 81];
            var indice              = scr_random_range_int(0, array_length(quadrados_perfeitos) - 1);
            var numero              = quadrados_perfeitos[indice];

            global.puzzle_num_a            = numero;
            global.puzzle_num_b            = 0;
            global.puzzle_operador         = "sqrt";
            global.puzzle_resposta_correta = round(sqrt(numero));
            global.puzzle_pergunta         = "sqrt(" + string(global.puzzle_num_a) + ") = ?";
        }
        global.puzzle_alieniga = false;
    }

    // FASE 4 — EVENTO ALIENIGENA
    else if (fase == 4) {

        global.puzzle_alieniga = true;

        if (irandom(1) == 0) {
            var a     = scr_random_range_int(1, 4);
            var b     = scr_random_range_int(1, 9);
            var x_val = scr_random_range_int(1, 5);

            global.puzzle_num_a            = a;
            global.puzzle_num_b            = b;
            global.puzzle_operador         = "f(x)+";
            global.puzzle_resposta_correta = (a * x_val) + b;
            global.puzzle_pergunta         = "f(x) = " + string(a) + "x + " + string(b);
            global.puzzle_pergunta2        = "f(" + string(x_val) + ") = ?";
        } else {
            var a     = scr_random_range_int(2, 6);
            var b     = scr_random_range_int(1, 8);
            var x_val = scr_random_range_int(2, 7);

            global.puzzle_resposta_correta = (a * x_val) - b;
            if (global.puzzle_resposta_correta < 0) {
                x_val += 1;
                global.puzzle_resposta_correta = (a * x_val) - b;
            }

            global.puzzle_num_a     = a;
            global.puzzle_num_b     = b;
            global.puzzle_operador  = "f(x)-";
            global.puzzle_pergunta  = "f(x) = " + string(a) + "x - " + string(b);
            global.puzzle_pergunta2 = "f(" + string(x_val) + ") = ?";
        }
    }
}