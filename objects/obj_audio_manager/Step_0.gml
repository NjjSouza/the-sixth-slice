// FADE OUT — diminui até 0, depois troca e faz fade in
if (fade_out) {
    fade_volume -= fade_speed;
    if (faixa_atual != -1) audio_sound_gain(faixa_atual, fade_volume, 0);

    if (fade_volume <= 0) {
        if (faixa_atual != -1) audio_stop_sound(faixa_atual);
        fade_out    = false;
        fade_volume = 0;

        if (proxima_faixa != -1) {
            faixa_atual  = audio_play_sound(proxima_faixa, 1, true);
            audio_sound_gain(faixa_atual, 0, 0);
            fade_in = true;
        }
    }
}

// FADE IN — sobe volume até 1
if (fade_in) {
    fade_volume += fade_speed;
    if (faixa_atual != -1) audio_sound_gain(faixa_atual, fade_volume, 0);

    if (fade_volume >= 1.0) {
        fade_volume = 1.0;
        fade_in     = false;
    }
}