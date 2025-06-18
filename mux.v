module mux(output [15:0] data_out, input sel, input [15:0] data_in1, data_in2);
assign data_out = sel ? data_in2 : data_in1;
endmodule