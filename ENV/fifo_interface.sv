`include "global_define.sv"

interface fifo_inf(input bit clk);
   
   logic rst;
   
   //write
   logic wr_enb;
   logic [`DATA_WIDTH-1:0] fifo_in;
   
   //read
   logic rd_enb;
   logic [`DATA_WIDTH-1:0] fifo_out;
   
   //flags 
   logic empty, full, p_empty, p_full;
   logic overflow, underflow;
   
   //counter
   logic [`FIFO_WIDTH-1:0] f_counter;
   
   //driver
   clocking drv_cb@(posedge clk);
    default input #1 output #1;
	output rst;
	output wr_enb;
	output fifo_in;
	output rd_enb;
   endclocking
   
   //monitor
   clocking mon_cb@(posedge clk);
    default input #1 output #1;
	input rst;
	input wr_enb, fifo_in;
	input full, p_full;
	input overflow;
	input f_counter;	
	input rd_enb, fifo_out;
	input empty, p_empty;
	input underflow;
   endclocking
    
   modport DRV_MP (clocking drv_cb);
   modport MON_MP (clocking mon_cb);

endinterface 