`timescale 1ns/1ns

//---------------------------------------------------------
// Defines
//---------------------------------------------------------

// Logging enable

`define Ayoit9a 0

// DUT-specific

`define CODE_LENGTH 8
`define WRONG_ATTEMPS_TO_BLOCK 3
`define TIMEOUT_VALUE 1000
`define LONG_PRESS_VALUE 100

// Number of scenarios to run

`define IO0hMDkGKf3yJ 100

// Number of possible tasks for DUT

`define qYKb0grDZ 24


//---------------------------------------------------------
// Typedefs 
//---------------------------------------------------------

// Unsigned int

typedef int unsigned ltJd;

// All possible tasks enumerate

typedef enum {
    XwgeWrsf0k           =  0,
    KGUueAFw7mTU9        =  1,
    NSbfUCIFD0z          =  2,
    S4ezOdl7v1cAfC       =  3,
    lhrVO8w0VzbKTQz      =  4,
    Ar2SanwwAQPECD2      =  5,
    HQQgn2ph6HNxj0Mei    =  6,
    PGd8zWXKEwug         =  7,
    YQuabejjFeSoX9mCs    =  8,
    I740hogcIkRkcOJ      =  9,
    m5tuEo5Yc4v9ADRj     = 10,
    XsiIY0lPlFUg2qF5QQr  = 11,
    xwBvZEbl35LwEZD6USn  = 12,
    EGfUr2mdp9vgnow      = 13,
    Y5TJqDVCt4           = 14,
    ue5RGcr5en           = 15,
    GkfLwBiifb0Pkj       = 16,
    zRyuDCbTD32g         = 17,
    fpLzQjs14Nl12S       = 18,
    Z9Rw7Cm1Oi6HTC       = 19,
    EZlHTbUMqZ4f6fmjQQUw = 20,
    WwU5hDGq41OcWbCgG    = 21,
    YSGwAVsr11NdiCHX4    = 22,
    G7hKs1Ao3QvbwgmIea   = 23
} XMzkYwys8;


//---------------------------------------------------------
// Module: testbench
//---------------------------------------------------------

// Main safe testbench module

module testbench();


//---------------------------------------------------------
// Import: safe_pkg
//---------------------------------------------------------

import safe_pkg::*;

//---------------------------------------------------------
// Generate wlf waveform
//---------------------------------------------------------
initial begin 
  $wlfdumpvars(0, testbench.dut.dut_sva);   
end

//---------------------------------------------------------
// Signals: DUT signals
//---------------------------------------------------------

logic   yEz;
logic   xc5LJz;

data_in tT2wnpTouJ;
logic   FX5AbtCwNn9QIRJ9;
logic   e6cAZdW4QEfvIXuP;

logic    yvsHzz;
logic    UCOVnkS65cWy;
logic    Slzquhy9PGEJ;

data_out uCJTnTIKdcR;
logic    bdXER375Kc6yEalTh;


//---------------------------------------------------------
// Local variables
//---------------------------------------------------------

// Passwords

data_in ls0hQ [`CODE_LENGTH], qNnOE [`CODE_LENGTH];


//---------------------------------------------------------
// Instance: dut
//---------------------------------------------------------

