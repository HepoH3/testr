package safe_pkg;
typedef enum logic [2:0] {
    LOCKED          = 3'd0,
    CODE_CHECK      = 3'd1,
    OPEN            = 3'd2,
    CODE_SET        = 3'd3,
    BLOCKED         = 3'd4
} safe_state;

typedef enum logic [3:0] {
    KEY_0           = 4'h0,
    KEY_1           = 4'h1,
    KEY_2           = 4'h2,
    KEY_3           = 4'h3,
    KEY_4           = 4'h4,
    KEY_5           = 4'h5,
    KEY_6           = 4'h6,
    KEY_7           = 4'h7,
    KEY_8           = 4'h8,
    KEY_9           = 4'h9,
    KEY_CLEAR       = 4'hA,
    KEY_OK          = 4'hB,
    DOOR_SEALED     = 4'hC
} data_in;

typedef enum logic[2:0] {
    PASS_OK         = 3'h0,
    PASS_FAIL       = 3'h1,
    DOOR_LOCK       = 3'h2,
    BLOCK           = 3'h3,
    TIMEOUT         = 3'h4,
    CODE_SET_MODE   = 3'h5
} data_out;

endpackage