module comp(output eq, lt, gt, input [15:0] A, B);
assign eq = (A == B);
assign lt = (A < B);
assign gt = (A > B);
endmodule
