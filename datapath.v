module datapath(output eq,lt,gt, input ldA,ldB,sel1,sel2,sel_in,clk, input [15:0] data_in);
wire[15:0] Aout,Bout,subOut,X,Y,bus;

pipo A(
    .data_in(bus),
    .data_out(Aout),
    .ld(ldA),
    .clk(clk)
);
pipo B(
    .data_in(bus),
    .data_out(Bout),
    .ld(ldB),
    .clk(clk)
);
mux m1(
    .sel(sel1),
    .data_in1(Aout),
    .data_in2(Bout),
    .data_out(X)
);
mux m2(
    .sel(sel2),
    .data_in1(Aout),
    .data_in2(Bout),
    .data_out(Y)
);
mux m3(
    .sel(sel_in),
    .data_in1(data_in),
    .data_in2(subOut),
    .data_out(bus)
);
comp c1(
    .A(Aout),
    .B(Bout),
    .eq(eq),
    .lt(lt),
    .gt(gt)
);
subb sub(
    .A(X),
    .B(Y),
    .sub_out(subOut)
);
endmodule
