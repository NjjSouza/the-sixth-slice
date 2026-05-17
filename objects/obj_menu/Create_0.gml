// =====================
// MUSICA
// =====================

if (!instance_exists(obj_audio_manager))
    instance_create_layer(0, 0, "Instances", obj_audio_manager);

AudioManager_Play(snd_menu);


// =====================
// GLITCH
// =====================

glitch_timer = 0;


// =====================
// BOOT SYSTEM
// =====================

booting = false;

boot_texts = [
    "INICIANDO SISTEMA DA NAVE...",
    "VERIFICANDO ENERGIA...",
    "VERIFICANDO OXIGENIO...",
    "VERIFICANDO INTEGRIDADE ESTRUTURAL...",
    "SISTEMAS SECUNDARIOS ONLINE...",
    "INTELIGENCIA ARTIFICIAL: ATIVA",
    "TODOS SISTEMAS ONLINE"
];

boot_index   = 0;
boot_counter = 0;
boot_delay   = 30;


// =====================
// CURSOR PISCANTE
// =====================

cursor_timer   = 0;
cursor_visivel = true;