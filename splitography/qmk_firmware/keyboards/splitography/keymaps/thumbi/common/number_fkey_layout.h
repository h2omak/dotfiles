
// const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

// ......................................................... Number Keypad Layer

  // .-----------------------------------------------------------------------------------.
  // |      |   F  |   E  |   D  |      |      |      |   /  |   7  |   8  |   9  |   *  |
  // |-----------------------------------------------------------------------------------|
  // |  GUI |   C  |   B  |   A  |      |      |      |   .  |   4  |   5  |   6  |   -  |
  // |-----------------------------------------------------------------------------------|
  // |      |   X  |   G  |   \  |      |      |      |   ,  |   1  |   2  |   3  |   +  |
  // |-----------------------------------------------------------------------------------|
  // |                           |      |  f() |  0/= |  =/0 |                           |
  // '-----------------------------------------------------------------------------------'

[_NUMBER] = {
  {_______, KC_F,    MT_E,    KC_D,    _______, ___x___, ___x___, KC_SLSH, KC_7,    KC_8,    KC_9,    KC_ASTR},
  {OS_GUI,  CT_C,    AT_B,    ST_A,    _______, ___x___, ___x___, TD_DOT,  KC_4,    KC_5,    KC_6,    KC_MINS},
  {_______, KC_X,    SM_G,    KC_BSLS, _______, ___x___, ___x___, TD_COMM, KC_1,    KC_2,    KC_3,    KC_PLUS},
#ifdef THUMB_0
  {_______, _______, _______, _______, ___x___, ___fn__, KC_0,    KC_EQL,  _______, _______, _______, _______},
#else
  {_______, _______, _______, _______, ___x___, ___fn__, KC_EQL,  KC_0,    _______, _______, _______, _______},
#endif
},

  // ............ .................................................. Function Keys

  // .-----------------------------------------------------------------------------------.
  // |      |      |      |      |      |      |      |      |  F7  |  F8  |  F9  |  F12 |
  // |-----------------------------------------------------------------------------------|
  // |  GUI | Ctrl |  Alt | Shift|      |      |      |      |  F4  |  F5  |  F6  |  F11 |
  // |-----------------------------------------------------------------------------------|
  // |      |      |      |      |      |      |      |      |  F1  |  F2  |  F3  |  F10 |
  // |-----------------------------------------------------------------------------------|
  // |                           |      |      |  f() |      |                           |
  // '-----------------------------------------------------------------------------------'

  [_FNCKEY] = {
    {_______, _______, _______, _______, _______, ___x___, ___x___, _______, KC_F7,   KC_F8,   KC_F9,   KC_F12 },
    {OS_GUI,  OS_CTL,  OS_ALT,  OS_SFT,  _______, ___x___, ___x___, _______, KC_F4,   KC_F5,   KC_F6,   KC_F11 },
    {_______, _______, _______, _______, _______, ___x___, ___x___, _______, KC_F1,   KC_F2,   KC_F3,   KC_F10 },
    {_______, _______, _______, _______, ___x___, ___x___, ___fn__, ___x___, _______, _______, _______, _______},
  },
