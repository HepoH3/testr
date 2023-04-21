`timescale 1ns/1ns

import safe_pkg::*;

module safe
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
    input
            data_in     data_in_i,
            logic       data_in_valid_i,
    output  logic       data_in_ready_o,

    /* Mechanical unlock interface */
    input
            logic       unlock_i,
            logic       unlock_valid_i,
    output  logic       unlock_ready_o,

    /* Output interface */
    output
            data_out    data_out_o,
            logic       data_out_valid_o,
    input   logic       data_out_ready_i    // must be asserted 1

);

typedef logic [CODE_LENGTH-1:0][3:0] code_reg;

logic code_is_set;
logic [$clog2(WRONG_ATTEMPS_TO_BLOCK-1):0] wrong_attemps;

code_reg current_input, current_pass, new_pass;
logic [$clog2(CODE_LENGTH):0] current_input_cnt;

logic [$clog2(LONG_PRESS_VALUE):0] clear_long_press_cnt;
logic [$clog2(TIMEOUT_VALUE):0] timeout_cnt;

safe_state state;

/* Internal combinational logic */

// Stream handshakes

logic data_in_handshake;
logic unlock_handshake;
logic data_out_handshake;

assign data_in_handshake    = data_in_valid_i & data_in_ready_o;
assign unlock_handshake     = unlock_valid_i & unlock_ready_o;
assign data_out_handshake   = data_out_valid_o & data_out_ready_i;

// Input type

logic is_digit_input;
logic is_submit;
logic is_clear;
logic is_sealed;
logic is_unlocked;

assign is_digit_input       = data_in_handshake & (data_in_i <= KEY_9);
assign is_submit            = data_in_handshake & (data_in_i == KEY_OK);
assign is_clear             = data_in_handshake & (data_in_i == KEY_CLEAR);
assign is_sealed            = data_in_handshake & (data_in_i == DOOR_SEALED);
assign is_unlocked          = unlock_handshake & unlock_i;

// Code input management

logic digit_input_allowed;
logic code_input_allowed;
logic clear_current_input;

logic code_match;
logic code_confirm;
logic about_to_block;
logic wrong_code_attempted;

logic new_code_set;
logic new_code_confirmed;

assign digit_input_allowed  = (state == LOCKED) | (state == CODE_CHECK) | (state == CODE_SET);
assign code_input_allowed   = is_digit_input & (current_input_cnt < CODE_LENGTH);
assign clear_current_input  = is_clear | is_submit;

assign code_match           = current_input == current_pass;
assign code_confirm         = current_input == new_pass;
assign about_to_block       = wrong_attemps == WRONG_ATTEMPS_TO_BLOCK - 1;
assign wrong_code_attempted = (is_submit) & code_is_set & ~code_match & (wrong_attemps < WRONG_ATTEMPS_TO_BLOCK);

assign new_code_set         = is_submit & (state == CODE_SET);
assign new_code_confirmed   = is_submit & code_confirm & (state == CODE_CHECK);

// Time-driven cases

logic timeout;
logic timeout_active;
logic clear_held;
logic clear_long_press;

assign timeout              = timeout_cnt == TIMEOUT_VALUE;
assign timeout_active       = state == CODE_CHECK || state == CODE_SET;
assign clear_held           = is_clear & (state == OPEN);
assign clear_long_press     = clear_long_press_cnt == LONG_PRESS_VALUE;

/* Internal synchronous logic */

always_ff @(posedge clk_i or negedge arst_n_i) begin
    if(~arst_n_i) begin
        state <= BLOCKED;
    end
    else begin
        case(state)
            LOCKED:
                if(is_digit_input) begin
                    state <= CODE_CHECK;
                end
            CODE_CHECK:
                if(timeout) begin
                    if(code_is_set) begin
                        state <= LOCKED;
                    end else begin
                        state <= OPEN;
                    end
                end 
                else begin
                    if(is_submit) begin
                        if(code_is_set) begin
                            if(code_match)
                                state <= OPEN;
                            else if(about_to_block) begin
                                state <= BLOCKED;
                            end
                        end
                        else begin
                            state <= OPEN;
                        end
                    end
                end
            OPEN:
                if(is_sealed & code_is_set) begin
                    state <= LOCKED;
                end
                else if(clear_long_press) begin
                    state <= CODE_SET;
                end
            CODE_SET:
                if(is_sealed & code_is_set) begin
                    state <= LOCKED;
                end
                else if(timeout) begin
                    state <= OPEN;
                end
                else if(is_submit) begin
                    state <= CODE_CHECK;
                end
            BLOCKED:
                if(is_unlocked) begin
                    state <= OPEN;
                end
            default:
                state <= BLOCKED;
        endcase
    end
end

/* Timeout logic */

always_ff @(posedge clk_i or negedge arst_n_i) begin
    if(~arst_n_i)
        timeout_cnt <= 0;
    else begin
        if(timeout_active) begin
            if(timeout | data_in_valid_i)
                timeout_cnt <= 0;
            else timeout_cnt <= timeout_cnt + 1'b1;
        end
        else timeout_cnt <= 0;
    end
end

/* Long press logic */

always_ff @(posedge clk_i or negedge arst_n_i) begin
    if(~arst_n_i) begin
        clear_long_press_cnt <= 0;
    end
    else begin
        if(clear_held) begin
            if(clear_long_press)
                clear_long_press_cnt <= 0;
            else clear_long_press_cnt <= clear_long_press_cnt + 1'b1;
        end
        else clear_long_press_cnt <= 0;
    end
end

/* Input logic */

always_ff @(posedge clk_i or negedge arst_n_i) begin
    if(~arst_n_i) begin
        current_input_cnt <= 0;
        current_input <= 0;
    end
    else begin
        if(digit_input_allowed) begin
            if(clear_current_input | timeout) begin
                current_input_cnt <= 0;
                current_input <= '0;
            end
            else if(code_input_allowed) begin
                current_input[current_input_cnt] <= data_in_i;
                current_input_cnt <= current_input_cnt + 1'b1;
            end
        end
    end
end

/* Code management */

always_ff @(posedge clk_i or negedge arst_n_i) begin
    if(~arst_n_i) begin
        current_pass <= 0;
        new_pass <= 0;
        code_is_set <= 0;
    end
    else begin
        if(state == BLOCKED) begin
            code_is_set <= 0;
        end
        else begin
            if(new_code_set) begin
                new_pass <= current_input;
                code_is_set <= 1'b0;
            end
            else if(new_code_confirmed) begin
                current_pass <= new_pass;
                code_is_set <= 1'b1;
            end
        end
    end
end

/* Wrong attempts control */

always_ff @(posedge clk_i or negedge arst_n_i) begin
    if(~arst_n_i) begin
        wrong_attemps <= 0;
    end
    else begin
        if(state == CODE_CHECK) begin
            if(wrong_code_attempted)
                wrong_attemps <= wrong_attemps + 1'b1;
        end
        else wrong_attemps <= 0;
    end
end

/* Interfaces logic */

assign data_in_ready_o = arst_n_i;
assign unlock_ready_o = arst_n_i & (state == BLOCKED);

always_comb begin
    data_out_o = PASS_OK;
    data_out_valid_o = 0;

    if(~arst_n_i) begin
        data_out_o = BLOCK;
        data_out_valid_o = 1'b1;
    end
    else begin
        case(state)
            CODE_CHECK:
                if(timeout) begin
                    data_out_o = TIMEOUT;
                    data_out_valid_o = 1'b1;
                end 
                else begin
                    if(is_submit) begin
                        if(code_is_set) begin
                            if(code_match) begin
                                data_out_o = PASS_OK;
                                data_out_valid_o = 1'b1;
                            end
                            else if(about_to_block) begin
                                data_out_o = BLOCK;
                                data_out_valid_o = 1'b1;
                            end
                            else begin
                                data_out_o = PASS_FAIL;
                                data_out_valid_o = 1'b1;
                            end
                        end
                        else if(code_confirm) begin
                            data_out_o = PASS_OK;
                            data_out_valid_o = 1'b1;
                        end
                        else begin
                            data_out_o = PASS_FAIL;
                            data_out_valid_o = 1'b1;
                        end         
                    end
                end
            OPEN:
                if(is_sealed & code_is_set) begin
                    data_out_o = DOOR_LOCK;
                    data_out_valid_o = 1'b1;
                end
                else if(clear_long_press) begin
                    data_out_o = CODE_SET_MODE;
                    data_out_valid_o = 1'b1;
                end
            CODE_SET:
                if(is_sealed & code_is_set) begin
                    data_out_o = DOOR_LOCK;
                    data_out_valid_o = 1'b1;
                end
                else if(timeout) begin
                    data_out_o = TIMEOUT;
                    data_out_valid_o = 1'b1;
                end
        endcase
    end
end

endmodule