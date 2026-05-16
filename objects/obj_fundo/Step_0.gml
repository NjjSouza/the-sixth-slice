
// =====================
// MOVER ESTRELAS
// =====================

for (var i = 0; i < estrelas_qtd; i++)
{
    estrelas_y[i] += estrelas_vel[i];

    // volta pelo topo quando sai por baixo
    if (estrelas_y[i] > 768)
    {
        estrelas_y[i] = 0;
        estrelas_x[i] = irandom(1366);
    }
}