
// =====================
// RESET
// =====================
alerta = "SISTEMAS ESTAVEIS";
var sistemas_criticos = 0;


// =====================
// CHECAGEM DE CRÍTICOS
// =====================

if (energia <= 15) sistemas_criticos += 1;
if (oxigenio <= 15) sistemas_criticos += 1;
if (integridade <= 15) sistemas_criticos += 1;


// =====================
// PRIORIDADE MÁXIMA
// =====================

if (sistemas_criticos == 3)
{
    alerta = "NAVE EM COLAPSO";
}
else if (sistemas_criticos >= 2)
{
    alerta = "MULTIPLAS FALHAS";
}
else
{
    // =====================
    // ALERTAS INDIVIDUAIS
    // =====================

    if (energia <= 30)
    {
        alerta = "ENERGIA CRITICA";
    }
    else if (oxigenio <= 30)
    {
        alerta = "OXIGENIO BAIXO";
    }
    else if (integridade <= 30)
    {
        alerta = "FALHA ESTRUTURAL";
    }
}

// =====================
// DETECTAR MUDANÇA DE ALERTA
// =====================

if (alerta != alerta_anterior)
{
    shake_alerta = 10; // duração do tremor
    alerta_anterior = alerta;
}






// =====================
// GARANTIR LIMITES
// =====================

energia = max(energia, 0);
oxigenio = max(oxigenio, 0);
integridade = max(integridade, 0);


// =====================
// SIMULAÇÃO DE SISTEMAS
// =====================

// energia cai lentamente
energia -= 0.03;

// oxigênio cai um pouco mais lento
oxigenio -= 0.02;

// integridade cai bem mais devagar (estrutura é mais estável)
integridade -= 0.01;


// =====================
// GARANTIR LIMITES
// =====================

energia = max(energia, 0);
oxigenio = max(oxigenio, 0);
integridade = max(integridade, 0);


// =====================
// TESTE GAME OVER GLOBAL
// =====================

if (energia <= 0 || oxigenio <= 0 || integridade <= 0)
{
    room_goto(rm_gameover);
}