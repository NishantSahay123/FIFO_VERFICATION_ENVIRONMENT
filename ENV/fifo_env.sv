class fifo_env extends uvm_env;
	
	`uvm_component_utils(fifo_env)
	
	fifo_agent 	agnh;
	fifo_sb  	scbh;
	fifo_virtual_seqr vseqr_h;
   
	function new (string name = "fifo_env", uvm_component parent=null);
	super.new(name,parent);
	endfunction
  
	function void build_phase (uvm_phase phase);
    super.build_phase(phase);
	agnh = fifo_agent::type_id::create("agnh", this);
	scbh = fifo_sb::type_id::create("scbh", this);
	vseqr_h  = fifo_virtual_seqr::type_id::create("vseqr_h", this);
 	endfunction
  
	function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	agnh.monh.wan_port.connect(scbh.wan_imp);
	agnh.monh.ran_port.connect(scbh.ran_imp);
	vseqr_h.seqr_h = agnh.seqh;
	endfunction  
 
endclass 