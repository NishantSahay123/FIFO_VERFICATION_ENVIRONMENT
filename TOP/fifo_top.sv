module fifo_top();
  
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  
  import fifo_pkg::*;

  bit clk;
  
  fifo_inf inf(clk);
  
  //dut instantiation
  FIFO DUT (.clk(inf.clk),
			.rst(inf.rst),
			.wr_en(inf.wr_enb),
			.rd_en(inf.rd_enb),
			.data_in(inf.fifo_in),
			.data_out(inf.fifo_out),
			.empty(inf.empty),
			.full(inf.full),
			.p_empty(inf.p_empty),
			.p_full(inf.p_full),
			.f_count(inf.f_counter),
			.overflow(inf.overflow),
			.underflow(inf.underflow) );
  always
  
   #5 clk = ~clk;
   
   initial begin
	 uvm_config_db #(virtual fifo_inf)::set(null,"*","vif",inf);
     run_test();
	 $finish;
   end
   
endmodule