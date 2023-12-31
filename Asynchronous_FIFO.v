module Asynchronous_FIFO #(parameter DSIZE = 8,
 parameter ASIZE = 4)
 (output [DSIZE-1:0] rdata,
 output wfull,
 output rempty,
 input [DSIZE-1:0] wdata,
 input winc, wclk, wrst_n,
 input rinc, rclk, rrst_n);
 wire [ASIZE-1:0] waddr, raddr;
 wire [ASIZE:0] wptr, rptr, wq2_rptr, rq2_wptr;
 synchro_r2W synchro_r2w(.wq2_rptr(wq2_rptr), .rptr(rptr),
 .wclk(wclk), .wrst_n(wrst_n));
 synchro_W2r synchro_W2r1(.rq2_wptr(rq2_wptr), .wptr(wptr),
 .rclk(rclk), .rrst_n(rrst_n));
 fifomem #(DSIZE, ASIZE) fifomem
 (.rdata(rdata), .wdata(wdata),
 .waddr(waddr), .raddr(raddr),
 .wclken(winc), .wfull(wfull),
 .wclk(wclk));
 readptr_empty #(ASIZE) rptr_empty
 (.rempty(rempty),
 .raddr(raddr),
 .rptr(rptr), .rq2_wptr(rq2_wptr),
 .rinc(rinc), .rclk(rclk),
 .rrst_n(rrst_n));
 writeptr_full #(ASIZE) wptr_full
 (.wfull(wfull), .waddr(waddr),
 .wptr(wptr), .wq2_rptr(wq2_rptr),
 .winc(winc), .wclk(wclk),
 .wrst_n(wrst_n));
endmodule
