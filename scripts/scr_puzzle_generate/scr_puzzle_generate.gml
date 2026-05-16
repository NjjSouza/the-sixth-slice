function scr_puzzle_generate() {

    // Limpa o que o jogador digitou na rodada anterior
    global.puzzle_resposta_jogador = "";

    // Coloca o puzzle na tela
    global.puzzle_ativo = true;

    // Limpa o resultado anterior (correto/errado)
    global.puzzle_resultado = "";


    // ============================================================
    // FASE 1 — SOMA e SUBTRAÇÃO
    // ============================================================
    // Entra aqui quando global.puzzle_fase == 1
    // O contador vai de 0 a 5 (6 puzzles no total)
    // Puzzles 0, 1, 2 → SOMA
    // Puzzles 3, 4, 5 → SUBTRAÇÃO
    // ============================================================

    if (global.puzzle_fase == 1) {

        // Sorteia dois números entre 1 e 20
        global.puzzle_num_a = scr_random_range_int(1, 20);
        global.puzzle_num_b = scr_random_range_int(1, 20);

        if (global.puzzle_contador_na_fase < 3) {

            // --- SOMA ---
            // Ex: "14 + 7 = ?"
            global.puzzle_operador = "+";
            global.puzzle_resposta_correta = global.puzzle_num_a + global.puzzle_num_b;

        } else {

            // --- SUBTRAÇÃO ---
            // Antes de subtrair, garante que num_a >= num_b
            // para o resultado nunca ser negativo
            // Ex: se sorteou 5 e 12, troca para 12 - 5 = 7
            if (global.puzzle_num_a < global.puzzle_num_b) {
                var temp        = global.puzzle_num_a;
                global.puzzle_num_a = global.puzzle_num_b;
                global.puzzle_num_b = temp;
            }

            global.puzzle_operador = "-";
            global.puzzle_resposta_correta = global.puzzle_num_a - global.puzzle_num_b;
        }

        // Monta o texto da pergunta que aparece na tela
        // Ex: "14 + 7 = ?" ou "12 - 5 = ?"
        global.puzzle_pergunta = string(global.puzzle_num_a)
                                + " " + global.puzzle_operador + " "
                                + string(global.puzzle_num_b) + " = ?";
    }


    // ============================================================
    // FASE 2 — MULTIPLICAÇÃO e DIVISÃO
    // ============================================================
    // Puzzles 0, 1, 2 → MULTIPLICAÇÃO
    // Puzzles 3, 4, 5 → DIVISÃO
    // ============================================================

    else if (global.puzzle_fase == 2) {

        if (global.puzzle_contador_na_fase < 3) {

            // --- MULTIPLICAÇÃO ---
            // Números entre 2 e 12 (tabuada clássica)
            // Ex: "7 X 8 = ?"
            global.puzzle_num_a = scr_random_range_int(2, 12);
            global.puzzle_num_b = scr_random_range_int(2, 12);
            global.puzzle_operador = "X";
            global.puzzle_resposta_correta = global.puzzle_num_a * global.puzzle_num_b;
            global.puzzle_pergunta = string(global.puzzle_num_a)
                                    + " X " + string(global.puzzle_num_b) + " = ?";

        } else {

            // --- DIVISÃO EXATA (sem resto) ---
            // Truque: geramos o divisor e o resultado separado,
            // depois multiplicamos para achar o dividendo.
            // Assim a divisão SEMPRE dá número inteiro.
            // Ex: divisor=4, resultado=6 → dividendo=24 → "24 / 4 = ?"
            var divisor   = scr_random_range_int(2, 10);
            var resultado = scr_random_range_int(2, 10);
            var dividendo = divisor * resultado;

            global.puzzle_num_a = dividendo;  // número que será dividido
            global.puzzle_num_b = divisor;    // número que divide
            global.puzzle_operador = "/";
            global.puzzle_resposta_correta = resultado;
            global.puzzle_pergunta = string(global.puzzle_num_a)
                                    + " / " + string(global.puzzle_num_b) + " = ?";
        }
    }


    // ============================================================
    // FASE 3 — POTÊNCIA e RADICIAÇÃO
    // ============================================================
    // Puzzles 0, 1, 2 → POTÊNCIA (base ao quadrado)
    // Puzzles 3, 4, 5 → RADICIAÇÃO (raiz quadrada)
    // ============================================================

    else if (global.puzzle_fase == 3) {

        if (global.puzzle_contador_na_fase < 3) {

            // --- POTÊNCIA ---
            // Sempre eleva ao quadrado para não gerar números absurdos
            // Ex: base=5 → "5^2 = ?" → resposta = 25
            global.puzzle_num_a = scr_random_range_int(2, 9); // base entre 2 e 9
            global.puzzle_num_b = 2;                           // expoente fixo
            global.puzzle_operador = "^2";
            global.puzzle_resposta_correta = global.puzzle_num_a * global.puzzle_num_a;
            global.puzzle_pergunta = string(global.puzzle_num_a) + "^2 = ?";

        } else {

            // --- RADICIAÇÃO ---
            // Usa apenas quadrados perfeitos para a resposta ser sempre inteira
            // Ex: sqrt(36) = 6, sqrt(49) = 7
            // Se usássemos números aleatórios, poderíamos ter sqrt(17) = 4.123...
            var quadrados_perfeitos = [4, 9, 16, 25, 36, 49, 64, 81];

            // Sorteia um índice da lista (0 a 7)
            var indice = scr_random_range_int(0, array_length(quadrados_perfeitos) - 1);
            var numero = quadrados_perfeitos[indice];

            global.puzzle_num_a = numero;
            global.puzzle_num_b = 0; // não tem segundo número na raiz
            global.puzzle_operador = "sqrt";
            // round() evita que sqrt(4) retorne 1.9999... ao invés de 2
            global.puzzle_resposta_correta = round(sqrt(numero));
            global.puzzle_pergunta = "sqrt(" + string(global.puzzle_num_a) + ") = ?";
        }
    }
}