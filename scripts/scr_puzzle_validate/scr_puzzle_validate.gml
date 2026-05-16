function scr_puzzle_validate() {

    // Converte o texto digitado pelo jogador em número
    // Ex: "25" (texto) vira 25 (número) para poder comparar
    var resposta_digitada = real(global.puzzle_resposta_jogador);

    // Calcula a diferença entre o que o jogador digitou e a resposta certa
    // abs() garante que a diferença seja sempre positiva
    // Ex: jogador digitou 24, resposta era 25 → diferença = 1
    var diferenca = abs(resposta_digitada - global.puzzle_resposta_correta);


    // ============================================================
    // RESPOSTA CORRETA
    // ============================================================
    // Usa tolerância de 0.01 para evitar problemas de ponto flutuante
    // Ex: sqrt(4) pode retornar 1.9999 ao invés de 2 — a tolerância aceita isso
    if (diferenca <= 0.01) {

        global.puzzle_resultado = "correto";

        // Adiciona 100 pontos ao score
        global.score += 100;

        // Avança o contador — controla qual operação está ativa dentro da fase
        // e quando a fase termina
        global.puzzle_contador_na_fase += 1;

        // Verifica se completou os 6 puzzles da fase (3 + 3)
        if (global.puzzle_contador_na_fase >= 6) {

            // Avança para a próxima fase
            global.puzzle_fase += 1;

            // Zera o contador para começar do zero na nova fase
            global.puzzle_contador_na_fase = 0;

            // Se passou da fase 3 (a última), trava na 3 e continua infinito
            // O jogo nunca acaba por fases — só acaba se a nave morrer
            if (global.puzzle_fase > 3) {
                global.puzzle_fase = 3;
                // contador já está em 0, então vai repetir
                // potência e radiciação para sempre
            }
        }


    // ============================================================
    // RESPOSTA ERRADA
    // ============================================================
    } else {

        global.puzzle_resultado = "errado";

        // Penaliza a nave
        global.energia  -= 15;
        global.oxigenio -= 10;

        // Trava em 0 — não deixa ficar negativo
        if (global.energia  < 0) { global.energia  = 0; }
        if (global.oxigenio < 0) { global.oxigenio = 0; }

        // Se qualquer um dos dois chegar a zero, o jogo acaba
        // O Programador 1 lê global.game_over para mostrar a tela de game over
        if (global.energia <= 0 or global.oxigenio <= 0) {
            global.game_over = true;
        }
    }


    // ============================================================
    // FINALIZA O PUZZLE ATUAL
    // ============================================================

    // Tira o puzzle da tela
    global.puzzle_ativo = false;

    // Inicia o timer de feedback (CORRETO! ou ERRADO! por 2 segundos)
    // Quando esse timer zerar, o Step Event chama scr_puzzle_generate()
    // e o próximo puzzle aparece automaticamente
    global.puzzle_feedback_timer = global.puzzle_feedback_duracao;
}