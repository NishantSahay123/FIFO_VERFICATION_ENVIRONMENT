class fifo_monitor extends uvm_monitor;
	
	`uvm_component_utils(fifo_monitor);
	
	fifo_trans trans_h; 
	
	virtual fifo_inf.mon_cb vif;
	
	uvm_analysis_port #(fifo_trans) wan_port;
	uvm_analysis_port #(fifo_trans) ran_port;
	
	function new(string name = "fifo_monitor", uvm_component parent=null);
	super.new(name, parent);
	endfunction
	
	function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	ran_port = new("ran_port", this);
	wan_port = new("wan_port", this);
	endfunction 
	
	task run_phase(uvm_phase phase);
	forever 
	monitor();
	endtask
	
	task monitor();
	trans_h = fifo_trans::type_id::create("trans_h");
	trans_h.rst 		= vif.mon_cb.rst;
	
	//write 
	trans_h.wr_enb 		= vif.mon_cb.wr_enb;
	trans_h.fifo_in 	= vif.mon_cb.fifo_in;
	trans_h.full 		= vif.mon_cb.full;
	trans_h.p_full 		= vif.mon_cb.p_full;
	trans_h.overflow	= vif.mon_cb.overflow;
	trans_h.f_counter 	= vif.mon_cb.f_counter;	
	wan_port.write(trans_h);
	
	//read
	trans_h.rd_enb 		= vif.mon_cb.rd_enb;
	trans_h.empty 		= vif.mon_cb.empty;
	trans_h.p_empty 	= vif.mon_cb.p_empty;
	trans_h.underflow	= vif.mon_cb.underflow;
	@(vif.mon_cb);
	trans_h.fifo_out 	= vif.mon_cb.fifo_out;
	ran_port.write(trans_h);
	
	endtask 

endclass 