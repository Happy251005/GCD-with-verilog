module control(output reg ldA, ldB, sel1, sel2, sel_in, done, input clk,eq,lt,gt,start);
reg [2:0] state=0;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;
always @(posedge clk) begin
    case (state)
        S0: if (start) state <= S1;
        S1: state <= S2;
        S2:  #2 if (eq) state <= S5; else if(lt) state <= S3; else if(gt) state <= S4;
        S3:  #2 if (eq) state <= S5; else if(lt) state <= S3; else if(gt) state <= S4;
        S4:  #2 if (eq) state <= S5; else if(lt) state <= S3; else if(gt) state <= S4;
        S5: state <= S3;
    endcase
end
always @(state) begin
    case (state)
        S0: begin
            ldA = 1; ldB = 0; sel1 = 0; sel2 = 0; sel_in = 0; done = 0;
        end
        S1: begin
            ldA = 0; ldB = 1; sel1 = 0; sel2 = 0; sel_in = 0; done = 0;
        end
        S2: begin
            if(eq) done = 1;
            else if(lt) begin
                sel1 = 1; sel2 = 0; sel_in = 1;
                #1 ldA = 0; ldB = 1;
            end
            else if(gt) begin
                sel1 = 0; sel2 = 1; sel_in = 1;
                #1 ldA = 1; ldB = 0;
            end
        end
        S3: begin
            if(eq) done = 1;
            else if(lt) begin
                sel1 = 1; sel2 = 0; sel_in = 1;
                #1 ldA = 0; ldB = 1;
            end
            else if(gt) begin
                sel1 = 0; sel2 = 1; sel_in = 1;
                #1 ldA = 1; ldB = 0;
            end
        end
        S4: begin
            if(eq) done = 1;
            else if(lt) begin
                sel1 = 1; sel2 = 0; sel_in = 1;
                #1 ldA = 0; ldB = 1;
            end
            else if(gt) begin
                sel1 = 0; sel2 = 1; sel_in = 1;
                #1 ldA = 1; ldB = 0;
            end
        end
        S5: begin
            ldA = 0; ldB = 0; sel1 = 0; sel2 = 0; sel_in = 0; done = 1;
        end
    endcase
end
endmodule