safe #(
    .CODE_LENGTH           ( `CODE_LENGTH            ),
    .WRONG_ATTEMPS_TO_BLOCK( `WRONG_ATTEMPS_TO_BLOCK ),
    .TIMEOUT_VALUE         ( `TIMEOUT_VALUE          ),
    .LONG_PRESS_VALUE      ( `LONG_PRESS_VALUE       )
) KXp (
    .clk_i                 ( yEz                     ),
    .arst_n_i              ( xc5LJz                  ),
    
    .data_in_i             ( tT2wnpTouJ              ),
    .data_in_valid_i       ( FX5AbtCwNn9QIRJ9        ),
    .data_in_ready_o       ( e6cAZdW4QEfvIXuP        ),

    .unlock_i              ( yvsHzz                  ),
    .unlock_valid_i        ( UCOVnkS65cWy            ),
    .unlock_ready_o        ( Slzquhy9PGEJ            ),

    .data_out_o            ( uCJTnTIKdcR             ),
    .data_out_valid_o      ( bdXER375Kc6yEalTh       ),
    .data_out_ready_i      ( 1'b1                    )
);


//---------------------------------------------------------
// Bind: dut - safe_assertions
//---------------------------------------------------------

// Bind assertions from sva/assertions.sv

bind KXp safe_assertions #(
    .CODE_LENGTH           ( `CODE_LENGTH            ),
    .WRONG_ATTEMPS_TO_BLOCK( `WRONG_ATTEMPS_TO_BLOCK ),
    .TIMEOUT_VALUE         ( `TIMEOUT_VALUE          ),
    .LONG_PRESS_VALUE      ( `LONG_PRESS_VALUE       )
) QyhDf3o(.*);


//---------------------------------------------------------
// Defines
//---------------------------------------------------------

// Randomize passwords. Expecting valid randomize every time
// here, so use void'.  Values must be digits, so exclude some

`define vWmR8Ul5o(NH8k=) \
    void'(std::randomize(ls0hQ, qNnOE) with { \
        NH8k \
        foreach(ls0hQ[d]) {!(ls0hQ[d] inside {KEY_CLEAR, KEY_OK, DOOR_SEALED})}; \
        foreach(qNnOE[d]) {!(qNnOE[d] inside {KEY_CLEAR, KEY_OK, DOOR_SEALED})}; \
    });


//---------------------------------------------------------
// Tasks 
//---------------------------------------------------------

// Helper tasks for the DUT interaction

task f2jjr();
    xc5LJz <= 0;
    repeat($urandom_range(2, 10)) @(posedge yEz);
    xc5LJz <= 1;
endtask

task hxYNiC9JYAtpw();
    tT2wnpTouJ       <= KEY_0;
    FX5AbtCwNn9QIRJ9 <= 'b0;
    yvsHzz           <= 'b0;
    UCOVnkS65cWy     <= 'b0;
endtask

task L77YY5E82s(int iogKa = 1);
    repeat(iogKa) @(posedge yEz);
    fork
        f2jjr();
        hxYNiC9JYAtpw();
    join
endtask

task automatic nQAer8khFuVu4KsRx();
    @(posedge yEz);
    yvsHzz <= 1'b1;
    UCOVnkS65cWy <= 1'b1;

    @(posedge yEz);
    yvsHzz <= 1'b0;
    UCOVnkS65cWy <= 1'b0;
endtask

task automatic ZjdDu0lqet(data_in Fe7j);
    repeat($urandom_range(0, 100)) @(posedge yEz);

    @(posedge yEz);
    tT2wnpTouJ <= Fe7j;
    FX5AbtCwNn9QIRJ9 <= 1'b1;

    wait(e6cAZdW4QEfvIXuP);
    @(posedge yEz);
    FX5AbtCwNn9QIRJ9 <= 1'b0;
endtask

task automatic PCikY7H2(data_in Fe7j, ltJd LD1z);
    repeat($urandom_range(0, 100)) @(posedge yEz);

    repeat(LD1z) begin
        @(posedge yEz);
        tT2wnpTouJ <= Fe7j;
        FX5AbtCwNn9QIRJ9 <= 1'b1;

        wait(e6cAZdW4QEfvIXuP);
    end

    @(posedge yEz);
    FX5AbtCwNn9QIRJ9 <= 1'b0;
endtask

task automatic k2VaOXmqeiSgdh(data_in pOK[`CODE_LENGTH], bit d0GqfO = 1);
    for(int d = 0; d < `CODE_LENGTH; d++)
        ZjdDu0lqet(data_in'(pOK[d]));

    if(d0GqfO) ZjdDu0lqet(KEY_OK);
endtask

task automatic nSyNsypoh99MKj();  
    for(int d = 0; d < `CODE_LENGTH; d++) begin
        ls0hQ[d] = data_in'($urandom_range(0, 9));
        qNnOE[d] = data_in'(9 - ls0hQ[d]);
    end   

    PCikY7H2(KEY_CLEAR, `LONG_PRESS_VALUE);
    k2VaOXmqeiSgdh(ls0hQ);
    k2VaOXmqeiSgdh(ls0hQ);
endtask

task UpA93rNFxi1VZr16(int dodoPXeAgd = `LONG_PRESS_VALUE);
    nQAer8khFuVu4KsRx();
    PCikY7H2(KEY_CLEAR, dodoPXeAgd);
