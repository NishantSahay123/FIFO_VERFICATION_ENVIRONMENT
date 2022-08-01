class fifo_base_test extends uvm_test;
 
  `uvm_component_utils(fifo_base_test)

  fifo_env env_h;
  
  function new (string name = "fifo_base_test", uvm_component parent=null);
	  super.new(name,parent);
   endfunction
   
  function void build_phase (uvm_phase phase);
     super.build_phase(phase);
	 env_h 	= fifo_env::type_id::create("env_h",this);
  endfunction
  
endclass