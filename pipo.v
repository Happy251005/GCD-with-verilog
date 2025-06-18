module pipo(output reg [15:0] data_out, input [15:0] data_in, input ld, clk);
always @(posedge clk)
    if (ld)
        data_out <= data_in;
endmodule