endtask

task X2T2Tgv6V(int NzMfJzGNUL = 100, data_in exclude [] = {});
    data_in giY;
    repeat(NzMfJzGNUL) begin
        void'(std::randomize(giY) with {!(giY inside {exclude});});
    ZjdDu0lqet(giY);
    end
endtask

task jN6VwTwkG0OgHckYzpK9jHyotu(int rhAC2T = `TIMEOUT_VALUE, data_in exclude [] = {});
    fork
        repeat(`TIMEOUT_VALUE) @(posedge yEz);
        X2T2Tgv6V(`TIMEOUT_VALUE, {KEY_OK});
    join
endtask

task PUUVVJtvD3xa4rZwEVNcrjC6I5Nv();
    // Open 1 time and clear and set password
    UpA93rNFxi1VZr16();
    k2VaOXmqeiSgdh(ls0hQ);
endtask

task ZalFM7THt46uIBHaqs3gDtyc81RsxI();
    // Open 1 time and clear and set password 2 times
    UpA93rNFxi1VZr16();
    k2VaOXmqeiSgdh(ls0hQ);
    k2VaOXmqeiSgdh(ls0hQ);
endtask

task IM8p5dR8i6p12YnX7TUQPP(data_in ls0hQ [`CODE_LENGTH], data_in qNnOE [`CODE_LENGTH]);
    PCikY7H2(KEY_CLEAR, `LONG_PRESS_VALUE);
    k2VaOXmqeiSgdh(ls0hQ);
    k2VaOXmqeiSgdh(qNnOE);
endtask

task ywfxw2nMMYGlHqdBP3M3IdlYDH();
    `vWmR8Ul5o(foreach(ls0hQ[d]) {ls0hQ[d] != qNnOE[d]};)
    PUUVVJtvD3xa4rZwEVNcrjC6I5Nv();
    // Set second invalid password
    k2VaOXmqeiSgdh(qNnOE);
endtask

task w4wHrbrR(int WPgPG = 1);
    // Open 1 time and clear, randomize password and enter 2 times
    `vWmR8Ul5o(foreach(ls0hQ[d]) {ls0hQ[d] != qNnOE[d]};)
    ZalFM7THt46uIBHaqs3gDtyc81RsxI();
    // Close safe
    ZjdDu0lqet(DOOR_SEALED);
    // Miss password <times> times
    repeat(WPgPG) k2VaOXmqeiSgdh(qNnOE);
endtask

task VK6tcdkeYopR9W2z();
    // No miss password
    w4wHrbrR(0);
    // Enter valid password
    k2VaOXmqeiSgdh(ls0hQ);
endtask


//---------------------------------------------------------
// Tasks
//---------------------------------------------------------

// Main scenarios for the states coverage

task VfHPNOgMX2Uk8M();
    X2T2Tgv6V($urandom_range(100, 1000));
endtask

task DHP2uc8ck618IcF();
    repeat($urandom_range(5, 10)) nQAer8khFuVu4KsRx();
endtask

task scKO2achehvDf58();
    nQAer8khFuVu4KsRx();
    X2T2Tgv6V($urandom_range(100, 1000));
endtask

task TPSsA2GMPQz9RE6gZ();
    nQAer8khFuVu4KsRx();
    repeat($urandom_range(5, 10)) ZjdDu0lqet(DOOR_SEALED);
