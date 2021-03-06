module top(
        input   PACKAGEPIN,
        output  [1:0] PLLOUTCORE,
        output  [1:0] PLLOUTGLOBAL,
        input   EXTFEEDBACK,
        input   [7:0] DYNAMICDELAY,
        output  LOCK,
        input   BYPASS,
        input   RESETB,
        input   LATCHINPUTVALUE,

        //Test Pins
        output  SDO,
        input   SDI,
        input   SCLK
);
        SB_PLL40_2F_PAD #(
                .FEEDBACK_PATH("DELAY"),
                // .FEEDBACK_PATH("SIMPLE"),
                // .FEEDBACK_PATH("PHASE_AND_DELAY"),
                // .FEEDBACK_PATH("EXTERNAL"),

                .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
                // .DELAY_ADJUSTMENT_MODE_FEEDBACK("DYNAMIC"),

                .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
                // .DELAY_ADJUSTMENT_MODE_RELATIVE("DYNAMIC"),

                .PLLOUT_SELECT_PORTA("GENCLK"),
                // .PLLOUT_SELECT_PORTA("GENCLK_HALF"),
                // .PLLOUT_SELECT_PORTA("SHIFTREG_90deg"),
                // .PLLOUT_SELECT_PORTA("SHIFTREG_0deg"),

                .PLLOUT_SELECT_PORTB("GENCLK"),
                // .PLLOUT_SELECT_PORTB("GENCLK_HALF"),
                // .PLLOUT_SELECT_PORTB("SHIFTREG_90deg"),
                // .PLLOUT_SELECT_PORTB("SHIFTREG_0deg"),

                .SHIFTREG_DIV_MODE(1'b0),
                .FDA_FEEDBACK(4'b1111),
                .FDA_RELATIVE(4'b1111),
                .DIVR(4'b0000),
                .DIVF(7'b0000000),
                .DIVQ(3'b001),
                .FILTER_RANGE(3'b000),
                .ENABLE_ICEGATE_PORTA(1'b0),
                .ENABLE_ICEGATE_PORTB(1'b0),
                .TEST_MODE(1'b0)
        ) uut (
                .PACKAGEPIN     (PACKAGEPIN     ),
                .PLLOUTCOREA    (PLLOUTCORE  [0]),
                .PLLOUTGLOBALA  (PLLOUTGLOBAL[0]),
                .PLLOUTCOREB    (PLLOUTCORE  [1]),
                .PLLOUTGLOBALB  (PLLOUTGLOBAL[1]),
                .EXTFEEDBACK    (EXTFEEDBACK    ),
                .DYNAMICDELAY   (DYNAMICDELAY   ),
                .LOCK           (LOCK           ),
                .BYPASS         (BYPASS         ),
                .RESETB         (RESETB         ),
                .LATCHINPUTVALUE(LATCHINPUTVALUE),
                .SDO            (SDO            ),
                .SDI            (SDI            ),
                .SCLK           (SCLK           )
        );
endmodule
