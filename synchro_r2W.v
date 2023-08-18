module synchro_r2W #(parameter ADDRSIZE = 4)
 (output reg [ADDRSIZE:0] wq2_rptr,
 input [ADDRSIZE:0] rptr,
 input wclk, wrst_n);
 reg [ADDRSIZE:0] wq1_rptr;
 always @(posedge wclk or negedge wrst_n)
 if (!wrst_n) 
 begin
 wq2_rptr<= 0;
 wq1_rptr<=0;
 end
 else begin 
 wq1_rptr <= rptr;
 wq2_rptr<=wq1_rptr;
 end
endmodule