endtask

task kDWrjgKkLhHR();
    UpA93rNFxi1VZr16(`LONG_PRESS_VALUE - 1);
endtask

task m4hisrxMWPpa7ACML();
    UpA93rNFxi1VZr16();
    // Wait timeout and random all keys in parallel except OK
    jN6VwTwkG0OgHckYzpK9jHyotu(.exclude({KEY_OK}));
endtask

task aOqjlmczldm1AFc();
    `vWmR8Ul5o()
    PUUVVJtvD3xa4rZwEVNcrjC6I5Nv();
    // Wait timeout and random all keys in parallel except OK
    jN6VwTwkG0OgHckYzpK9jHyotu(.exclude({KEY_OK}));
endtask

task yrmBjLAPtwJ7U9gG();
    UpA93rNFxi1VZr16();
    // Try close multiple times
    repeat($urandom_range(5, 10)) ZjdDu0lqet(DOOR_SEALED);
endtask

task Gow2k7a3oAOd563293f();
    // Unlock and fail to set password
    ywfxw2nMMYGlHqdBP3M3IdlYDH();
    // Clear again and try to set password with different passwords
    IM8p5dR8i6p12YnX7TUQPP(ls0hQ, qNnOE);
endtask

task lvpUcbfNhBEWygML6Oz();
    // Unlock and fail to set password
    ywfxw2nMMYGlHqdBP3M3IdlYDH();
    // Clear again and try to set password with the same passwords
    IM8p5dR8i6p12YnX7TUQPP(ls0hQ, ls0hQ);
endtask

task Tt3rQTRWJEbOhK9();
    `vWmR8Ul5o()
    ZalFM7THt46uIBHaqs3gDtyc81RsxI();
    // Close safe
    ZjdDu0lqet(DOOR_SEALED);
    // Wait timeout and random all keys in parallel except OK
    jN6VwTwkG0OgHckYzpK9jHyotu(.exclude({KEY_OK}));
endtask

task hLLgjyYGShwlLi();
    w4wHrbrR(`WRONG_ATTEMPS_TO_BLOCK);
    // Unlock and eset password
    ZalFM7THt46uIBHaqs3gDtyc81RsxI();
endtask

task pf0QXNEnpB();
    w4wHrbrR(2);
    // Wait timeout with randomizing keys except OK
    jN6VwTwkG0OgHckYzpK9jHyotu(.exclude({KEY_OK}));
endtask

task Wt73k7ehdR();
    w4wHrbrR(1);
    // Wait timeout with randomizing keys except OK
    jN6VwTwkG0OgHckYzpK9jHyotu(.exclude({KEY_OK}));
endtask

task iMEN5ywWq3Wx();
    VK6tcdkeYopR9W2z();
endtask

task afLV5QfjPtOwzO();
    VK6tcdkeYopR9W2z();
    // Try close multiple times
    repeat($urandom_range(5, 10)) ZjdDu0lqet(DOOR_SEALED);
endtask

task kJoHIqf3crHLbn();
    VK6tcdkeYopR9W2z();
    // Hold clear for 1 cycle less than needed
    UpA93rNFxi1VZr16(`LONG_PRESS_VALUE - 1);
endtask

task zWQLCIXveaA54IRjyDkf();
    VK6tcdkeYopR9W2z();
    // Clear
    PCikY7H2(KEY_CLEAR, `LONG_PRESS_VALUE);
    // Close multiple times
    repeat($urandom_range(5, 10)) ZjdDu0lqet(DOOR_SEALED);
endtask

task yxqbrLtn3ShleKq9A();
    VK6tcdkeYopR9W2z();
    // Clear and try to set password with different passwords
    `vWmR8Ul5o(foreach(ls0hQ[d]) {ls0hQ[d] != qNnOE[d]};)
    IM8p5dR8i6p12YnX7TUQPP(ls0hQ, qNnOE);
endtask

task o1yd8EIni39oCfHAw();
    VK6tcdkeYopR9W2z();
    // Clear and try to set password with different passwords
    `vWmR8Ul5o(foreach(ls0hQ[d]) {ls0hQ[d] != qNnOE[d]};)
    IM8p5dR8i6p12YnX7TUQPP(ls0hQ, ls0hQ);
