function scr_puzzle_init() {

    randomize();

    // ============================================================
    // CONTROLE DE FASES
    // ============================================================

    global.puzzle_fase = 1;
    global.puzzle_contador_na_fase = 0;
    global.puzzle_por_fase = 6;

    // ============================================================
    // DADOS DO PUZZLE ATUAL
    // ============================================================

    global.puzzle_num_a = 0;
    global.puzzle_num_b = 0;
    global.puzzle_resposta_correta = 0;
    global.puzzle_operador = "+";
    global.puzzle_pergunta  = "";
	global.puzzle_pergunta2 = ""; // segunda linha — usada só na fase 4
    global.puzzle_resposta_jogador = "";

    // ============================================================
    // ESTADO DO PUZZLE
    // ============================================================

    global.puzzle_ativo = false;
    global.puzzle_resultado = "";
    global.puzzle_feedback_timer = 0;
    global.puzzle_feedback_duracao = 120;

    // Flag do evento alienígena — Programador 3 usa para efeitos visuais
    // true  = fase 4 ativa, pisca tela vermelha e toca alarme
    // false = fases normais, sem efeito especial
    global.puzzle_alieniga = false;

    // ============================================================
    // STATUS DA NAVE (lidos pelo Programador 1)
    // ============================================================

    global.score = 0;
    global.energia = 100;
    global.oxigenio = 100;
    global.game_over = false;
}