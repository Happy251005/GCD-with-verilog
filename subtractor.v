module subb(output reg [15:0] sub_out, input [15:0] A, B);
always @(*)
    sub_out <= A - B;
endmodule