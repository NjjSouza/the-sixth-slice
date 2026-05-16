function scr_puzzle_init() {

    // randomize() usa o relógio do computador como semente
    // sem ele, o GameMaker gera a mesma sequência de números toda partida
    randomize();

    // ============================================================
    // CONTROLE DE FASES
    // ============================================================

    // Começa sempre na fase 1 (soma e subtração)
    global.puzzle_fase = 1;

    // Quantos puzzles já foram resolvidos na fase atual
    // Zera quando troca de fase
    global.puzzle_contador_na_fase = 0;

    // Total de puzzles por fase antes de avançar
    // 6 = 3 da primeira operação + 3 da segunda operação
    global.puzzle_por_fase = 6;


    // ============================================================
    // DADOS DO PUZZLE ATUAL
    // ============================================================

    // Os dois números que aparecem na conta
    global.puzzle_num_a = 0;
    global.puzzle_num_b = 0;

    // A resposta certa — calculada internamente, o jogador não vê
    global.puzzle_resposta_correta = 0;

    // O símbolo da operação: "+", "-", "X", "/", "^2", "sqrt"
    global.puzzle_operador = "+";

    // O texto completo que aparece na tela — ex: "12 + 7 = ?"
    global.puzzle_pergunta = "";

    // O que o jogador foi digitando — começa vazio
    global.puzzle_resposta_jogador = "";


    // ============================================================
    // ESTADO DO PUZZLE
    // ============================================================

    // true  = puzzle está visível esperando resposta
    // false = entre puzzles (mostrando feedback ou aguardando)
    global.puzzle_ativo = false;

    // Guarda o resultado do último puzzle: "correto", "errado" ou ""
    global.puzzle_resultado = "";

    // Timer que controla por quanto tempo o feedback fica na tela
    // Conta em frames — o GameMaker roda a 60fps
    global.puzzle_feedback_timer = 0;

    // Duração do feedback: 120 frames = 2 segundos
    global.puzzle_feedback_duracao = 120;


    // ============================================================
    // STATUS DA NAVE (lidos pelo Programador 1)
    // ============================================================

    // Pontuação do jogador — sobe 100 a cada acerto
    global.score = 0;

    // Energia da nave — cai 15 a cada erro
    global.energia = 100;

    // Oxigênio da nave — cai 10 a cada erro
    global.oxigenio = 100;

    // Vira true quando energia ou oxigênio chegam a zero
    // O Programador 1 lê essa variável para acionar a tela de game over
    global.game_over = false;
}