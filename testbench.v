module tb;
reg clk, start;
reg [15:0] data_in;
wire ldA, ldB, sel1, sel2, sel_in, done,eq,lt;
control c1(ldA, ldB, sel1, sel2, sel_in, done, clk, eq, lt, gt, start);
datapath d1(eq, lt, gt, ldA, ldB, sel1, sel2, sel_in, clk, data_in);
initial begin
    clk = 0;
    #3 start = 1;
    #1000 $finish;
end
always #5 clk = ~clk;

initial begin
    #2 data_in = 143;
    #10 data_in = 78;
end
initial begin
    $monitor($time, " A: %d, B: %d, Done: %b", d1.Aout, d1.Bout, done);
    $dumpfile("GCD.vcd");
    $dumpvars(0, tb);
end
endmodule
