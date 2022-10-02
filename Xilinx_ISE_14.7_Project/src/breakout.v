module breakout(

    input clk12, //clk50 was
    input rota,
    input rotb,
    input de,
    output  red,
    output  green,
    output blue,
    output hsync,
    output vsync
    );
	 
wire clk50;	 
wire clkInBuf, clkOut;
reg clk25;

// Instantiate the module PLL-Clock
PLL_1 Clock12MHz (
    .CLKIN_IN(clk12), 
    .CLKFX_OUT(clk50), 
    .CLKIN_IBUFG_OUT(clkInBuf), 
    .CLK0_OUT(clkOut)
    );


always @(posedge clk50) begin
               clk25 <= ~clk25;
end

wire [9:0] xpos;
wire [9:0] ypos;


signal_generator signal_generator_inst(clk25, hsync, vsync, xpos, ypos);
game game_inst(clk25, xpos, ypos, ~rota, ~rotb, ~de, red, green, blue);                                                                  

endmodule