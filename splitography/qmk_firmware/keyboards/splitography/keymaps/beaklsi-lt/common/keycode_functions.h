void asterisk(qk_tap_dance_state_t *state, void *user_data);
void backspace(qk_tap_dance_state_t *state, void *user_data);
void backspace_reset(qk_tap_dance_state_t *state, void *user_data);
void base_layer(uint8_t defer);
void cap_lt(qk_tap_dance_state_t *state, uint16_t keycode, uint8_t layer, uint8_t paragraph, uint16_t leader);
void clear_layers(void);
void colon(qk_tap_dance_state_t *state, void *user_data);
void colon_reset(qk_tap_dance_state_t *state, void *user_data);
void comma(qk_tap_dance_state_t *state, void *user_data);
void dot(qk_tap_dance_state_t *state, void *user_data);
void double_shift(uint16_t keycode, uint8_t layer);
void double_tap(uint8_t count, uint8_t shift, uint16_t keycode);
void emoji(qk_tap_dance_state_t *state, void *user_data);
void emoji_reset(qk_tap_dance_state_t *state, void *user_data);
void greater(qk_tap_dance_state_t *state, void *user_data);
void greater_reset(qk_tap_dance_state_t *state, void *user_data);
void lesser(qk_tap_dance_state_t *state, void *user_data);
void lesser_reset(qk_tap_dance_state_t *state, void *user_data);
void lt_shift(keyrecord_t *record, uint8_t shift, uint16_t keycode, uint8_t layer);
bool map_shift(keyrecord_t *record, uint16_t shift_key, uint8_t shift, uint16_t keycode);
bool mod_down(uint16_t keycode);
void modifier(void (*f)(uint8_t));
void mt_shift(keyrecord_t *record, uint16_t modifier, uint16_t modifier2, uint16_t keycode);
void on_tap(uint8_t shift, uint16_t keycode);
void paste(qk_tap_dance_state_t *state, void *user_data);
void paste_reset(qk_tap_dance_state_t *state, void *user_data);
void percent(qk_tap_dance_state_t *state, void *user_data);
void percent_reset(qk_tap_dance_state_t *state, void *user_data);
void private(qk_tap_dance_state_t *state, void *user_data);
bool raise_layer(keyrecord_t *record, uint8_t layer, uint8_t side, uint8_t toggle);
void register_shift(uint16_t keycode);
void rolling_layer(keyrecord_t *record, uint8_t side, uint8_t shift, uint16_t keycode, uint8_t layer, uint8_t facing);
void send(qk_tap_dance_state_t *state, void *user_data);
void space(qk_tap_dance_state_t *state, void *user_data);
void space_reset(qk_tap_dance_state_t *state, void *user_data);
void steno(keyrecord_t *record);
void tap_key(uint16_t keycode);
void tap_layer(keyrecord_t *record, uint8_t layer);
void tap_mods(keyrecord_t *record, uint16_t keycode);
void tap_mod(uint16_t modifier, uint16_t keycode);
void tap_reset(uint16_t keycode, uint8_t layer);
void tap_shift(uint16_t keycode);
void tilde(qk_tap_dance_state_t *state, void *user_data);
void tilde_reset(qk_tap_dance_state_t *state, void *user_data);
void toggle_plover(uint8_t state);
void tt_escape(keyrecord_t *record, uint16_t keycode);
void unregister_shift(uint16_t keycode);
void xpaste(qk_tap_dance_state_t *state, void *user_data);
void xpaste_reset(qk_tap_dance_state_t *state, void *user_data);
