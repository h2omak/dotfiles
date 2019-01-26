
// const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = KEYMAP( 

// .................................................................... BEAKL SI

  [_BASE] = KEYMAP( 
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
      TD_EMOJ , KC_Y    , KC_O    , KC_U    , KC_Z    , CNTR_TL , CNTR_TR , KC_G    , KC_D    , KC_N    , KC_M    , KC_X    ,
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
      HOME_Q  , HOME_H  , HOME_E  , HOME_A  , KC_DOT  , CNTR_HL , CNTR_HR , KC_C    , HOME_T  , HOME_R  , HOME_S  , HOME_W  ,
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
      KC_J    , KC_MINS , KC_QUOT , KC_K    , KC_COMM , CNTR_BL , CNTR_BR , KC_B    , KC_P    , KC_L    , KC_F    , KC_V    ,
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
#ifdef SPLITOGRAPHY
      _______ , _______ , _______ , _______ , LT_ESC  , LT_I    , LT_SPC  , LT_BSPC , _______ , _______ , _______ , _______ 
#else
      OS_CTL  , OS_GUI  , OS_ALT  , LT_ESC  , LT_I    , LT_INS  , LT_LEFT , LT_SPC  , LT_BSPC , AT_DOWN , GT_UP  ,  CT_RGHT 
#endif
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
   ),

  [_SHIFT] = KEYMAP( 
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
      KC_COLN , S(KC_Y) , S(KC_O) , S(KC_U) , S(KC_Z) , ___x___ , ___x___ , S(KC_G) , S(KC_D) , S(KC_N) , S(KC_M) , S(KC_X) ,
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
      S(KC_Q) , S(KC_H) , S(KC_E) , S(KC_A) , KC_QUES , ___x___ , ___x___ , S(KC_C) , S(KC_T) , S(KC_R) , S(KC_S) , S(KC_W) ,
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
      S(KC_J) , KC_UNDS , KC_DQT  , S(KC_K) , KC_EXLM , ___x___ , ___x___ , S(KC_B) , S(KC_P) , S(KC_L) , S(KC_F) , S(KC_V) ,
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
#ifdef SPLITOGRAPHY
      _______ , _______ , _______ , _______ , KC_ESC  , S(KC_I) , KC_SPC  , KC_BSPC , _______ , _______ , _______ , _______ 
#else
      OS_CTL  , OS_GUI  , OS_ALT  , KC_ESC  , S(KC_I) , LT_INS  , LT_LEFT , KC_SPC  , KC_BSPC , AT_DOWN , GT_UP  ,  CT_RGHT 
#endif
  // ---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------+---------
   ),