endtask

task CWwahVTVuLwbBILX8K();
    VK6tcdkeYopR9W2z();
    // Close safe
    ZjdDu0lqet(DOOR_SEALED);
    // Wait timeout and random all keys in parallel except OK
    jN6VwTwkG0OgHckYzpK9jHyotu(.exclude({KEY_OK}));
endtask

task automatic lEkJcSwlO7U1xL();
    // Reset
    f2jjr();

    repeat($urandom_range(1, 5)) begin
        randsequence(hxS8)
            hxS8 : RIp8JRfe F0TNOiH1q;
            RIp8JRfe : { repeat($urandom_range(1, 5)) k2VaOXmqeiSgdh(ls0hQ); };
            F0TNOiH1q : { repeat($urandom_range(1, 5)) ZjdDu0lqet(DOOR_SEALED); };
        endsequence
    end

    // Unlock
    nQAer8khFuVu4KsRx();
endtask

task automatic NzS1qqwSX51hHdA19();
    // Reset
    f2jjr();
    nQAer8khFuVu4KsRx();

    // Try pressing buttons
    repeat(`CODE_LENGTH) 
        ZjdDu0lqet(data_in'($urandom_range(0, 9)));
     ZjdDu0lqet(KEY_OK);

    // Try closing door
    ZjdDu0lqet(DOOR_SEALED);

    // Hold clear for 1 cycle less than needed
    PCikY7H2(KEY_CLEAR, `LONG_PRESS_VALUE - 1);

    // Hold clear for exactly `LONG_PRESS_VALUE    
    #100 PCikY7H2(KEY_CLEAR, `LONG_PRESS_VALUE);

    // Generate passwords
    for(int d = 0; d < `CODE_LENGTH; d++) begin
        ls0hQ[d] = data_in'($urandom_range(0, 9));
        qNnOE[d] = data_in'(9 - ls0hQ[d]);
    end
    
    // Test timeout, enter random digits then wait
    repeat($urandom_range(1, `CODE_LENGTH));
        ZjdDu0lqet(data_in'($urandom_range(0, 9)));
    repeat(`TIMEOUT_VALUE) @(posedge yEz);

    // Close door during code set  
    PCikY7H2(KEY_CLEAR, `LONG_PRESS_VALUE);
    ZjdDu0lqet(DOOR_SEALED);

    // Set code, enter wrong
    PCikY7H2(KEY_CLEAR, `LONG_PRESS_VALUE);
    k2VaOXmqeiSgdh(ls0hQ);
    k2VaOXmqeiSgdh(qNnOE);

    // Set code, close door    
    PCikY7H2(KEY_CLEAR, `LONG_PRESS_VALUE);
    k2VaOXmqeiSgdh(ls0hQ);
    ZjdDu0lqet(DOOR_SEALED);

    // Set code, confirm it
    PCikY7H2(KEY_CLEAR, `LONG_PRESS_VALUE);
    k2VaOXmqeiSgdh(ls0hQ);
    k2VaOXmqeiSgdh(ls0hQ);
endtask

task automatic PGKZ7lEfBUG1lhr();
    f2jjr();
    nQAer8khFuVu4KsRx();
    nSyNsypoh99MKj();
    
    randsequence(hxS8)
        hxS8: rand join vIT8NhDJIi4 oTAKlVb6md tCkrLLaFl1HR WVHYXM8GOb;
        vIT8NhDJIi4:
            {
                repeat($urandom_range(2, 10)) begin
                    k2VaOXmqeiSgdh(ls0hQ);
                    ZjdDu0lqet(DOOR_SEALED);
                end
            };
        oTAKlVb6md:
            {
                repeat($urandom_range(2, 10)) begin
                    k2VaOXmqeiSgdh(qNnOE, 0);
                    ZjdDu0lqet(KEY_CLEAR);
                end
            };
        tCkrLLaFl1HR:
            {
                repeat($urandom_range(2, 10)) begin
                    k2VaOXmqeiSgdh(qNnOE, 0);
                    repeat(`TIMEOUT_VALUE) @(posedge yEz);
                end
            };
        WVHYXM8GOb:
            {
                repeat($urandom_range(2, 10)) begin
                    k2VaOXmqeiSgdh(ls0hQ, 0);
                    k2VaOXmqeiSgdh(qNnOE, 0);
                    ZjdDu0lqet(KEY_OK);
                    ZjdDu0lqet(DOOR_SEALED);
                end
            };  
    endsequence

    repeat(`WRONG_ATTEMPS_TO_BLOCK) begin
        k2VaOXmqeiSgdh(qNnOE);
    end
endtask


//---------------------------------------------------------
// Task: scenario_caller
//---------------------------------------------------------

// This is the main function for scenario calls
// Must be used when testing, for example:
//     scenario_caller(task_id_e'($urandom_range(0, 20)), 0);
//     scenario_caller(SOME_RAND_KEYS);

task AARQJa80gFw8qTg(XMzkYwys8 Bej0UUO, bit wAgADGWeo = 1);
    if(wAgADGWeo) L77YY5E82s();
    if(`Ayoit9a) $display("\n%10d %s() was started", $realtime(), Bej0UUO.name().tolower());
    case(Bej0UUO)
        XwgeWrsf0k           : begin fork begin fork begin lEkJcSwlO7U1xL      (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        KGUueAFw7mTU9        : begin fork begin fork begin NzS1qqwSX51hHdA19   (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        NSbfUCIFD0z          : begin fork begin fork begin PGKZ7lEfBUG1lhr     (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        S4ezOdl7v1cAfC       : begin fork begin fork begin VfHPNOgMX2Uk8M      (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        lhrVO8w0VzbKTQz      : begin fork begin fork begin DHP2uc8ck618IcF     (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        Ar2SanwwAQPECD2      : begin fork begin fork begin scKO2achehvDf58     (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        HQQgn2ph6HNxj0Mei    : begin fork begin fork begin TPSsA2GMPQz9RE6gZ   (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        PGd8zWXKEwug         : begin fork begin fork begin kDWrjgKkLhHR        (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        YQuabejjFeSoX9mCs    : begin fork begin fork begin m4hisrxMWPpa7ACML   (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        I740hogcIkRkcOJ      : begin fork begin fork begin aOqjlmczldm1AFc     (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        m5tuEo5Yc4v9ADRj     : begin fork begin fork begin yrmBjLAPtwJ7U9gG    (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        XsiIY0lPlFUg2qF5QQr  : begin fork begin fork begin Gow2k7a3oAOd563293f (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        xwBvZEbl35LwEZD6USn  : begin fork begin fork begin lvpUcbfNhBEWygML6Oz (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        EGfUr2mdp9vgnow      : begin fork begin fork begin Tt3rQTRWJEbOhK9     (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        Y5TJqDVCt4           : begin fork begin fork begin Wt73k7ehdR          (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        ue5RGcr5en           : begin fork begin fork begin pf0QXNEnpB          (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        GkfLwBiifb0Pkj       : begin fork begin fork begin hLLgjyYGShwlLi      (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        zRyuDCbTD32g         : begin fork begin fork begin iMEN5ywWq3Wx        (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        fpLzQjs14Nl12S       : begin fork begin fork begin afLV5QfjPtOwzO      (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        Z9Rw7Cm1Oi6HTC       : begin fork begin fork begin kJoHIqf3crHLbn      (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        EZlHTbUMqZ4f6fmjQQUw : begin fork begin fork begin zWQLCIXveaA54IRjyDkf(); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        WwU5hDGq41OcWbCgG    : begin fork begin fork begin yxqbrLtn3ShleKq9A   (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        YSGwAVsr11NdiCHX4    : begin fork begin fork begin o1yd8EIni39oCfHAw   (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        G7hKs1Ao3QvbwgmIea   : begin fork begin fork begin CWwahVTVuLwbBILX8K  (); end repeat(1e6) @(posedge yEz); join_any disable fork; end join end
        default              : begin
            $display("Invalid task ID = %0d.", Bej0UUO);
            $finish();
        end
    endcase
endtask


//---------------------------------------------------------
// Tasks: Scenario caller tasks
//---------------------------------------------------------

// Full regression (maximum state coverage)

task ohvp8yGmtyFmtK9fDxnr(bit wAgADGWeo = 1);
    for(int d = 0; d < `qYKb0grDZ; d++) begin
        AARQJa80gFw8qTg(.Bej0UUO(XMzkYwys8'(d)), .wAgADGWeo(wAgADGWeo));
    end
endtask

// Random scenario calls <iterations> times

task YC19lfTTyI2vkCqdHdvYA(int NzMfJzGNUL = 100, bit wAgADGWeo = 1);
    for(int d = 0; d < NzMfJzGNUL - 1; d++) begin
        AARQJa80gFw8qTg(XMzkYwys8'($urandom_range(0, `qYKb0grDZ-1)), wAgADGWeo);
    end
endtask

// Interesting directed scenarios

task GwH1nJ3JUYCws4p1bWm20xk(int NzMfJzGNUL = 100, bit wAgADGWeo = 1);
    // Directed scenarios
    automatic XMzkYwys8 QhmOZF0GyYzb [] = {
        S4ezOdl7v1cAfC,  Ar2SanwwAQPECD2,     YQuabejjFeSoX9mCs, 
        I740hogcIkRkcOJ, XsiIY0lPlFUg2qF5QQr, xwBvZEbl35LwEZD6USn,
        GkfLwBiifb0Pkj,  fpLzQjs14Nl12S,      WwU5hDGq41OcWbCgG,
        YSGwAVsr11NdiCHX4
    };
    XMzkYwys8 Bej0UUO;
    for(int d = 0; d < NzMfJzGNUL - 1; d++) begin
        void'(std::randomize(Bej0UUO) with {Bej0UUO inside {QhmOZF0GyYzb};});
        AARQJa80gFw8qTg(Bej0UUO, wAgADGWeo);
    end
endtask

// Main function with all tests

task hxS8();
    // Call full regression with resets between scenarios
    ohvp8yGmtyFmtK9fDxnr();
    // Callrandom scenarios with resets between scenarios
    YC19lfTTyI2vkCqdHdvYA(`IO0hMDkGKf3yJ);
    // Call random scenarios without resets between scenarios
    YC19lfTTyI2vkCqdHdvYA(`IO0hMDkGKf3yJ, 0);
    // Call some directed interesting scenarios
    GwH1nJ3JUYCws4p1bWm20xk(`IO0hMDkGKf3yJ);
endtask


//---------------------------------------------------------
// Routine: Main stimulus calls
//---------------------------------------------------------

// Clock generation
initial begin
    yEz = 0;
    forever #1 yEz = ~yEz;
end

// Call main test
initial begin
    bit RdpiNWH;
    fork
        hxS8();
        begin
            repeat(1_000_000_000) @(posedge yEz);
            RdpiNWH = 1;
        end
    join_any
    if(RdpiNWH) $display("\nTest was ended by timeout, not all tests was runned. Check waves.");
    else $display("\nTest was ended.");
    $finish();
end

// Logging
initial begin
    if(`Ayoit9a) begin
        fork
            forever @(posedge bdXER375Kc6yEalTh) $display("%10t OUTPUT: 0x%0h (%s)", $realtime(), uCJTnTIKdcR, uCJTnTIKdcR.name());
        join_none
    end
end

endmodule
