package fifo_pkg;
  
  shortint no_of_trans = 100;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "global_define.sv"
  
  `include "fifo_trans.sv"  
  `include "fifo_base_seqs.sv"  
  `include "fifo_seqr.sv"  
  `include "fifo_driver.sv"  
  `include "fifo_monitor.sv"  
  `include "fifo_agent.sv"  
  `include "fifo_sb.sv"  
  `include "fifo_virtual_seqr.sv"
  `include "fifo_base_vseqs.sv"
  `include "fifo_env.sv"  
  `include "fifo_base_test.sv"
  
  //test cases 
  
  //simple test 
  `include "fifo_simple_seqs.sv"
  `include "fifo_simple_vseqs.sv"
  `include "fifo_simple_test.sv"
  
  //write reset 
  `include "fifo_write_rst_seqs.sv"
  `include "fifo_write_rst_vseqs.sv"
  `include "fifo_write_rst_test.sv"
  
  //read reset 
  `include "fifo_read_rst_seqs.sv"
  `include "fifo_read_rst_vseqs.sv"
  `include "fifo_read_rst_test.sv"
    
endpackage