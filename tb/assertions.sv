`timescale 1ns/1ns

import safe_pkg::*;

module safe_assertions
#(
    parameter CODE_LENGTH = 4,
    parameter WRONG_ATTEMPS_TO_BLOCK = 3,
    parameter TIMEOUT_VALUE = 1000,
    parameter LONG_PRESS_VALUE = 100
)
(
    input 
            logic       clk_i,
            logic       arst_n_i,

    /* Input interface */
            data_in     data_in_i,
            logic       data_in_valid_i,
            logic       data_in_ready_o,

    /* Mechanical unlock interface */
            logic       unlock_i,
            logic       unlock_valid_i,
            logic       unlock_ready_o,

    /* Output interface */
            data_out    data_out_o,
            logic       data_out_valid_o,
            logic       data_out_ready_i,

    /* Internal registers */

            safe_state state,
            logic code_is_set,
            logic [$clog2(WRONG_ATTEMPS_TO_BLOCK-1):0] wrong_attemps,

            logic [CODE_LENGTH-1:0][3:0] current_input, current_pass, new_pass,
            logic [$clog2(CODE_LENGTH):0] current_input_cnt,

            logic [$clog2(LONG_PRESS_VALUE):0] clear_long_press_cnt,
            logic [$clog2(TIMEOUT_VALUE):0] timeout_cnt
);

endmodule