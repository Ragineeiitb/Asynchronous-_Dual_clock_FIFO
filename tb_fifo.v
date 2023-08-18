`timescale 10ns/1ps
module tb_fifo;
reg rclk=1'b0;
reg wclk=1'b0;
reg wrst_n,rrst_n,winc,rinc;
reg [7:0] wdata;
wire wfull,rempty;
wire [7:0] rdata;

 Asynchronous_FIFO dutoutput ( rdata,
  wfull,
  rempty,
  wdata,
  winc, wclk, wrst_n,
  rinc, rclk, rrst_n);
 
 always rclk= # 7 ~rclk;
 
 always wclk= #5 ~wclk;
 
 initial
 begin
 
 #14 wrst_n=1'b0; rrst_n=1'b0;
 #12 wdata=8'h12;wrst_n=1'b1; rrst_n=1'b1;winc=1'b1;rinc=1'b1;
 #12 wdata=8'h13;
  #12 wdata=8'h14;

   #12 wdata=8'h15;

	 #12 wdata=8'h21;

	  #12 wdata=8'h22;

	   #12 wdata=8'h23;
 #12 wdata=8'h24;
 #12 wdata=8'h25;
 #12 wdata=8'h26;
 #12 wdata=8'h27;
 #12 wdata=8'h28;
 #12 wdata=8'h29;
 #12 wdata=8'h30;
 #12 wdata=8'h31;
 #12 wdata=8'h32;
 #12 wdata=8'h33;
 #12 wdata=8'h34;
 #12 wdata=8'h35;
 #12 wdata=8'h36;
# 200   $finish;
 end

endmodule
