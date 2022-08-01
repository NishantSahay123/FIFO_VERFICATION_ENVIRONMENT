class fifo_write_rst_test extends fifo_base_test;
 
  `uvm_component_utils(fifo_write_rst_test)

  fifo_write_rst_vseqs vseqsh;
  
  function new(string name = " ", uvm_component parent=null);
  super.new(name, parent);
  endfunction 
  
  //------------------
  //Build Phase 
  //------------------
  function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  vseqsh = fifo_write_rst_vseqs::type_id::create("vseqsh");
  endfunction 
  
  //-----------------
  //Run Phase 
  //-----------------
  task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  vseqsh.start(env_h.vseqr_h);
  phase.drop_objection(this);
  endtask 
  
endclass